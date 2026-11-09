import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/api/interceptors.dart';
import 'package:openbekci_mobile/core/l10n/codes.dart';
import 'package:openbekci_mobile/core/org/org_context.dart';
import 'package:openbekci_mobile/core/services/services.dart';
import 'package:openbekci_mobile/core/widgets/cached_view.dart';
import 'package:openbekci_mobile/core/widgets/display.dart';
import 'package:openbekci_mobile/core/widgets/form_support.dart';
import 'package:openbekci_mobile/core/widgets/resident_widgets.dart';
import 'package:openbekci_mobile/features/tickets/application/tickets_providers.dart';
import 'package:openbekci_mobile/features/tickets/domain/tickets_logic.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

class TicketScopeController extends Notifier<TicketScope> {
  @override
  TicketScope build() => TicketScope.all;

  // A Notifier cannot expose its state through a setter.
  // ignore: use_setters_to_change_properties
  void select(TicketScope s) => state = s;
}

final ticketScopeProvider =
    NotifierProvider<TicketScopeController, TicketScope>(
      TicketScopeController.new,
    );

PillTone _statusTone(Ticket t) =>
    isClosedTicket(t) ? PillTone.neutral : PillTone.good;

/// Tickets tab: mine and my unit's plus the site's common tickets, open ones
/// first; closed ones grouped below (O1, O3).
class TicketsScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    final scope = ref.watch(ticketScopeProvider);
    final labels = {
      TicketScope.all: l.ticketsAll,
      TicketScope.mine: l.ticketsMine,
      TicketScope.common: l.ticketsCommon,
    };
    return Scaffold(
      appBar: AppBar(title: Text(l.ticketsTitle)),
      floatingActionButton: FloatingActionButton.extended(
        key: const Key('newTicket'),
        icon: const Icon(Icons.add),
        label: Text(l.ticketNew),
        onPressed: () => context.push('/tickets/new'),
      ),
      body: CachedView<List<Ticket>>(
        provider: ticketsProvider,
        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 88),
        header: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
          child: Wrap(
            spacing: 8,
            children: [
              for (final s in TicketScope.values)
                ChoiceChip(
                  key: Key('scope_${s.name}'),
                  label: Text(labels[s]!),
                  selected: s == scope,
                  onSelected: (_) =>
                      ref.read(ticketScopeProvider.notifier).select(s),
                ),
            ],
          ),
        ),
        isEmpty: (list) => list.isEmpty,
        emptyTitle: l.ticketsEmptyTitle,
        emptyMessage: l.ticketsEmpty,
        emptyIcon: Icons.build_outlined,
        builder: (context, all) {
          final filtered = filterTickets(
            all,
            scope,
            myPersonId: ctx?.org.personId,
          );
          final groups = groupTickets(filtered);
          if (filtered.isEmpty) {
            return [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 48),
                child: Center(child: Text(l.ticketsEmpty)),
              ),
            ];
          }
          return [
            if (groups.open.isNotEmpty) SectionTitle(l.ticketsOpen),
            for (final t in groups.open) TicketCard(ticket: t),
            if (groups.closed.isNotEmpty) SectionTitle(l.ticketsClosed),
            for (final t in groups.closed) TicketCard(ticket: t),
          ];
        },
      ),
    );
  }
}

class TicketCard extends StatelessWidget {
  const new({required this.ticket, super.key});

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Card(
      key: Key('ticket_${ticket.id}'),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => context.push('/tickets/${ticket.id}'),
        child: Padding(
          padding: const EdgeInsetsDirectional.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(ticket.title, style: theme.textTheme.titleSmall),
              const SizedBox(height: 6),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  // The status name is the site's own workflow word.
                  Pill(ticket.statusName, tone: _statusTone(ticket)),
                  Pill(ticketVisibilityLabel(l, ticket.visibility)),
                  if (ticket.unitDoorNumber != null)
                    Text(
                      l.ticketUnit(ticket.unitDoorNumber!),
                      style: theme.textTheme.bodySmall,
                    ),
                  if (ticket.visibility == TicketVisibilityEnum.common)
                    Text(
                      l.ticketVotes(ticket.voteCount),
                      style: theme.textTheme.bodySmall,
                    ),
                  if (ticket.commentCount > 0)
                    Text(
                      l.ticketComments(ticket.commentCount),
                      style: theme.textTheme.bodySmall,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A ticket with its status history, public comments, photos and "+1".
class TicketDetailScreen extends ConsumerStatefulWidget {
  const new({required this.ticketId, super.key});

  final String ticketId;

  @override
  ConsumerState<TicketDetailScreen> createState() => _TicketDetailState();
}

class _TicketDetailState extends ConsumerState<TicketDetailScreen>
    with SubmitState {
  final _comment = TextEditingController();
  String _commentKey = HeadersInterceptor.newId(Random.secure());
  bool _voting = false;

  @override
  void dispose() {
    _comment.dispose();
    super.dispose();
  }

  Future<void> _send(OrgContext ctx) async {
    final text = _comment.text.trim();
    if (text.isEmpty) return;
    final repo = ref.read(ticketsRepositoryProvider);
    if (repo == null) return;
    await submit(() async {
      await repo.comment(
        orgId: ctx.orgId,
        ticketId: widget.ticketId,
        body: text,
        idempotencyKey: _commentKey,
      );
      _comment.clear();
      // Sent: the next comment is a new request.
      _commentKey = HeadersInterceptor.newId(Random.secure());
      ref
        ..invalidate(ticketDetailProvider(widget.ticketId))
        ..invalidate(ticketsProvider);
    });
  }

  Future<void> _vote(OrgContext ctx, Ticket t) async {
    final repo = ref.read(ticketsRepositoryProvider);
    if (repo == null || _voting) return;
    setState(() => _voting = true);
    try {
      await repo.vote(orgId: ctx.orgId, ticketId: t.id, vote: !t.votedByMe);
      ref
        ..invalidate(ticketDetailProvider(widget.ticketId))
        ..invalidate(ticketsProvider);
    } on Object catch (e) {
      if (mounted) {
        final l = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage(l, AppError.from(e)))),
        );
      }
    } finally {
      if (mounted) setState(() => _voting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    final provider = ticketDetailProvider(widget.ticketId);
    return Scaffold(
      appBar: AppBar(title: Text(l.ticketTitle)),
      body: ctx == null
          ? const SkeletonList()
          : Column(
              children: [
                Expanded(
                  child: CachedView<TicketDetail>(
                    provider: provider,
                    builder: (context, d) => _body(context, ctx, d),
                  ),
                ),
                if (ref.watch(provider).value?.data case final d?
                    when d.ticket.mergedIntoId == null)
                  _composer(l, ctx),
              ],
            ),
    );
  }

  List<Widget> _body(BuildContext context, OrgContext ctx, TicketDetail d) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final t = d.ticket;
    return [
      Text(t.title, style: theme.textTheme.headlineSmall),
      const SizedBox(height: 8),
      Wrap(
        spacing: 8,
        runSpacing: 4,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Pill(
            t.statusName,
            key: const Key('ticketStatus'),
            tone: _statusTone(t),
          ),
          Pill(ticketVisibilityLabel(l, t.visibility)),
          if (t.unitDoorNumber != null) Text(l.ticketUnit(t.unitDoorNumber!)),
        ],
      ),
      const SizedBox(height: 4),
      Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text('${t.reporterDisplayName} · ', style: theme.textTheme.bodySmall),
          SiteDate(
            instant: t.createdAt,
            timezone: ctx.timezone,
            withTime: true,
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
      if (t.mergedIntoId != null)
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 8),
          child: Text(l.ticketMerged, key: const Key('ticketMerged')),
        ),
      if (canVote(t) || t.visibility == TicketVisibilityEnum.common)
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 12),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: canVote(t)
                ? (t.votedByMe
                      ? FilledButton.icon(
                          key: const Key('voteButton'),
                          icon: const Icon(Icons.thumb_up),
                          label: Text(l.ticketVoted(t.voteCount)),
                          onPressed: _voting ? null : () => _vote(ctx, t),
                        )
                      : OutlinedButton.icon(
                          key: const Key('voteButton'),
                          icon: const Icon(Icons.thumb_up_outlined),
                          label: Text(l.ticketPlusOne(t.voteCount)),
                          onPressed: _voting ? null : () => _vote(ctx, t),
                        ))
                : Text(l.ticketVotes(t.voteCount)),
          ),
        ),
      const SizedBox(height: 12),
      Text(t.description, style: theme.textTheme.bodyLarge),
      if (t.attachments.isNotEmpty) ...[
        SectionTitle(l.ticketPhotos),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final a in t.attachments)
              if (a.commentId == null)
                RemoteImage(
                  fileId: a.fileId,
                  onTap: () => showDialog<void>(
                    context: context,
                    builder: (_) => Dialog(
                      child: RemoteImage(
                        fileId: a.fileId,
                        variant: 'medium',
                        size: 320,
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ],
      SectionTitle(l.ticketThread),
      if (d.timeline.isEmpty) Text(l.ticketNoThread),
      for (final e in d.timeline) _TimelineRow(entry: e, ctx: ctx),
    ];
  }

  Widget _composer(AppLocalizations l, OrgContext ctx) {
    return Material(
      elevation: 4,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (error != null) ...[
                ErrorBanner(error: error!),
                const SizedBox(height: 8),
              ],
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      key: const Key('commentField'),
                      controller: _comment,
                      minLines: 1,
                      maxLines: 4,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        hintText: l.ticketCommentHint,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton.filled(
                    key: const Key('commentSend'),
                    tooltip: l.ticketCommentSend,
                    icon: busy
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.send),
                    onPressed: busy ? null : () => _send(ctx),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimelineRow extends StatelessWidget {
  const new({required this.entry, required this.ctx});

  final TimelineEntry entry;
  final OrgContext ctx;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final change = entry.change;
    final comment = entry.comment;
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            change != null ? Icons.swap_horiz : Icons.chat_bubble_outline,
            size: 18,
            color: theme.colorScheme.outline,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (change != null) ...[
                  Text(
                    change.fromStatusName == null
                        ? l.ticketStatusSet(change.toStatusName)
                        : l.ticketStatusChanged(
                            change.fromStatusName!,
                            change.toStatusName,
                          ),
                    style: theme.textTheme.bodyMedium,
                  ),
                  if (change.comment != null) Text(change.comment!),
                ] else ...[
                  Text(
                    comment!.authorDisplayName,
                    style: theme.textTheme.labelMedium,
                  ),
                  Text(comment.body),
                  if (comment.attachments.isNotEmpty)
                    Wrap(
                      spacing: 8,
                      children: [
                        for (final a in comment.attachments)
                          RemoteImage(fileId: a.fileId, size: 64),
                      ],
                    ),
                ],
                SiteDate(
                  instant: entry.at,
                  timezone: ctx.timezone,
                  withTime: true,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// New ticket: category, description, up to 10 photos (compressed here,
/// uploaded through the server), optional unit, private or common. The draft
/// survives a failed send, with its photos and its `Idempotency-Key`.
class NewTicketScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<NewTicketScreen> createState() => _NewTicketState();
}

class _NewTicketState extends ConsumerState<NewTicketScreen> with SubmitState {
  late final TextEditingController _title;
  late final TextEditingController _description;
  bool _pickingPhotos = false;

  @override
  void initState() {
    super.initState();
    final d = ref.read(ticketDraftProvider);
    _title = TextEditingController(text: d.title);
    _description = TextEditingController(text: d.description);
  }

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    super.dispose();
  }

  Future<void> _addPhotos({required bool camera}) async {
    final picker = ref.read(photoPickerProvider);
    final draft = ref.read(ticketDraftProvider);
    final room = maxTicketPhotos - draft.photos.length;
    if (room <= 0) return;
    setState(() => _pickingPhotos = true);
    try {
      final picked = camera
          ? [?await picker.takePhoto()]
          : await picker.pickFromGallery(limit: room);
      final compressed = <({String name, Uint8List bytes})>[];
      for (final p in picked.take(room)) {
        compressed.add((
          name: _jpegName(p.name),
          bytes: await compressPhoto(p.bytes),
        ));
      }
      ref.read(ticketDraftProvider.notifier).addPhotos(compressed);
    } finally {
      if (mounted) setState(() => _pickingPhotos = false);
    }
  }

  String _jpegName(String name) {
    final base = name.contains('.')
        ? name.substring(0, name.lastIndexOf('.'))
        : name;
    return '${base.isEmpty ? 'photo' : base}.jpg';
  }

  Future<void> _submit() async {
    final draft = ref.read(ticketDraftProvider);
    final fields = <FieldError>[
      if (draft.categoryId == null)
        const FieldError(field: 'category_id', code: 'required'),
      if (_title.text.trim().isEmpty)
        const FieldError(field: 'title', code: 'required'),
      if (_description.text.trim().isEmpty)
        const FieldError(field: 'description', code: 'required'),
    ];
    if (fields.isNotEmpty) {
      setState(
        () => error = AppError(code: 'validation_failed', fieldErrors: fields),
      );
      return;
    }
    await submit(() async {
      final ticket = await submitTicketDraft(ref);
      if (mounted) context.pushReplacement('/tickets/${ticket.id}');
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final ctx = ref.watch(orgContextProvider);
    final draft = ref.watch(ticketDraftProvider);
    final notifier = ref.read(ticketDraftProvider.notifier);
    final categories = ref.watch(ticketCategoriesProvider).value?.data;
    final active = [
      for (final c in categories ?? const <TicketCategory>[])
        if (!c.archived) c,
    ];
    final category = active.where((c) => c.id == draft.categoryId).firstOrNull;
    // Default visibility follows the category until the user picks one.
    final effectiveVisibility =
        draft.visibility ??
        switch (category?.defaultVisibility) {
          TicketCategoryDefaultVisibilityEnum.common =>
            TicketCreateVisibilityEnum.common,
          _ => TicketCreateVisibilityEnum.private,
        };
    final units = ctx?.occupancies ?? const <MeOccupancy>[];
    return Scaffold(
      appBar: AppBar(title: Text(l.ticketNew)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsetsDirectional.all(16),
          children: [
            DropdownButtonFormField<String>(
              key: const Key('ticketCategory'),
              initialValue: active.any((c) => c.id == draft.categoryId)
                  ? draft.categoryId
                  : null,
              decoration: InputDecoration(
                labelText: l.ticketCategory,
                errorText: fieldMessage(context, error, 'category_id'),
                border: const OutlineInputBorder(),
              ),
              items: [
                for (final c in active)
                  DropdownMenuItem(value: c.id, child: Text(c.name)),
              ],
              onChanged: (v) => notifier.update(
                (d) => d.copyWith(categoryId: v, clearVisibility: true),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              key: const Key('ticketTitleField'),
              controller: _title,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: l.ticketTitleLabel,
                errorText: fieldMessage(context, error, 'title'),
                border: const OutlineInputBorder(),
              ),
              onChanged: (v) => notifier.update((d) => d.copyWith(title: v)),
            ),
            const SizedBox(height: 12),
            TextField(
              key: const Key('ticketDescriptionField'),
              controller: _description,
              minLines: 4,
              maxLines: 8,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: l.ticketDescription,
                errorText: fieldMessage(context, error, 'description'),
                border: const OutlineInputBorder(),
              ),
              onChanged: (v) =>
                  notifier.update((d) => d.copyWith(description: v)),
            ),
            const SizedBox(height: 12),
            if (units.isNotEmpty)
              DropdownButtonFormField<String?>(
                key: const Key('ticketUnit'),
                initialValue: units.any((u) => u.unitId == draft.unitId)
                    ? draft.unitId
                    : null,
                decoration: InputDecoration(
                  labelText: l.ticketUnitOptional,
                  border: const OutlineInputBorder(),
                ),
                items: [
                  DropdownMenuItem<String?>(child: Text(l.ticketNoUnit)),
                  for (final u in units)
                    DropdownMenuItem<String?>(
                      value: u.unitId,
                      child: Text(u.unitLabel),
                    ),
                ],
                onChanged: (v) => notifier.update(
                  (d) => v == null
                      ? d.copyWith(clearUnit: true)
                      : d.copyWith(unitId: v),
                ),
              ),
            const SizedBox(height: 12),
            Text(l.ticketVisibility, style: theme.textTheme.titleSmall),
            const SizedBox(height: 4),
            SegmentedButton<TicketCreateVisibilityEnum>(
              key: const Key('ticketVisibility'),
              segments: [
                ButtonSegment(
                  value: TicketCreateVisibilityEnum.private,
                  label: Text(l.ticketPrivate),
                  icon: const Icon(Icons.lock_outline),
                ),
                ButtonSegment(
                  value: TicketCreateVisibilityEnum.common,
                  label: Text(l.ticketCommon),
                  icon: const Icon(Icons.groups_outlined),
                ),
              ],
              selected: {effectiveVisibility},
              onSelectionChanged: (s) =>
                  notifier.update((d) => d.copyWith(visibility: s.first)),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 4),
              child: Text(
                effectiveVisibility == TicketCreateVisibilityEnum.common
                    ? l.ticketCommonHint
                    : l.ticketPrivateHint,
                style: theme.textTheme.bodySmall,
              ),
            ),
            SectionTitle(l.ticketPhotos),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final (i, p) in draft.photos.indexed)
                  Stack(
                    key: Key('photo_$i'),
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.memory(
                          p.bytes,
                          width: 88,
                          height: 88,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => const SizedBox(
                            width: 88,
                            height: 88,
                            child: Icon(Icons.image_outlined),
                          ),
                        ),
                      ),
                      PositionedDirectional(
                        top: 0,
                        end: 0,
                        child: IconButton.filledTonal(
                          iconSize: 16,
                          tooltip: l.ticketPhotoRemove,
                          icon: const Icon(Icons.close),
                          onPressed: () => notifier.removePhoto(i),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                OutlinedButton.icon(
                  key: const Key('addPhotoGallery'),
                  icon: const Icon(Icons.photo_library_outlined),
                  label: Text(l.ticketPhotoGallery),
                  onPressed:
                      _pickingPhotos || draft.photos.length >= maxTicketPhotos
                      ? null
                      : () => _addPhotos(camera: false),
                ),
                OutlinedButton.icon(
                  key: const Key('addPhotoCamera'),
                  icon: const Icon(Icons.photo_camera_outlined),
                  label: Text(l.ticketPhotoCamera),
                  onPressed:
                      _pickingPhotos || draft.photos.length >= maxTicketPhotos
                      ? null
                      : () => _addPhotos(camera: true),
                ),
              ],
            ),
            Text(
              l.ticketPhotoCount(draft.photos.length, maxTicketPhotos),
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            if (error != null && error!.fieldErrors.isEmpty) ...[
              ErrorBanner(error: error!),
              const SizedBox(height: 12),
            ],
            FilledButton(
              key: const Key('ticketSubmit'),
              onPressed: busy ? null : _submit,
              child: busy
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(l.ticketSubmit),
            ),
            const SizedBox(height: 8),
            Text(l.ticketDraftKept, style: theme.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
