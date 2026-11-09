import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/api/interceptors.dart';
import 'package:openbekci_mobile/core/cache/cache_policy.dart';
import 'package:openbekci_mobile/core/cache/cached.dart';
import 'package:openbekci_mobile/core/files/files.dart';
import 'package:openbekci_mobile/core/org/org_context.dart';
import 'package:openbekci_mobile/core/org/scope.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/features/tickets/data/tickets_repository.dart';
import 'package:openbekci_mobile/features/tickets/domain/tickets_logic.dart';
import 'package:shared_preferences/shared_preferences.dart';

final ticketsRepositoryProvider = Provider<TicketsRepository?>((ref) {
  final api = ref.watch(apiProvider);
  return api == null ? null : TicketsRepository(api);
});

/// Mine, my unit's and the common tickets the server returns for the site.
final ticketsProvider = StreamProvider<CacheState<List<Ticket>>>((ref) {
  final scope = ref.watch(scopeProvider);
  final siteId = scope?.siteId;
  if (scope == null || siteId == null) return const Stream.empty();
  return watchCached<List<Ticket>>(
    ref,
    key: 'org/${scope.orgId}/tickets',
    fetch: (api) async => [
      for (final t in await TicketsRepository(
        api,
      ).list(orgId: scope.orgId, siteId: siteId))
        t.toJson(),
    ],
    decode: (j) => decodeList(j, Ticket.fromJson),
  );
});

final ticketCategoriesProvider =
    StreamProvider<CacheState<List<TicketCategory>>>((ref) {
      final scope = ref.watch(scopeProvider);
      final siteId = scope?.siteId;
      if (scope == null || siteId == null) return const Stream.empty();
      return watchCached<List<TicketCategory>>(
        ref,
        key: 'org/${scope.orgId}/ticket-categories',
        fetch: (api) async => [
          for (final c in await TicketsRepository(
            api,
          ).categories(orgId: scope.orgId, siteId: siteId))
            c.toJson(),
        ],
        decode: (j) => decodeList(j, TicketCategory.fromJson),
      );
    });

/// A ticket with its public thread.
@immutable
class TicketDetail {
  const new({
    required this.ticket,
    required this.comments,
    required this.history,
  });

  factory fromJson(Object? json) {
    final m = (json! as Map).cast<String, dynamic>();
    return TicketDetail(
      ticket: Ticket.fromJson((m['ticket'] as Map).cast<String, dynamic>()),
      comments: decodeList(m['comments'], TicketComment.fromJson),
      history: decodeList(m['history'], TicketStatusChange.fromJson),
    );
  }

  final Ticket ticket;
  final List<TicketComment> comments;
  final List<TicketStatusChange> history;

  Map<String, Object?> toJson() => {
    'ticket': ticket.toJson(),
    'comments': [for (final c in comments) c.toJson()],
    'history': [for (final h in history) h.toJson()],
  };

  List<TimelineEntry> get timeline => buildTimeline(history, comments);
}

final ticketDetailProvider =
    StreamProvider.family<CacheState<TicketDetail>, String>((ref, ticketId) {
      final scope = ref.watch(scopeProvider);
      if (scope == null) return const Stream.empty();
      return watchCached<TicketDetail>(
        ref,
        key: 'org/${scope.orgId}/ticket/$ticketId',
        fetch: (api) async {
          final repo = TicketsRepository(api);
          final results = await Future.wait<Object>([
            repo.get(orgId: scope.orgId, ticketId: ticketId),
            repo.comments(orgId: scope.orgId, ticketId: ticketId),
            repo.history(orgId: scope.orgId, ticketId: ticketId),
          ]);
          return TicketDetail(
            ticket: results[0] as Ticket,
            comments: results[1] as List<TicketComment>,
            history: results[2] as List<TicketStatusChange>,
          ).toJson();
        },
        decode: TicketDetail.fromJson,
      );
    });

// ---------------------------------------------------------------------------
// New ticket draft (mobile plan section 8: a failed create keeps its draft,
// its photos and its Idempotency-Key until sent or discarded).
// ---------------------------------------------------------------------------

/// A chosen photo: compressed bytes plus its own upload state, so a retry
/// uploads only what is missing and never twice.
@immutable
class DraftPhoto {
  const new({
    required this.name,
    required this.bytes,
    required this.uploadKey,
    this.fileId,
  });

  final String name;
  final Uint8List bytes;

  /// `Idempotency-Key` of this photo's upload.
  final String uploadKey;

  /// Set once the upload succeeded.
  final String? fileId;

  DraftPhoto withFileId(String id) =>
      DraftPhoto(name: name, bytes: bytes, uploadKey: uploadKey, fileId: id);
}

@immutable
class TicketDraft {
  const new({
    required this.key,
    this.categoryId,
    this.title = '',
    this.description = '',
    this.visibility,
    this.unitId,
    this.photos = const [],
  });

  /// `Idempotency-Key` of the create call.
  final String key;
  final String? categoryId;
  final String title;
  final String description;

  /// `private` or `common`; null follows the category's default.
  final TicketCreateVisibilityEnum? visibility;
  final String? unitId;
  final List<DraftPhoto> photos;

  TicketDraft copyWith({
    String? categoryId,
    String? title,
    String? description,
    TicketCreateVisibilityEnum? visibility,
    String? unitId,
    bool clearUnit = false,
    bool clearVisibility = false,
    List<DraftPhoto>? photos,
  }) => TicketDraft(
    key: key,
    categoryId: categoryId ?? this.categoryId,
    title: title ?? this.title,
    description: description ?? this.description,
    visibility: clearVisibility ? null : (visibility ?? this.visibility),
    unitId: clearUnit ? null : (unitId ?? this.unitId),
    photos: photos ?? this.photos,
  );

  TicketDraft withKey(String newKey) => TicketDraft(
    key: newKey,
    categoryId: categoryId,
    title: title,
    description: description,
    visibility: visibility,
    unitId: unitId,
    photos: photos,
  );

  bool get isEmpty =>
      title.isEmpty && description.isEmpty && photos.isEmpty && unitId == null;
}

/// Prefix of the saved drafts; one slot per user and organization, so a draft
/// (text, category, unit) never reaches another account or organization.
const ticketDraftPrefPrefix = 'ticket_draft_v1';

String _newKey() => HeadersInterceptor.newId(Random.secure());

class TicketDraftController extends Notifier<TicketDraft> {
  String? _slot;

  /// Rebuilt (empty, photos dropped) whenever the user or the organization
  /// changes, and on sign-out.
  @override
  TicketDraft build() {
    final user = ref.watch(accountProvider.select((a) => a.value?.userId));
    final org = ref.watch(scopeProvider.select((s) => s?.orgId));
    _slot = user == null || org == null
        ? null
        : '$ticketDraftPrefPrefix/$user/$org';
    unawaited(_restore(_slot));
    return TicketDraft(key: _newKey());
  }

  Future<void> _restore(String? slot) async {
    if (slot == null) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(slot);
      if (raw == null || !state.isEmpty || slot != _slot) return;
      final m = json.decode(raw) as Map<String, dynamic>;
      state = TicketDraft(
        // Photos are not restored, so the request differs from one sent before
        // the restart: it must not reuse that attempt's key.
        key: state.key,
        categoryId: m['category_id'] as String?,
        title: (m['title'] as String?) ?? '',
        description: (m['description'] as String?) ?? '',
        visibility: switch (m['visibility']) {
          'private' => TicketCreateVisibilityEnum.private,
          'common' => TicketCreateVisibilityEnum.common,
          _ => null,
        },
        unitId: m['unit_id'] as String?,
      );
    } on Object {
      // A broken draft is dropped.
    }
  }

  Future<void> _persist() async {
    final slot = _slot;
    if (slot == null) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      if (state.isEmpty && state.categoryId == null) {
        await prefs.remove(slot);
        return;
      }
      await prefs.setString(
        slot,
        json.encode({
          'key': state.key,
          'category_id': state.categoryId,
          'title': state.title,
          'description': state.description,
          'visibility': state.visibility?.value,
          'unit_id': state.unitId,
        }),
      );
    } on Object {
      // Memory only.
    }
  }

  /// A changed request is a new request: it needs a new `Idempotency-Key`
  /// (the server would answer the earlier, different one for the old key).
  TicketDraft _rekeyed(TicketDraft before, TicketDraft after) {
    final same =
        before.categoryId == after.categoryId &&
        before.title == after.title &&
        before.description == after.description &&
        before.visibility == after.visibility &&
        before.unitId == after.unitId &&
        before.photos.length == after.photos.length;
    return same ? after : after.withKey(_newKey());
  }

  void update(TicketDraft Function(TicketDraft d) change) {
    state = _rekeyed(state, change(state));
    unawaited(_persist());
  }

  /// Adds photos (already compressed), up to [maxTicketPhotos].
  void addPhotos(List<({String name, Uint8List bytes})> added) {
    final room = maxTicketPhotos - state.photos.length;
    final take = added.take(max(room, 0));
    final before = state;
    state = _rekeyed(
      before,
      state.copyWith(
        photos: [
          ...state.photos,
          for (final p in take)
            DraftPhoto(name: p.name, bytes: p.bytes, uploadKey: _newKey()),
        ],
      ),
    );
  }

  void removePhoto(int index) {
    final list = [...state.photos]..removeAt(index);
    state = _rekeyed(state, state.copyWith(photos: list));
  }

  void markUploaded(int index, String fileId) {
    final list = [...state.photos];
    list[index] = list[index].withFileId(fileId);
    state = state.copyWith(photos: list);
  }

  /// Sent or discarded: forget it and start a new key.
  void clear() {
    state = TicketDraft(key: _newKey());
    unawaited(_persist());
  }
}

final ticketDraftProvider =
    NotifierProvider<TicketDraftController, TicketDraft>(
      TicketDraftController.new,
    );

/// Uploads the draft's photos (those not yet uploaded), then creates the
/// ticket. Photos that were uploaded stay uploaded across retries.
Future<Ticket> submitTicketDraft(WidgetRef ref) async {
  final ctx = ref.read(orgContextProvider);
  final repo = ref.read(ticketsRepositoryProvider);
  final files = ref.read(filesRepositoryProvider);
  final notifier = ref.read(ticketDraftProvider.notifier);
  if (ctx == null || ctx.siteId == null || repo == null || files == null) {
    throw const AppError(code: 'unauthenticated');
  }
  var draft = ref.read(ticketDraftProvider);
  for (var i = 0; i < draft.photos.length; i++) {
    final photo = draft.photos[i];
    if (photo.fileId != null) continue;
    final file = await files.upload(
      orgId: ctx.orgId,
      siteId: ctx.siteId!,
      bytes: photo.bytes,
      name: photo.name,
      mime: 'image/jpeg',
      idempotencyKey: photo.uploadKey,
    );
    notifier.markUploaded(i, file.id);
    draft = ref.read(ticketDraftProvider);
  }
  final ticket = await repo.create(
    orgId: ctx.orgId,
    idempotencyKey: draft.key,
    body: TicketCreate(
      siteId: ctx.siteId!,
      categoryId: draft.categoryId!,
      title: draft.title.trim(),
      description: draft.description.trim(),
      unitId: draft.unitId,
      // No visibility: residents get the category's (only managers choose).
      attachmentFileIds: [
        for (final p in draft.photos)
          if (p.fileId != null) p.fileId!,
      ],
    ),
  );
  notifier.clear();
  ref.invalidate(ticketsProvider);
  return ticket;
}
