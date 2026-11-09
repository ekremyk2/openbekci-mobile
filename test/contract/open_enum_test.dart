import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_api/openbekci_api.dart' hide File;

import '../support/fake_api.dart';

/// Contract tests of the generated client against the pinned spec: open enums
/// (backend plan section 8, overview section 6.2) must decode unknown values to
/// the generated unknown case instead of throwing, so an old store build
/// survives an additive server release.
void main() {
  Map<String, Object?> occupancy({
    String kind = 'owner',
    String? side = 'owner',
  }) => {
    'id': '0192a3f0-1000-7000-8000-000000000005',
    'org_id': '0192a3f0-1000-7000-8000-000000000001',
    'site_id': '0192a3f0-1000-7000-8000-000000000002',
    'unit_id': '0192a3f0-1000-7000-8000-000000000003',
    'unit_label': 'A Blok D:12',
    'kind': kind,
    'side': side,
    'may_see_money': true,
    'valid_from': '2025-09-01',
    'valid_to': null,
  };

  group('unknown enum values deserialize to the unknown case', () {
    test('MeOccupancy.kind and side', () {
      final known = MeOccupancy.fromJson(occupancy());
      expect(known.kind, MeOccupancyKindEnum.owner);
      expect(known.side, MeOccupancySideEnum.owner);

      final unknown = MeOccupancy.fromJson(
        occupancy(kind: 'cooperative_member', side: 'trustee'),
      );
      expect(unknown.kind, MeOccupancyKindEnum.unknownDefaultOpenApi);
      expect(unknown.side, MeOccupancySideEnum.unknownDefaultOpenApi);
      // Everything else still decodes.
      expect(unknown.unitLabel, 'A Blok D:12');
    });

    test('a null side stays null (household members)', () {
      final o = MeOccupancy.fromJson(occupancy(kind: 'household', side: null));
      expect(o.side, isNull);
      expect(o.kind, MeOccupancyKindEnum.household);
    });

    test('Permission in a grant', () {
      final g = PermissionGrant.fromJson({'permission': 'hologram.project'});
      expect(g.permission, Permission.unknownDefaultOpenApi);
      final ok = PermissionGrant.fromJson({'permission': 'tickets.read'});
      expect(ok.permission, Permission.ticketsPeriodRead);
    });

    test('RoleGrant.role and scope_type', () {
      final r = RoleGrant.fromJson({
        'role': 'janitor_in_chief',
        'scope_type': 'galaxy',
        'scope_id': null,
        'site_owned': false,
      });
      expect(r.role, RoleGrantRoleEnum.unknownDefaultOpenApi);
      expect(r.scopeType, RoleGrantScopeTypeEnum.unknownDefaultOpenApi);
    });

    test('InvitationPreview kind and channel', () {
      final p = InvitationPreview.fromJson({
        'kind': 'qr_poster',
        'org_name': 'Gul',
        'site_name': 'Gul Sitesi',
        'unit_door_number': null,
        'person_display_name': null,
        'channel': 'carrier_pigeon',
        'expires_at': '2026-12-01T00:00:00Z',
        'existing_account': false,
      });
      expect(p.kind, InvitationPreviewKindEnum.unknownDefaultOpenApi);
      expect(p.channel, InvitationPreviewChannelEnum.unknownDefaultOpenApi);
    });

    test('UnitClaim status and claimed_role', () {
      final c = UnitClaim.fromJson({
        'id': '0192a3f0-1000-7000-8000-000000000010',
        'org_id': '0192a3f0-1000-7000-8000-000000000001',
        'user_id': '0192a3f0-1000-7000-8000-0000000000aa',
        'display_name': 'Ayse',
        'unit_id': '0192a3f0-1000-7000-8000-000000000003',
        'unit_door_number': '12',
        'claimed_role': 'guest',
        'status': 'on_hold',
        'decided_by': null,
        'decided_at': null,
        'decision_note': null,
        'note': null,
        'created_at': '2026-11-08T10:00:00Z',
        'updated_at': '2026-11-08T10:00:00Z',
      });
      expect(c.status, UnitClaimStatusEnum.unknownDefaultOpenApi);
      expect(c.claimedRole, UnitClaimClaimedRoleEnum.unknownDefaultOpenApi);
    });

    test('Session.client and AuthResult.client', () {
      final s = Session.fromJson({
        'id': '0192a3f0-1000-7000-8000-000000000002',
        'client': 'smart_fridge',
        'device_name': null,
        'ip': null,
        'user_agent': null,
        'created_at': '2026-03-01T09:00:00Z',
        'last_used_at': null,
        'expires_at': '2026-03-01T09:00:00Z',
        'current': false,
      });
      expect(s.client, SessionClientEnum.unknownDefaultOpenApi);
    });
  });

  group('additive server changes do not break decoding', () {
    test('unknown extra properties are ignored', () {
      final json = occupancy()..['loyalty_tier'] = 'gold';
      expect(() => MeOccupancy.fromJson(json), returnsNormally);
    });

    test('the whole /v1/me document survives unknown values', () {
      final json = meJson(
        occupancies: [occupancy(kind: 'astronaut')],
        organizations: [
          {
            'id': '0192a3f0-1000-7000-8000-000000000001',
            'slug': 'gul',
            'name': 'Gul',
            'default_locale': 'tr',
            'roles': [
              {
                'role': 'mystery_role',
                'scope_type': 'org',
                'scope_id': null,
                'site_owned': false,
              },
            ],
            'permissions': [
              {'permission': 'tickets.read'},
              {'permission': 'brand.new_permission'},
            ],
            'occupant_permissions': <Object?>[],
            'sites': <Object?>[],
            'person_id': null,
          },
        ],
      );
      final me = Me.fromJson(json);
      expect(
        me.occupancies.single.kind,
        MeOccupancyKindEnum.unknownDefaultOpenApi,
      );
      expect(
        me.organizations.single.roles.single.role,
        RoleGrantRoleEnum.unknownDefaultOpenApi,
      );
      expect(me.organizations.single.permissions.map((p) => p.permission), [
        Permission.ticketsPeriodRead,
        Permission.unknownDefaultOpenApi,
      ]);
    });

    test('auth method ids are open strings, not enums', () {
      final m = AuthMethod.fromJson({'id': 'passkey', 'label_key': 'auth.pk'});
      expect(m.id, 'passkey');
    });
  });

  group('requests', () {
    test('serialize the way the spec says', () {
      final body = Credentials(
        method: 'sms_otp',
        identifier: '+905321234567',
        code: '123456',
        client: CredentialsClientEnum.mobile,
        deviceName: 'phone',
      ).toJson();
      expect(body['method'], 'sms_otp');
      expect(body['client'], 'mobile');
      expect(body['device_name'], 'phone');
      expect(
        UnitClaimCreate(
          unitId: 'u',
          claimedRole: UnitClaimCreateClaimedRoleEnum.tenant,
        ).toJson(),
        {'unit_id': 'u', 'claimed_role': 'tenant'},
      );
    });
  });

  group('pinned spec', () {
    test('spec/openapi.yaml matches the hash recorded in api_version.lock', () {
      final lock = {
        for (final line in File('spec/api_version.lock').readAsLinesSync())
          if (line.contains('='))
            line.split('=').first: line.substring(line.indexOf('=') + 1),
      };
      final digest = sha256.convert(
        File('spec/openapi.yaml').readAsBytesSync(),
      );
      expect(digest.toString(), lock['sha256']);
      expect(lock['commit'], matches(RegExp(r'^[0-9a-f]{40}$')));
    });

    test('the generated package was built from the pinned spec', () {
      final pinned = File('spec/api_version.lock').readAsStringSync();
      final generated = File('packages/openbekci_api/lib/.spec_version')
          .readAsStringSync();
      expect(
        generated,
        pinned,
        reason: 'run tool/generate_client after fetch_spec',
      );
    });

    test('every generated enum has an unknown default case', () {
      final dir = Directory('packages/openbekci_api/lib/src/model');
      final enumRe = RegExp(r'^enum (\w+) \{', multiLine: true);
      var enums = 0;
      for (final f in dir.listSync().whereType<File>()) {
        if (f.path.endsWith('.g.dart')) continue;
        final text = f.readAsStringSync();
        for (final m in enumRe.allMatches(text)) {
          enums++;
          final body = text.substring(m.end, text.indexOf('}', m.end));
          expect(
            body,
            contains('unknown_default_open_api'),
            reason: '${m.group(1)} in ${f.path}',
          );
        }
      }
      expect(enums, greaterThan(10));
    });
  });
}
