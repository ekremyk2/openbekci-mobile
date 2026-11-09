import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/cache/cached.dart';
import 'package:openbekci_mobile/core/l10n/codes.dart';
import 'package:openbekci_mobile/core/org/org_context.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/core/widgets/cached_view.dart';
import 'package:openbekci_mobile/core/widgets/display.dart';
import 'package:openbekci_mobile/core/widgets/resident_widgets.dart';
import 'package:openbekci_mobile/core/widgets/states.dart';
import 'package:openbekci_mobile/features/community/application/community_providers.dart';
import 'package:openbekci_mobile/features/documents/presentation/documents_screens.dart';
import 'package:openbekci_mobile/features/governance/application/governance_providers.dart';
import 'package:openbekci_mobile/features/governance/domain/governance_logic.dart';
import 'package:openbekci_mobile/features/push/application/web_link.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';
import 'package:qr_flutter/qr_flutter.dart';

String meetingKindLabel(AppLocalizations l, MeetingKindEnum k) => switch (k) {
  MeetingKindEnum.generalAssembly => l.meetingKindGeneral,
  MeetingKindEnum.extraordinary => l.meetingKindExtraordinary,
  MeetingKindEnum.unknownDefaultOpenApi => l.meetingKindGeneral,
};

String meetingStatusLabel(AppLocalizations l, MeetingStatusEnum s) =>
    switch (s) {
      MeetingStatusEnum.draft => l.meetingStatusDraft,
      MeetingStatusEnum.called => l.meetingStatusCalled,
      MeetingStatusEnum.inSession => l.meetingStatusInSession,
      MeetingStatusEnum.closed => l.meetingStatusClosed,
      MeetingStatusEnum.cancelled => l.meetingStatusCancelled,
      MeetingStatusEnum.unknownDefaultOpenApi => l.valueOther,
    };

String decisionOutcomeLabel(AppLocalizations l, DecisionOutcomeEnum o) =>
    switch (o) {
      DecisionOutcomeEnum.accepted => l.outcomeAccepted,
      DecisionOutcomeEnum.rejected => l.outcomeRejected,
      DecisionOutcomeEnum.noVote => l.outcomeNoVote,
      DecisionOutcomeEnum.noted => l.outcomeNoted,
      DecisionOutcomeEnum.unknownDefaultOpenApi => l.valueOther,
    };

/// The assemblies: the upcoming one first, the decision record, the past ones
/// (G1, G2, G4).
class AssemblyScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    final now = ref.watch(nowProvider)();
    final tz = ctx?.timezone ?? 'UTC';
    Widget tile(Meeting m) => Card(
      key: Key('meeting_${m.id}'),
      child: ListTile(
        leading: const Icon(Icons.groups_outlined),
        title: Text(m.title ?? meetingKindLabel(l, m.kind)),
        subtitle: Wrap(
          spacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SiteDate(instant: m.scheduledAt, timezone: tz, withTime: true),
            Pill(
              meetingStatusLabel(l, m.status),
              tone: m.status == MeetingStatusEnum.called
                  ? PillTone.good
                  : PillTone.neutral,
            ),
          ],
        ),
        onTap: () => context.push('/more/assembly/${m.id}'),
      ),
    );
    return Scaffold(
      appBar: AppBar(title: Text(l.assemblyTitle)),
      body: CachedView<List<Meeting>>(
        provider: meetingsProvider,
        header: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
          child: Card(
            child: ListTile(
              key: const Key('openDecisions'),
              leading: const Icon(Icons.gavel_outlined),
              title: Text(l.decisionsTitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push('/more/assembly/decisions'),
            ),
          ),
        ),
        isEmpty: (list) =>
            upcomingMeetings(list, now).isEmpty &&
            pastMeetings(list, now).isEmpty,
        emptyIcon: Icons.groups_outlined,
        emptyMessage: l.assemblyEmpty,
        builder: (context, list) {
          final upcoming = upcomingMeetings(list, now);
          final past = pastMeetings(list, now);
          return [
            SectionTitle(l.assemblyUpcoming),
            if (upcoming.isEmpty)
              Text(l.homeNoAssembly, key: const Key('noUpcoming'))
            else
              for (final m in upcoming) tile(m),
            if (past.isNotEmpty) ...[
              SectionTitle(l.assemblyPast),
              for (final m in past) tile(m),
            ],
            const OpenInWebTile(tail: '/meetings'),
          ];
        },
      ),
    );
  }
}

/// One assembly: when and where, the agenda, the call letter, pre-meeting
/// polls, the owner's check-in QR, the minutes.
class MeetingScreen extends ConsumerStatefulWidget {
  const new({required this.meetingId, super.key});

  final String meetingId;

  @override
  ConsumerState<MeetingScreen> createState() => _MeetingState();
}

class _MeetingState extends ConsumerState<MeetingScreen> {
  /// What this device answered, by `agenda:unit` (the contract returns only
  /// which units answered, not the answer).
  final _answers = <String, PollAnswerSetAnswerEnum>{};
  bool _busy = false;
  AppError? _error;

  Future<void> _answer(
    String agendaItemId,
    String unitId,
    PollAnswerSetAnswerEnum answer,
  ) async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await answerPoll(
        ref,
        meetingId: widget.meetingId,
        agendaItemId: agendaItemId,
        unitId: unitId,
        answer: answer,
      );
      if (mounted) setState(() => _answers['$agendaItemId:$unitId'] = answer);
    } on Object catch (e) {
      if (mounted) setState(() => _error = AppError.from(e));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _openCallLetter(BuildContext context, String orgId) async {
    final l = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final router = GoRouter.of(context);
    final api = ref.read(apiProvider);
    if (api == null) return;
    try {
      // The generic letter: a personal one (`person_id`) would issue a new
      // check-in token and void the one shown on this screen.
      final bytes = await api.getBytes(
        '/v1/orgs/$orgId/meetings/${widget.meetingId}/call-letter',
      );
      unawaited(
        router.push<void>(
          '/more/pdf',
          extra: PdfArgs(bytes: bytes, name: 'call-letter.pdf'),
        ),
      );
    } on Object catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text(errorMessage(l, AppError.from(e)))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    final async = ref.watch(meetingDetailProvider(widget.meetingId));
    final detail = async.value?.data;
    if (detail == null || ctx == null) {
      final err = async.value?.error;
      return Scaffold(
        appBar: AppBar(title: Text(l.assemblyTitle)),
        body: err != null
            ? ErrorState(
                error: err,
                onRetry: () =>
                    ref.invalidate(meetingDetailProvider(widget.meetingId)),
              )
            : const SkeletonList(),
      );
    }
    final meeting = detail.meeting;
    final now = ref.watch(nowProvider)();
    final eligible = pollEligibleUnits(detail.my, ctx.occupancies);
    final owner = isOwnerIn(ctx.occupancies);
    final qr = checkInQrPayload(detail.my);
    final agenda = [...detail.agenda]
      ..sort((a, b) => a.position.compareTo(b.position));
    return Scaffold(
      appBar: AppBar(
        title: Text(meeting.title ?? meetingKindLabel(l, meeting.kind)),
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            refreshCached(ref, meetingDetailProvider(widget.meetingId)),
        child: ListView(
          padding: const EdgeInsetsDirectional.all(16),
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            if (async.value?.isOffline ?? false) const OfflineBanner(),
            Wrap(
              spacing: 8,
              children: [
                Pill(meetingKindLabel(l, meeting.kind)),
                Pill(
                  meetingStatusLabel(l, meeting.status),
                  tone: meeting.status == MeetingStatusEnum.called
                      ? PillTone.good
                      : PillTone.neutral,
                ),
              ],
            ),
            const SizedBox(height: 12),
            _InfoRow(
              icon: Icons.schedule,
              label: l.meetingWhen,
              child: SiteDate(
                instant: meeting.scheduledAt,
                timezone: ctx.timezone,
                withTime: true,
              ),
            ),
            _InfoRow(
              icon: Icons.update,
              label: l.meetingSecondCall,
              child: SiteDate(
                instant: meeting.secondCallAt,
                timezone: ctx.timezone,
                withTime: true,
              ),
            ),
            _InfoRow(
              icon: Icons.place_outlined,
              label: l.meetingWhere,
              child: Text(meeting.location),
            ),
            if (meeting.callLetterDocumentId != null)
              Card(
                child: ListTile(
                  key: const Key('callLetter'),
                  leading: const Icon(Icons.mail_outline),
                  title: Text(l.meetingCallLetter),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _openCallLetter(context, ctx.orgId),
                ),
              ),
            SectionTitle(l.meetingAgenda),
            if (agenda.isEmpty)
              Text(l.meetingAgendaEmpty)
            else
              for (final item in agenda)
                ListTile(
                  key: Key('agenda_${item.id}'),
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    radius: 14,
                    child: Text('${item.position}'),
                  ),
                  title: Text(item.title),
                  subtitle:
                      item.description == null || item.description!.isEmpty
                      ? null
                      : Text(item.description!),
                  trailing: item.willBeVoted ? Pill(l.agendaVoted) : null,
                ),
            if (detail.my.polls.isNotEmpty) ...[
              SectionTitle(l.pollsTitle),
              Text(
                owner ? l.pollsNonBinding : l.pollsOwnersOnly,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              if (_error != null)
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 8),
                  child: Text(
                    errorMessage(l, _error!),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              for (final p in detail.my.polls)
                _PollCard(
                  poll: p,
                  detail: detail.polls[p.agendaItemId],
                  now: now,
                  eligible: eligible,
                  answers: _answers,
                  busy: _busy,
                  onAnswer: _answer,
                ),
            ],
            if (qr != null) ...[
              SectionTitle(l.checkInTitle),
              Card(
                key: const Key('checkInCard'),
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(16),
                  child: Column(
                    children: [
                      if (detail.my.checkedIn)
                        Pill(l.checkInDone, tone: PillTone.good)
                      else
                        Text(
                          meeting.status == MeetingStatusEnum.inSession
                              ? l.checkInOpen
                              : l.checkInNotYet,
                          textAlign: TextAlign.center,
                        ),
                      const SizedBox(height: 12),
                      Semantics(
                        label: l.checkInQrLabel,
                        image: true,
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(12),
                          child: QrImageView(
                            key: const Key('checkInQr'),
                            data: qr,
                            size: 220,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            if (meeting.minutesDocumentId != null) ...[
              SectionTitle(l.minutesTitle),
              _MinutesTile(meetingId: meeting.id),
            ],
            Card(
              child: ListTile(
                key: const Key('meetingDecisions'),
                leading: const Icon(Icons.gavel_outlined),
                title: Text(l.decisionsTitle),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push(
                  '/more/assembly/decisions?meeting=${meeting.id}',
                ),
              ),
            ),
            OpenInWebTile(tail: '/meetings/${meeting.id}'),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const new({required this.icon, required this.label, required this.child});

  final IconData icon;
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsetsDirectional.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 8),
        Text('$label: ', style: Theme.of(context).textTheme.bodySmall),
        Expanded(child: child),
      ],
    ),
  );
}

class _PollCard extends StatelessWidget {
  const new({
    required this.poll,
    required this.detail,
    required this.now,
    required this.eligible,
    required this.answers,
    required this.busy,
    required this.onAnswer,
  });

  final MyPoll poll;
  final Poll? detail;
  final DateTime now;
  final List<MeOccupancy> eligible;
  final Map<String, PollAnswerSetAnswerEnum> answers;
  final bool busy;
  final Future<void> Function(
    String agendaItemId,
    String unitId,
    PollAnswerSetAnswerEnum answer,
  )
  onAnswer;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final phase = detail == null ? PollPhase.notOpen : pollPhase(detail!, now);
    String answerLabel(PollAnswerSetAnswerEnum a) => switch (a) {
      PollAnswerSetAnswerEnum.yes => l.pollYes,
      PollAnswerSetAnswerEnum.no => l.pollNo,
      PollAnswerSetAnswerEnum.abstain => l.pollAbstain,
      PollAnswerSetAnswerEnum.unknownDefaultOpenApi => l.valueOther,
    };
    return Card(
      key: Key('poll_${poll.agendaItemId}'),
      child: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    detail?.question ?? poll.title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Pill(
                  switch (phase) {
                    PollPhase.open => l.pollOpen,
                    PollPhase.closed => l.pollClosed,
                    PollPhase.notOpen => l.pollNotOpen,
                  },
                  tone: phase == PollPhase.open
                      ? PillTone.good
                      : PillTone.neutral,
                ),
              ],
            ),
            if (detail != null && phase == PollPhase.open)
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 4),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      '${l.pollClosesAt} ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Consumer(
                      builder: (context, ref, _) => SiteDate(
                        instant: detail!.closesAt,
                        timezone:
                            ref.watch(orgContextProvider)?.timezone ?? 'UTC',
                        withTime: true,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 8),
            if (eligible.isEmpty)
              Text(
                l.pollsOwnersOnly,
                key: Key('pollNoAnswer_${poll.agendaItemId}'),
              )
            else
              for (final u in eligible)
                _UnitAnswer(
                  agendaItemId: poll.agendaItemId,
                  unit: u,
                  answered:
                      poll.answeredUnits.contains(u.unitId) ||
                      answers.containsKey('${poll.agendaItemId}:${u.unitId}'),
                  selected: answers['${poll.agendaItemId}:${u.unitId}'],
                  enabled:
                      canAnswerPoll(
                        phase: phase,
                        unitId: u.unitId,
                        eligible: eligible,
                      ) &&
                      !busy,
                  label: answerLabel,
                  onAnswer: onAnswer,
                ),
          ],
        ),
      ),
    );
  }
}

class _UnitAnswer extends StatelessWidget {
  const new({
    required this.agendaItemId,
    required this.unit,
    required this.answered,
    required this.selected,
    required this.enabled,
    required this.label,
    required this.onAnswer,
  });

  final String agendaItemId;
  final MeOccupancy unit;
  final bool answered;
  final PollAnswerSetAnswerEnum? selected;
  final bool enabled;
  final String Function(PollAnswerSetAnswerEnum) label;
  final Future<void> Function(String, String, PollAnswerSetAnswerEnum) onAnswer;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(unit.unitLabel)),
              if (answered) Pill(l.pollAnswered, tone: PillTone.good),
            ],
          ),
          Wrap(
            spacing: 8,
            children: [
              for (final a in const [
                PollAnswerSetAnswerEnum.yes,
                PollAnswerSetAnswerEnum.no,
                PollAnswerSetAnswerEnum.abstain,
              ])
                ChoiceChip(
                  key: Key('answer_${agendaItemId}_${unit.unitId}_${a.value}'),
                  label: Text(label(a)),
                  selected: selected == a,
                  onSelected: enabled
                      ? (_) => onAnswer(agendaItemId, unit.unitId, a)
                      : null,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MinutesTile extends ConsumerWidget {
  const new({required this.meetingId});

  final String meetingId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final minutes = ref.watch(minutesProvider(meetingId));
    return minutes.when(
      loading: () => const SkeletonBox(height: 56),
      error: (e, _) => ListTile(
        key: const Key('minutesError'),
        leading: const Icon(Icons.error_outline),
        title: Text(errorMessage(l, AppError.from(e))),
        trailing: TextButton(
          onPressed: () => ref.invalidate(minutesProvider(meetingId)),
          child: Text(l.actionRetry),
        ),
      ),
      data: (m) => m == null
          ? Text(l.minutesNone)
          : Card(
              child: ListTile(
                key: const Key('minutesTile'),
                leading: const Icon(Icons.picture_as_pdf_outlined),
                title: Text(l.minutesOpen),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => openFileById(
                  context,
                  ref,
                  fileId: m.fileId,
                  name: 'minutes.pdf',
                  mime: 'application/pdf',
                ),
              ),
            ),
    );
  }
}

/// The decision record: outcome, the decision text, for the whole site or one
/// meeting. Owners see all; tenants and household members only the decisions
/// marked as concerning residents (G4).
class DecisionsScreen extends ConsumerWidget {
  const new({this.meetingId, super.key});

  final String? meetingId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    final owner = isOwnerIn(ctx?.occupancies ?? const []);
    return Scaffold(
      appBar: AppBar(title: Text(l.decisionsTitle)),
      body: CachedView<List<Decision>>(
        provider: decisionsProvider,
        isEmpty: (list) => _visible(list, owner).isEmpty,
        emptyIcon: Icons.gavel_outlined,
        emptyMessage: l.decisionsEmpty,
        builder: (context, list) => [
          if (!owner)
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 8),
              child: Text(
                l.decisionsResidentsOnly,
                key: const Key('residentsOnlyNote'),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          for (final d in _visible(list, owner))
            Card(
              key: Key('decision_${d.id}'),
              child: ExpansionTile(
                title: Text(l.decisionNumber(d.year, d.sequenceNo)),
                subtitle: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Pill(
                    decisionOutcomeLabel(l, d.outcome),
                    tone: switch (d.outcome) {
                      DecisionOutcomeEnum.accepted => PillTone.good,
                      DecisionOutcomeEnum.rejected => PillTone.bad,
                      _ => PillTone.neutral,
                    },
                  ),
                ),
                childrenPadding: const EdgeInsetsDirectional.all(16),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(d.text),
                  if (d.concernsResidents)
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 8),
                      child: Pill(l.decisionConcernsResidents),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  List<Decision> _visible(List<Decision> all, bool owner) =>
      decisionsVisibleTo([
        for (final d in all)
          if (meetingId == null || d.meetingId == meetingId) d,
      ], isOwner: owner);
}
