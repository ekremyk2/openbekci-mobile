import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_api/openbekci_api.dart' as api;
import 'package:yaml/yaml.dart';

/// Contract matrix: the client generated from the current pin must decode what
/// the two previous pins (`spec/compat/`, N-1 and N-2 core commits, see
/// `spec/api_version.lock` history) would send, and what a future server may
/// add: unknown fields and unknown enum values must not crash.
///
/// Samples are built from each older spec (every property of every response
/// schema the app reads), then decoded. `future` samples add an unknown field
/// to every object and replace every enum value with an unknown one.
final _decoders = <String, Object? Function(Map<String, dynamic>)>{
  'AgendaItemList': api.AgendaItemList.fromJson,
  'Announcement': api.Announcement.fromJson,
  'AnnouncementList': api.AnnouncementList.fromJson,
  'AuthResult': api.AuthResult.fromJson,
  'Availability': api.Availability.fromJson,
  'BankDetails': api.BankDetails.fromJson,
  'Booking': api.Booking.fromJson,
  'BookingList': api.BookingList.fromJson,
  'ChargeList': api.ChargeList.fromJson,
  'Checkout': api.Checkout.fromJson,
  'CheckoutList': api.CheckoutList.fromJson,
  'DecisionList': api.DecisionList.fromJson,
  'DeliveryList': api.DeliveryList.fromJson,
  'Device': api.Device.fromJson,
  'DirectoryConsent': api.DirectoryConsent.fromJson,
  'DocumentList': api.DocumentList.fromJson,
  'FacilityList': api.FacilityList.fromJson,
  'File': api.File.fromJson,
  'FolderList': api.FolderList.fromJson,
  'InvitationPreview': api.InvitationPreview.fromJson,
  'MeDashboard': api.MeDashboard.fromJson,
  'Me': api.Me.fromJson,
  'MeetingList': api.MeetingList.fromJson,
  'MinutesResult': api.MinutesResult.fromJson,
  'MyMeeting': api.MyMeeting.fromJson,
  'Notification': api.Notification.fromJson,
  'NotificationList': api.NotificationList.fromJson,
  'NotificationMutes': api.NotificationMutes.fromJson,
  'Payment': api.Payment.fromJson,
  'PaymentList': api.PaymentList.fromJson,
  'Person': api.Person.fromJson,
  'Poll': api.Poll.fromJson,
  'PollAnswer': api.PollAnswer.fromJson,
  'RecurringVisitor': api.RecurringVisitor.fromJson,
  'RecurringVisitorList': api.RecurringVisitorList.fromJson,
  'SessionList': api.SessionList.fromJson,
  'SiteSettings': api.SiteSettings.fromJson,
  'Statement': api.Statement.fromJson,
  'TicketCategoryList': api.TicketCategoryList.fromJson,
  'TicketCommentList': api.TicketCommentList.fromJson,
  'TicketComment': api.TicketComment.fromJson,
  'Ticket': api.Ticket.fromJson,
  'TicketList': api.TicketList.fromJson,
  'TicketStatusChangeList': api.TicketStatusChangeList.fromJson,
  'TicketVote': api.TicketVote.fromJson,
  'TicketWorkflow': api.TicketWorkflow.fromJson,
  'TokenResponse': api.TokenResponse.fromJson,
  'UnitClaim': api.UnitClaim.fromJson,
  'UnreadCount': api.UnreadCount.fromJson,
  'VisitorApprovalRequest': api.VisitorApprovalRequest.fromJson,
  'VisitorApprovalRequestList': api.VisitorApprovalRequestList.fromJson,
  'VisitorEntry': api.VisitorEntry.fromJson,
  'VisitorEntryList': api.VisitorEntryList.fromJson,
  'WebLoginLink': api.WebLoginLink.fromJson,
};

/// shortcut: fields the current spec requires but an older one lacks make the
/// decoder throw on that older server (the version gate is the guard); listed
/// so a new break fails the test, remove entries when the gate drops that
/// server version.
const _knownOlderServerGaps = <String>{
  'MeUser.version',
  'OrgAccess.occupant_permissions',
  'MyPoll.answers',
};

Object? _plain(Object? v) => v is YamlMap
    ? {for (final e in v.entries) e.key.toString(): _plain(e.value)}
    : v is YamlList
    ? [for (final e in v) _plain(e)]
    : v;

class _Sampler {
  new(this.schemas, {required this.future});
  final Map<String, Object?> schemas;
  final bool future;

  Object? of(Object? node, [int depth = 0]) {
    if (node is! Map<String, Object?>) return null;
    final ref = node[r'$ref'];
    if (ref is String) {
      if (depth > 5) return null;
      return of(schemas[ref.split('/').last], depth + 1);
    }
    final all = node['allOf'];
    if (all is List) {
      final parts = [for (final p in all) of(p, depth)];
      final maps = parts.whereType<Map<String, Object?>>();
      return maps.isEmpty
          ? parts.firstOrNull
          : maps.fold<Map<String, Object?>>({}, (a, m) => {...a, ...m});
    }
    for (final k in ['oneOf', 'anyOf']) {
      final alts = node[k];
      if (alts is List && alts.isNotEmpty) return of(alts.first, depth);
    }
    final enumValues = node['enum'];
    if (enumValues is List && enumValues.isNotEmpty) {
      return future ? 'zz_future_value' : enumValues.first;
    }
    switch (node['type']) {
      case 'object':
        final props = node['properties'];
        return {
          if (props is Map<String, Object?>)
            for (final p in props.entries) p.key: of(p.value, depth),
          if (future && props is Map) 'zz_future_field': {'a': 1},
        };
      case 'array':
        final item = of(node['items'], depth);
        return item == null ? <Object?>[] : [item];
      case 'integer':
        return 1;
      case 'number':
        return 1.5;
      case 'boolean':
        return true;
      case 'string':
        return switch (node['format']) {
          'date-time' => '2026-01-01T00:00:00Z',
          'date' => '2026-01-01',
          'uuid' => '0192a3f0-1000-7000-8000-000000000001',
          _ => 'x',
        };
    }
    return null;
  }
}

Map<String, Object?> _schemas(String path) {
  final spec =
      _plain(loadYaml(File(path).readAsStringSync()))! as Map<String, Object?>;
  return ((spec['components']! as Map)['schemas']! as Map)
      .cast<String, Object?>();
}

String _sha(String path) =>
    sha256.convert(File(path).readAsBytesSync()).toString();

void main() {
  final pins = [
    for (final f in Directory('spec/compat').listSync().whereType<File>())
      if (f.path.endsWith('.yaml')) f.path,
  ]..sort();

  test('two older pins are kept and match their locks', () {
    expect(pins, hasLength(2));
    for (final p in pins) {
      final lock = File(p.replaceAll('.yaml', '.lock')).readAsStringSync();
      expect(lock, contains('sha256=${_sha(p)}'), reason: p);
      expect(lock, contains('commit='), reason: p);
    }
    // The current pin is newer than both.
    final current = File('spec/api_version.lock').readAsStringSync();
    for (final p in pins) {
      expect(
        current,
        isNot(
          contains(
            File(p.replaceAll('.yaml', '.lock'))
                .readAsLinesSync()
                .firstWhere((l) => l.startsWith('commit=')),
          ),
        ),
      );
    }
  });

  for (final p in pins) {
    for (final future in [false, true]) {
      test(
        '${p.split(RegExp(r'[\/]')).last} ${future ? 'plus unknown '
                  'fields and enum values ' : ''}decodes',
        () {
          final schemas = _schemas(p);
          final sampler = _Sampler(schemas, future: future);
          final gaps = <String>{};
          var decoded = 0;
          for (final d in _decoders.entries) {
            if (!schemas.containsKey(d.key)) continue; // newer than this pin
            final json = jsonDecode(
              jsonEncode(sampler.of({r'$ref': d.key})),
            ) as Map<String, dynamic>;
            try {
              d.value(json);
              decoded++;
            } on Object catch (e) {
              // json_serializable: Could not create `Class`. ... Required keys are missing: key.
              final m = RegExp(
                'Could not create [`]([a-zA-Z]+)[`].*missing: ([a-zA-Z_, ]+)[.]',
                dotAll: true,
              ).firstMatch(e.toString());
              if (m == null) fail('${d.key}: $e');
              gaps.addAll([
                for (final k in m.group(2)!.split(', ')) '${m.group(1)}.$k',
              ]);
            }
          }
          expect(gaps.difference(_knownOlderServerGaps), isEmpty);
          expect(decoded, greaterThan(30));
        },
      );
    }
  }
}
