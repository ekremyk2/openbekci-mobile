import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/cache/cache_policy.dart';
import 'package:openbekci_mobile/core/cache/cached.dart';
import 'package:openbekci_mobile/core/org/scope.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/features/community/application/community_providers.dart';
import 'package:openbekci_mobile/features/home/application/home_providers.dart';

/// Meetings of the site (the server shows residents the ones that concern
/// them; drafts never reach them).
final meetingsProvider = StreamProvider<CacheState<List<Meeting>>>((ref) {
  final scope = ref.watch(scopeProvider);
  final siteId = scope?.siteId;
  if (scope == null || siteId == null) return const Stream.empty();
  return watchCached<List<Meeting>>(
    ref,
    key: 'org/${scope.orgId}/meetings',
    fetch: (api) async => [
      for (final m in await fetchPages<Meeting>((cursor) async {
        final page = await unwrap(
          () => api.governance.governanceListMeetings(
            orgId: scope.orgId,
            siteId: siteId,
            cursor: cursor,
          ),
        );
        return (items: page.items, next: page.nextCursor);
      }))
        m.toJson(),
    ],
    decode: (j) => decodeList(j, Meeting.fromJson),
  );
});

/// A meeting as the caller sees it: the agenda, the call-letter notice, the
/// check-in QR and the polls (each with its question and state).
@immutable
class MeetingDetail {
  const new({required this.my, required this.agenda, required this.polls});

  factory fromJson(Object? json) {
    final m = (json! as Map).cast<String, dynamic>();
    final polls = (m['polls'] as Map? ?? const <String, Object?>{}).map(
      (k, v) => MapEntry(
        k as String,
        Poll.fromJson((v! as Map).cast<String, dynamic>()),
      ),
    );
    return MeetingDetail(
      my: MyMeeting.fromJson((m['my'] as Map).cast<String, dynamic>()),
      agenda: decodeList(m['agenda'], AgendaItem.fromJson),
      polls: polls,
    );
  }

  final MyMeeting my;
  final List<AgendaItem> agenda;

  /// Poll by agenda item id (only the polls of `my.polls`).
  final Map<String, Poll> polls;

  Meeting get meeting => my.meeting;

  Map<String, Object?> toJson() => {
    'my': my.toJson(),
    'agenda': [for (final a in agenda) a.toJson()],
    'polls': {for (final e in polls.entries) e.key: e.value.toJson()},
  };
}

final meetingDetailProvider =
    StreamProvider.family<CacheState<MeetingDetail>, String>((ref, meetingId) {
      final scope = ref.watch(scopeProvider);
      if (scope == null) return const Stream.empty();
      return watchCached<MeetingDetail>(
        ref,
        key: 'org/${scope.orgId}/meeting/$meetingId',
        fetch: (api) async {
          final my = await unwrap(
            () => api.governance.governanceGetMyMeeting(
              orgId: scope.orgId,
              meetingId: meetingId,
            ),
          );
          final agenda = await fetchPages<AgendaItem>((cursor) async {
            final page = await unwrap(
              () => api.governance.governanceListAgendaItems(
                orgId: scope.orgId,
                meetingId: meetingId,
                cursor: cursor,
              ),
            );
            return (items: page.items, next: page.nextCursor);
          });
          final polls = <String, Poll>{};
          for (final p in my.polls) {
            try {
              polls[p.agendaItemId] = await unwrap(
                () => api.governance.governanceGetPoll(
                  orgId: scope.orgId,
                  agendaItemId: p.agendaItemId,
                ),
              );
            } on AppError {
              // A poll that cannot be read is simply not shown as open.
            }
          }
          return MeetingDetail(my: my, agenda: agenda, polls: polls).toJson();
        },
        decode: MeetingDetail.fromJson,
      );
    });

/// Answers the pre-meeting poll of [agendaItemId] for [unitId]: one answer
/// per unit (owners only; a co-owner may change it while the poll is open).
Future<PollAnswer> answerPoll(
  WidgetRef ref, {
  required String meetingId,
  required String agendaItemId,
  required String unitId,
  required PollAnswerSetAnswerEnum answer,
}) async {
  final scope = ref.read(scopeProvider);
  final api = ref.read(apiProvider);
  if (scope == null || api == null) {
    throw const AppError(code: 'unauthenticated');
  }
  final keys = ref.read(idempotencyKeysProvider);
  final fp = 'poll:$agendaItemId:$unitId:${answer.value}';
  final out = await unwrap(
    () => api.governance.governanceAnswerPoll(
      orgId: scope.orgId,
      agendaItemId: agendaItemId,
      idempotencyKey: keys.keyFor(fp),
      pollAnswerSet: PollAnswerSet(unitId: unitId, answer: answer),
    ),
  );
  keys.done(fp);
  ref
    ..invalidate(meetingDetailProvider(meetingId))
    ..invalidate(dashboardProvider);
  return out;
}

/// The decision history (the server filters for tenants; the screen applies
/// the rule again).
final decisionsProvider = StreamProvider<CacheState<List<Decision>>>((ref) {
  final scope = ref.watch(scopeProvider);
  final siteId = scope?.siteId;
  if (scope == null || siteId == null) return const Stream.empty();
  return watchCached<List<Decision>>(
    ref,
    key: 'org/${scope.orgId}/decisions',
    fetch: (api) async => [
      for (final d in await fetchPages<Decision>((cursor) async {
        final page = await unwrap(
          () => api.governance.governanceListDecisions(
            orgId: scope.orgId,
            siteId: siteId,
            cursor: cursor,
          ),
        );
        return (items: page.items, next: page.nextCursor);
      }))
        d.toJson(),
    ],
    decode: (j) => decodeList(j, Decision.fromJson),
  );
});

/// The minutes document of a closed meeting: its file id (and name) for the
/// PDF viewer; `null` while the meeting has none.
final minutesProvider = FutureProvider.autoDispose
    .family<MinutesResult?, String>((ref, meetingId) async {
      final scope = ref.watch(scopeProvider);
      final api = ref.watch(apiProvider);
      if (scope == null || api == null) return null;
      try {
        return await unwrap(
          () => api.governance.governanceGetMinutes(
            orgId: scope.orgId,
            meetingId: meetingId,
          ),
        );
      } on AppError catch (e) {
        if (e.status == 404) return null;
        rethrow;
      }
    });
