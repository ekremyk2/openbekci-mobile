import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/l10n/codes.dart';
import 'package:openbekci_mobile/core/l10n/format.dart';
import 'package:openbekci_mobile/core/org/org_context.dart';
import 'package:openbekci_mobile/core/services/services.dart';
import 'package:openbekci_mobile/core/widgets/cached_view.dart';
import 'package:openbekci_mobile/core/widgets/display.dart';
import 'package:openbekci_mobile/core/widgets/form_support.dart';
import 'package:openbekci_mobile/core/widgets/resident_widgets.dart';
import 'package:openbekci_mobile/core/widgets/states.dart';
import 'package:openbekci_mobile/features/community/application/community_providers.dart';
import 'package:openbekci_mobile/features/community/domain/booking_logic.dart';
import 'package:openbekci_mobile/features/community/domain/visitors_logic.dart';
import 'package:openbekci_mobile/features/community/presentation/booking_widgets.dart';
import 'package:openbekci_mobile/features/profile/application/profile_providers.dart';
import 'package:openbekci_mobile/features/push/application/web_link.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// Visitors: pending approval requests on top, then expected visitors,
/// recurring visitors and the history (C2).
class VisitorsScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l.visitorsTitle),
          bottom: TabBar(
            tabs: [
              Tab(key: const Key('tabExpected'), text: l.visitorsExpected),
              Tab(key: const Key('tabRecurring'), text: l.visitorsRecurring),
              Tab(key: const Key('tabHistory'), text: l.visitorsHistory),
            ],
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) {
            final tabs = DefaultTabController.of(context);
            return ListenableBuilder(
              listenable: tabs,
              builder: (context, _) => FloatingActionButton.extended(
                key: const Key('addVisitor'),
                icon: const Icon(Icons.add),
                label: Text(
                  tabs.index == 1 ? l.visitorAddRecurring : l.visitorAdd,
                ),
                onPressed: () => context.push(
                  tabs.index == 1
                      ? '/more/visitors/recurring/new'
                      : '/more/visitors/new',
                ),
              ),
            );
          },
        ),
        body: const TabBarView(
          children: [_ExpectedTab(), _RecurringTab(), _HistoryTab()],
        ),
      ),
    );
  }
}

class _PendingRequests extends ConsumerWidget {
  const new();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final now = ref.watch(nowProvider)();
    final requests =
        ref.watch(approvalRequestsProvider).value?.data ?? const [];
    final pending = [
      for (final r in requests)
        if (approvalPhase(r, now) == ApprovalPhase.pending) r,
    ];
    if (pending.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final r in pending)
          Card(
            key: Key('pendingRequest_${r.id}'),
            color: Theme.of(context).colorScheme.tertiaryContainer,
            child: ListTile(
              leading: const Icon(Icons.how_to_reg_outlined),
              title: Text(l.visitorWaitingAtGate(r.visitorName)),
              subtitle: Text(l.visitorRequestUnit(r.unitDoorNumber)),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push('/more/visitors/requests/${r.id}'),
            ),
          ),
      ],
    );
  }
}

class _ExpectedTab extends ConsumerWidget {
  const new();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    final now = ref.watch(nowProvider)();
    return CachedView<List<VisitorEntry>>(
      provider: visitorEntriesProvider,
      header: const _PendingRequests(),
      isEmpty: (list) => expectedVisitors(list, now).isEmpty,
      emptyIcon: Icons.badge_outlined,
      emptyMessage: l.visitorsEmpty,
      builder: (context, list) => [
        for (final e in expectedVisitors(list, now))
          _EntryTile(entry: e, timezone: ctx?.timezone ?? 'UTC'),
        const OpenInWebTile(tail: '/visitors'),
      ],
    );
  }
}

class _HistoryTab extends ConsumerWidget {
  const new();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    final now = ref.watch(nowProvider)();
    return CachedView<List<VisitorEntry>>(
      provider: visitorEntriesProvider,
      isEmpty: (list) => visitorHistory(list, now).isEmpty,
      emptyIcon: Icons.history,
      emptyMessage: l.visitorsHistoryEmpty,
      builder: (context, list) => [
        for (final e in visitorHistory(list, now))
          _EntryTile(entry: e, timezone: ctx?.timezone ?? 'UTC', now: now),
      ],
    );
  }
}

String _approvalLabel(AppLocalizations l, VisitorEntryApprovalStatusEnum s) =>
    switch (s) {
      VisitorEntryApprovalStatusEnum.preApproved => l.visitorStatusPreApproved,
      VisitorEntryApprovalStatusEnum.requested => l.visitorStatusRequested,
      VisitorEntryApprovalStatusEnum.approved => l.visitorStatusApproved,
      VisitorEntryApprovalStatusEnum.denied => l.visitorStatusDenied,
      VisitorEntryApprovalStatusEnum.expired => l.visitorStatusExpired,
      VisitorEntryApprovalStatusEnum.unknownDefaultOpenApi => l.valueOther,
    };

class _EntryTile extends StatelessWidget {
  const new({required this.entry, required this.timezone, this.now});

  final VisitorEntry entry;
  final String timezone;
  final DateTime? now;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final e = entry;
    final cancelled = e.cancelled;
    return Card(
      key: Key('visitor_${e.id}'),
      child: ListTile(
        leading: const Icon(Icons.badge_outlined),
        title: Text(e.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SiteRange(start: e.windowFrom, end: e.windowTo, timezone: timezone),
            Wrap(
              spacing: 8,
              children: [
                if (e.plate != null && e.plate!.isNotEmpty) Text(e.plate!),
                Pill(
                  cancelled
                      ? l.visitorCancelled
                      : e.arrivedAt != null
                      ? l.visitorArrived
                      : _approvalLabel(l, e.approvalStatus),
                  tone:
                      cancelled ||
                          e.approvalStatus ==
                              VisitorEntryApprovalStatusEnum.denied
                      ? PillTone.bad
                      : PillTone.neutral,
                ),
                if (e.source_ == VisitorEntrySource_Enum.walkIn)
                  Pill(l.visitorWalkIn),
                if (e.source_ == VisitorEntrySource_Enum.recurring)
                  Pill(l.visitorsRecurring),
              ],
            ),
          ],
        ),
        isThreeLine: true,
        trailing:
            e.source_ == VisitorEntrySource_Enum.preRegistered &&
                visitorQrPayload(e.qrToken) != null &&
                !cancelled
            ? const Icon(Icons.qr_code_2)
            : null,
        onTap: e.source_ == VisitorEntrySource_Enum.preRegistered
            ? () => context.push('/more/visitors/entry/${e.id}')
            : null,
      ),
    );
  }
}

class _RecurringTab extends ConsumerWidget {
  const new();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    return CachedView<List<RecurringVisitor>>(
      provider: recurringVisitorsProvider,
      isEmpty: (list) => list.isEmpty,
      emptyIcon: Icons.repeat,
      emptyMessage: l.recurringEmpty,
      builder: (context, list) => [
        for (final r in list)
          Card(
            key: Key('recurring_${r.id}'),
            child: ListTile(
              leading: const Icon(Icons.repeat),
              title: Text(r.name),
              subtitle: Wrap(
                spacing: 8,
                children: [
                  Text('${weekdaysLabel(r.days, locale)} ${r.start}–${r.end}'),
                  Pill(
                    switch (r.status) {
                      RecurringVisitorStatusEnum.active => l.recurringActive,
                      RecurringVisitorStatusEnum.revoked => l.recurringRevoked,
                      RecurringVisitorStatusEnum.expired => l.recurringExpired,
                      RecurringVisitorStatusEnum.unknownDefaultOpenApi =>
                        l.valueOther,
                    },
                    tone: r.status == RecurringVisitorStatusEnum.active
                        ? PillTone.good
                        : PillTone.neutral,
                  ),
                ],
              ),
              onTap: () => context.push('/more/visitors/recurring/${r.id}'),
            ),
          ),
      ],
    );
  }
}

/// Window durations offered when pre-registering.
const visitDurations = [60, 120, 180, 240, 360, 480, 720];

/// Pre-register a visitor: name, plate, day and time window. The server issues
/// the QR token; the next screen shows and shares it.
class NewVisitorScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<NewVisitorScreen> createState() => _NewVisitorState();
}

class _NewVisitorState extends ConsumerState<NewVisitorScreen>
    with SubmitState {
  final _name = TextEditingController();
  final _plate = TextEditingController();
  SiteDay? _day;
  int _startMinute = -1;
  int _duration = 120;
  String? _unitId;

  @override
  void dispose() {
    _name.dispose();
    _plate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final ctx = ref.watch(orgContextProvider);
    if (ctx == null) return const Scaffold(body: SkeletonList());
    final now = ref.watch(nowProvider)();
    final today = siteDayOf(now, ctx.timezone);
    final day = _day ?? today;
    final local = inSiteZone(now, ctx.timezone);
    final startMinute = _startMinute >= 0
        ? _startMinute
        : ((local.hour * 60 + local.minute) ~/ 30 + 1) * 30;
    final units = ref.watch(residentUnitsProvider);
    final unit =
        units.where((u) => u.unitId == _unitId).firstOrNull ??
        (units.isEmpty ? null : units.first);
    final from = siteInstant(
      ctx.timezone,
      day.year,
      day.month,
      day.day,
      hour: startMinute ~/ 60,
      minute: startMinute % 60,
    );
    final to = from.add(Duration(minutes: _duration));
    final valid =
        _name.text.trim().isNotEmpty && unit != null && ctx.siteId != null;
    return FormPage(
      title: l.visitorAdd,
      children: [
        TextField(
          key: const Key('visitorName'),
          controller: _name,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            labelText: l.visitorName,
            errorText: fieldMessage(context, error, 'name'),
          ),
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: 12),
        TextField(
          key: const Key('visitorPlate'),
          controller: _plate,
          textCapitalization: TextCapitalization.characters,
          decoration: InputDecoration(
            labelText: l.visitorPlate,
            errorText: fieldMessage(context, error, 'plate'),
          ),
        ),
        if (units.length > 1) ...[
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            key: const Key('unitPicker'),
            initialValue: unit?.unitId,
            decoration: InputDecoration(labelText: l.bookingUnit),
            items: [
              for (final u in units)
                DropdownMenuItem(value: u.unitId, child: Text(u.label)),
            ],
            onChanged: (v) => setState(() => _unitId = v),
          ),
        ],
        SectionTitle(l.visitorWindow),
        SizedBox(
          height: 56,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var i = 0; i < 14; i++)
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 8),
                    child: ChoiceChip(
                      key: Key('visitDay_$i'),
                      label: Text(
                        formatSiteDay(
                          siteInstant(
                            ctx.timezone,
                            addDays(today, i).year,
                            addDays(today, i).month,
                            addDays(today, i).day,
                            hour: 12,
                          ),
                          timezone: ctx.timezone,
                          locale: locale,
                        ),
                      ),
                      selected: addDays(today, i) == day,
                      onSelected: (_) =>
                          setState(() => _day = addDays(today, i)),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          key: const Key('visitStart'),
          initialValue: startMinute < 24 * 60 ? startMinute : 0,
          decoration: InputDecoration(labelText: l.visitorFrom),
          items: [
            for (var m = 0; m < 24 * 60; m += 30)
              DropdownMenuItem(
                value: m,
                child: Text(
                  '${(m ~/ 60).toString().padLeft(2, '0')}:${(m % 60).toString().padLeft(2, '0')}',
                ),
              ),
          ],
          onChanged: (v) => setState(() => _startMinute = v ?? 0),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            for (final m in visitDurations)
              ChoiceChip(
                key: Key('visitFor_$m'),
                label: Text(durationLabel(l, m)),
                selected: m == _duration,
                onSelected: (_) => setState(() => _duration = m),
              ),
          ],
        ),
        const SizedBox(height: 8),
        SiteRange(
          start: from,
          end: to,
          timezone: ctx.timezone,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 16),
        if (error != null) ErrorBanner(error: error!),
        const SizedBox(height: 8),
        FilledButton(
          key: const Key('registerVisitor'),
          onPressed: !valid || busy
              ? null
              : () => submit(() async {
                  final entry = await createVisitorEntry(
                    ref,
                    siteId: ctx.siteId!,
                    unitId: unit.unitId,
                    name: _name.text.trim(),
                    plate: _plate.text.trim().toUpperCase(),
                    from: from,
                    to: to,
                  );
                  if (context.mounted) {
                    context.pushReplacement('/more/visitors/entry/${entry.id}');
                  }
                }),
          child: busy
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(l.visitorRegister),
        ),
      ],
    );
  }
}

/// The QR of a pass with Share (image and text) through the share sheet.
class QrPass extends ConsumerWidget {
  const new({
    required this.token,
    required this.shareName,
    required this.shareText,
    super.key,
  });

  final String? token;
  final String shareName;
  final String shareText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final payload = visitorQrPayload(token);
    if (payload == null) {
      return Padding(
        key: const Key('noQr'),
        padding: const EdgeInsetsDirectional.symmetric(vertical: 16),
        child: Text(l.visitorNoQr),
      );
    }
    return Column(
      children: [
        Center(
          child: Semantics(
            label: l.visitorQrLabel,
            image: true,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(12),
              child: QrImageView(
                key: const Key('visitorQr'),
                data: payload,
                size: 240,
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        FilledButton.icon(
          key: const Key('shareQr'),
          icon: const Icon(Icons.share),
          label: Text(l.visitorShare),
          onPressed: () async {
            final messenger = ScaffoldMessenger.of(context);
            try {
              final png = await ref.read(qrImageServiceProvider).png(payload);
              await ref
                  .read(shareServiceProvider)
                  .shareFile(
                    bytes: png,
                    filename: 'visitor-pass.png',
                    mime: 'image/png',
                    text: shareText,
                  );
            } on Object {
              messenger.showSnackBar(SnackBar(content: Text(l.shareFailed)));
            }
          },
        ),
      ],
    );
  }
}

class VisitorEntryScreen extends ConsumerWidget {
  const new({required this.entryId, super.key});

  final String entryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final ctx = ref.watch(orgContextProvider);
    final async = ref.watch(visitorEntriesProvider);
    final entry = async.value?.data?.where((e) => e.id == entryId).firstOrNull;
    final now = ref.watch(nowProvider)();
    if (entry == null || ctx == null) {
      return Scaffold(
        appBar: AppBar(title: Text(l.visitorPass)),
        body: async.value?.error != null && async.value?.data == null
            ? ErrorState(
                error: async.value!.error!,
                onRetry: () => ref.invalidate(visitorEntriesProvider),
              )
            : (async.value?.data != null
                  ? EmptyState(message: l.visitorNotFound)
                  : const SkeletonList()),
      );
    }
    final state = passState(entry, now);
    final range = formatSiteRange(
      entry.windowFrom,
      entry.windowTo,
      timezone: ctx.timezone,
      locale: locale,
    );
    return FormPage(
      title: l.visitorPass,
      children: [
        Text(entry.name, style: Theme.of(context).textTheme.headlineSmall),
        if (entry.plate != null && entry.plate!.isNotEmpty) Text(entry.plate!),
        const SizedBox(height: 4),
        Text(range, key: const Key('passWindow')),
        const SizedBox(height: 8),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Pill(switch (state) {
            PassState.upcoming => l.passUpcoming,
            PassState.valid => l.passValid,
            PassState.ended => l.passEnded,
            PassState.cancelled => l.visitorCancelled,
            PassState.used => l.visitorArrived,
          }, tone: state == PassState.valid ? PillTone.good : PillTone.neutral),
        ),
        const SizedBox(height: 16),
        if (state == PassState.upcoming || state == PassState.valid) ...[
          QrPass(
            token: entry.qrToken,
            shareName: entry.name,
            shareText: l.visitorShareText(
              entry.name,
              range,
              ctx.org.name,
              entry.qrToken ?? '',
            ),
          ),
          const SizedBox(height: 8),
          Text(l.visitorQrHint, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 16),
          OutlinedButton(
            key: const Key('cancelVisitor'),
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              try {
                await cancelVisitorEntry(ref, entry);
                if (context.mounted) context.pop();
              } on Object catch (e) {
                messenger.showSnackBar(
                  SnackBar(content: Text(errorMessage(l, AppError.from(e)))),
                );
              }
            },
            child: Text(l.visitorCancel),
          ),
        ],
      ],
    );
  }
}

/// Days offered for a recurring visitor and the lengths of its validity.
const recurringValidity = <String, int?>{
  'none': null,
  'm1': 30,
  'm3': 90,
  'y1': 365,
};

class NewRecurringVisitorScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<NewRecurringVisitorScreen> createState() =>
      _NewRecurringState();
}

class _NewRecurringState extends ConsumerState<NewRecurringVisitorScreen>
    with SubmitState {
  final _name = TextEditingController();
  final _plate = TextEditingController();
  final _days = <int>{1, 2, 3, 4, 5};
  int _start = 9 * 60;
  int _end = 17 * 60;
  String _validity = 'm3';
  String? _unitId;

  @override
  void dispose() {
    _name.dispose();
    _plate.dispose();
    super.dispose();
  }

  String _hhmm(int m) =>
      '${(m ~/ 60).toString().padLeft(2, '0')}:${(m % 60).toString().padLeft(2, '0')}';

  String _iso(SiteDay d) =>
      '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final ctx = ref.watch(orgContextProvider);
    if (ctx == null) return const Scaffold(body: SkeletonList());
    final units = ref.watch(residentUnitsProvider);
    final unit =
        units.where((u) => u.unitId == _unitId).firstOrNull ??
        (units.isEmpty ? null : units.first);
    final today = siteDayOf(ref.watch(nowProvider)(), ctx.timezone);
    final valid =
        _name.text.trim().isNotEmpty &&
        _days.isNotEmpty &&
        _start < _end &&
        unit != null &&
        ctx.siteId != null;
    return FormPage(
      title: l.visitorAddRecurring,
      children: [
        TextField(
          key: const Key('recurringName'),
          controller: _name,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(labelText: l.visitorName),
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: 12),
        TextField(
          key: const Key('recurringPlate'),
          controller: _plate,
          textCapitalization: TextCapitalization.characters,
          decoration: InputDecoration(labelText: l.visitorPlate),
        ),
        if (units.length > 1) ...[
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            key: const Key('unitPicker'),
            initialValue: unit?.unitId,
            decoration: InputDecoration(labelText: l.bookingUnit),
            items: [
              for (final u in units)
                DropdownMenuItem(value: u.unitId, child: Text(u.label)),
            ],
            onChanged: (v) => setState(() => _unitId = v),
          ),
        ],
        SectionTitle(l.recurringDays),
        Wrap(
          spacing: 8,
          children: [
            for (var d = 1; d <= 7; d++)
              FilterChip(
                key: Key('recDay_$d'),
                label: Text(weekdaysLabel([d], locale)),
                selected: _days.contains(d),
                onSelected: (on) => setState(() {
                  if (on) {
                    _days.add(d);
                  } else {
                    _days.remove(d);
                  }
                }),
              ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<int>(
                key: const Key('recStart'),
                initialValue: _start,
                decoration: InputDecoration(labelText: l.visitorFrom),
                items: [
                  for (var m = 0; m < 24 * 60; m += 30)
                    DropdownMenuItem(value: m, child: Text(_hhmm(m))),
                ],
                onChanged: (v) => setState(() => _start = v ?? _start),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DropdownButtonFormField<int>(
                key: const Key('recEnd'),
                initialValue: _end,
                decoration: InputDecoration(labelText: l.visitorUntil),
                items: [
                  for (var m = 30; m <= 24 * 60 - 1; m += 30)
                    DropdownMenuItem(value: m, child: Text(_hhmm(m))),
                ],
                onChanged: (v) => setState(() => _end = v ?? _end),
              ),
            ),
          ],
        ),
        SectionTitle(l.recurringValidity),
        Wrap(
          spacing: 8,
          children: [
            for (final e in recurringValidity.entries)
              ChoiceChip(
                key: Key('validity_${e.key}'),
                label: Text(switch (e.key) {
                  'm1' => l.validityMonth1,
                  'm3' => l.validityMonths3,
                  'y1' => l.validityYear1,
                  _ => l.validityNoEnd,
                }),
                selected: _validity == e.key,
                onSelected: (_) => setState(() => _validity = e.key),
              ),
          ],
        ),
        const SizedBox(height: 16),
        if (error != null) ErrorBanner(error: error!),
        const SizedBox(height: 8),
        FilledButton(
          key: const Key('createRecurring'),
          onPressed: !valid || busy
              ? null
              : () => submit(() async {
                  final days = _days.toList()..sort();
                  final span = recurringValidity[_validity];
                  final out = await createRecurringVisitor(
                    ref,
                    siteId: ctx.siteId!,
                    unitId: unit.unitId,
                    name: _name.text.trim(),
                    plate: _plate.text.trim().toUpperCase(),
                    days: days,
                    start: _hhmm(_start),
                    end: _hhmm(_end),
                    validFrom: _iso(today),
                    validTo: span == null ? null : _iso(addDays(today, span)),
                  );
                  if (context.mounted) {
                    context.pushReplacement(
                      '/more/visitors/recurring/${out.id}',
                    );
                  }
                }),
          child: busy
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(l.visitorRegister),
        ),
      ],
    );
  }
}

/// A recurring visitor: its long-lived QR, share, and revoke.
class RecurringVisitorScreen extends ConsumerWidget {
  const new({required this.recurringId, super.key});

  final String recurringId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final ctx = ref.watch(orgContextProvider);
    final async = ref.watch(recurringVisitorsProvider);
    final r = async.value?.data?.where((e) => e.id == recurringId).firstOrNull;
    if (r == null || ctx == null) {
      return Scaffold(
        appBar: AppBar(title: Text(l.visitorPass)),
        body: async.value?.data != null
            ? EmptyState(message: l.visitorNotFound)
            : const SkeletonList(),
      );
    }
    final active = r.status == RecurringVisitorStatusEnum.active;
    final when = '${weekdaysLabel(r.days, locale)} ${r.start}–${r.end}';
    return FormPage(
      title: l.visitorPass,
      children: [
        Text(r.name, style: Theme.of(context).textTheme.headlineSmall),
        if (r.plate != null && r.plate!.isNotEmpty) Text(r.plate!),
        const SizedBox(height: 4),
        Text(when, key: const Key('recurringWhen')),
        Row(
          children: [
            Text(l.recurringFrom),
            const SizedBox(width: 4),
            SiteDate(isoDate: _isoOf(r.validFrom), timezone: ctx.timezone),
            if (r.validTo != null) ...[
              const SizedBox(width: 12),
              Text(l.recurringTo),
              const SizedBox(width: 4),
              SiteDate(isoDate: _isoOf(r.validTo!), timezone: ctx.timezone),
            ],
          ],
        ),
        const SizedBox(height: 8),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Pill(switch (r.status) {
            RecurringVisitorStatusEnum.active => l.recurringActive,
            RecurringVisitorStatusEnum.revoked => l.recurringRevoked,
            RecurringVisitorStatusEnum.expired => l.recurringExpired,
            RecurringVisitorStatusEnum.unknownDefaultOpenApi => l.valueOther,
          }, tone: active ? PillTone.good : PillTone.neutral),
        ),
        const SizedBox(height: 16),
        if (active) ...[
          QrPass(
            token: r.qrToken,
            shareName: r.name,
            shareText: l.recurringShareText(
              r.name,
              when,
              ctx.org.name,
              r.qrToken ?? '',
            ),
          ),
          const SizedBox(height: 8),
          Text(l.recurringQrHint, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 16),
          OutlinedButton(
            key: const Key('revokeRecurring'),
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              final ok = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(l.recurringRevokeTitle),
                  content: Text(l.recurringRevokeBody(r.name)),
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(false),
                      child: Text(l.actionCancel),
                    ),
                    FilledButton(
                      key: const Key('confirmRevoke'),
                      onPressed: () => context.pop(true),
                      child: Text(l.recurringRevoke),
                    ),
                  ],
                ),
              );
              if (ok != true) return;
              try {
                await revokeRecurringVisitor(ref, r);
              } on Object catch (e) {
                messenger.showSnackBar(
                  SnackBar(content: Text(errorMessage(l, AppError.from(e)))),
                );
              }
            },
            child: Text(l.recurringRevoke),
          ),
        ],
      ],
    );
  }

  String _isoOf(DateTime d) => DateFormat('yyyy-MM-dd').format(d);
}

/// The approve / deny screen of a visitor at the gate: who, the countdown to
/// the expiry, and the gate-contact hint once it ran out (C2).
class ApprovalRequestScreen extends ConsumerStatefulWidget {
  const new({required this.requestId, this.decision, super.key});

  final String requestId;

  /// `approve` or `deny` when the user tapped a button of the notification:
  /// the answer is sent as soon as the request is on screen and pending.
  final String? decision;

  @override
  ConsumerState<ApprovalRequestScreen> createState() => _ApprovalState();
}

class _ApprovalState extends ConsumerState<ApprovalRequestScreen>
    with SubmitState {
  Timer? _tick;
  int _ticks = 0;
  bool _autoSent = false;
  bool _expiredByServer = false;
  VisitorApprovalRequest? _answered;

  @override
  void initState() {
    super.initState();
    _tick = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      _ticks++;
      // The request is polled while pending (the server flips it to expired,
      // or another occupant answers).
      if (_ticks % 5 == 0 && _answered == null) {
        ref.invalidate(approvalRequestsProvider);
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tick?.cancel();
    super.dispose();
  }

  Future<void> _decide(VisitorApprovalRequest r, {required bool approve}) =>
      submit(() async {
        try {
          final out = await decideApproval(ref, r, approve: approve);
          if (mounted) setState(() => _answered = out);
        } on AppError catch (e) {
          // A decision after expiry (or one already made) is 409: show what
          // the server says now.
          if (e.code == 'conflict') {
            if (mounted) setState(() => _expiredByServer = true);
          } else {
            rethrow;
          }
        }
      });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    final async = ref.watch(approvalRequestsProvider);
    final fetched = async.value?.data
        ?.where((r) => r.id == widget.requestId)
        .firstOrNull;
    final request = _answered ?? fetched;
    if (request == null || ctx == null) {
      return Scaffold(
        appBar: AppBar(title: Text(l.visitorApprovalTitle)),
        body: async.value?.error != null && async.value?.data == null
            ? ErrorState(
                error: async.value!.error!,
                onRetry: () => ref.invalidate(approvalRequestsProvider),
              )
            : (async.value?.data != null
                  ? EmptyState(message: l.visitorRequestGone)
                  : const SkeletonList()),
      );
    }
    final now = ref.watch(nowProvider)();
    var phase = approvalPhase(request, now);
    if (_expiredByServer && phase == ApprovalPhase.pending) {
      phase = ApprovalPhase.expired;
    }
    final wanted = widget.decision;
    if (!_autoSent &&
        phase == ApprovalPhase.pending &&
        (wanted == 'approve' || wanted == 'deny') &&
        !busy) {
      _autoSent = true;
      scheduleMicrotask(() => _decide(request, approve: wanted == 'approve'));
    }
    return Scaffold(
      appBar: AppBar(title: Text(l.visitorApprovalTitle)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsetsDirectional.all(20),
          children: [
            Icon(
              Icons.how_to_reg_outlined,
              size: 56,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 12),
            Text(
              l.visitorWaitingAtGate(request.visitorName),
              key: const Key('requestTitle'),
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              l.visitorRequestUnit(request.unitDoorNumber),
              textAlign: TextAlign.center,
            ),
            if (request.plate != null && request.plate!.isNotEmpty)
              Text(request.plate!, textAlign: TextAlign.center),
            const SizedBox(height: 4),
            Center(
              child: SiteDate(
                instant: request.requestedAt,
                timezone: ctx.timezone,
                withTime: true,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const SizedBox(height: 24),
            if (phase == ApprovalPhase.pending) ...[
              Semantics(
                liveRegion: false,
                label: l.visitorExpiresIn(
                  countdownText(approvalRemaining(request, now)),
                ),
                child: Text(
                  l.visitorExpiresIn(
                    countdownText(approvalRemaining(request, now)),
                  ),
                  key: const Key('countdown'),
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
              if (error != null) ErrorBanner(error: error!),
              const SizedBox(height: 8),
              FilledButton.icon(
                key: const Key('approve'),
                icon: const Icon(Icons.check),
                label: Text(l.visitorApprove),
                onPressed: busy ? null : () => _decide(request, approve: true),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                key: const Key('deny'),
                icon: const Icon(Icons.close),
                label: Text(l.visitorDeny),
                onPressed: busy ? null : () => _decide(request, approve: false),
              ),
            ] else if (phase == ApprovalPhase.approved) ...[
              _Result(
                key: const Key('resultApproved'),
                icon: Icons.check_circle_outline,
                text: l.visitorResultApproved,
              ),
            ] else if (phase == ApprovalPhase.denied) ...[
              _Result(
                key: const Key('resultDenied'),
                icon: Icons.block,
                text: l.visitorResultDenied,
              ),
            ] else ...[
              _Result(
                key: const Key('resultExpired'),
                icon: Icons.timer_off_outlined,
                text: l.visitorResultExpired,
              ),
              const SizedBox(height: 12),
              const _GateContactHint(),
            ],
          ],
        ),
      ),
    );
  }
}

class _Result extends StatelessWidget {
  const new({required this.icon, required this.text, super.key});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Icon(icon, size: 48),
      const SizedBox(height: 8),
      Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
    ],
  );
}

/// After the request expired the guard calls the number the resident shares
/// for this (decision C2): say which one, or invite to set it.
class _GateContactHint extends ConsumerWidget {
  const new();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final person = ref.watch(myPersonProvider).value?.data;
    final phone = person?.gateContactPhone;
    return Card(
      key: const Key('gateContactHint'),
      child: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l.visitorGateContactTitle,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 4),
            if (phone != null && phone.isNotEmpty)
              Text(l.visitorGateContactSet(phone))
            else ...[
              Text(l.visitorGateContactMissing),
              const SizedBox(height: 8),
              OutlinedButton(
                key: const Key('setGateContact'),
                onPressed: () => context.push('/profile/me'),
                child: Text(l.visitorGateContactAdd),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
