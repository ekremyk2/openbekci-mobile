import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_api/openbekci_api.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/l10n/codes.dart';
import 'package:openbekci_mobile/core/permissions/permissions.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

OrgAccess org(List<Map<String, Object?>> permissions) => OrgAccess.fromJson({
  'id': '0192a3f0-1000-7000-8000-000000000001',
  'slug': 'gul',
  'name': 'Gul',
  'default_locale': 'tr',
  'roles': <Object?>[],
  'permissions': permissions,
  'occupant_permissions': <Object?>[],
  'sites': <Object?>[],
  'person_id': null,
});

void main() {
  group('PermissionSet', () {
    test('an organization-wide grant holds everywhere', () {
      final p = PermissionSet.of(
        org([
          {'permission': 'tickets.read'},
        ]),
      );
      expect(p.can(Permission.ticketsPeriodRead), isTrue);
      expect(p.can(Permission.ticketsPeriodRead, siteId: 'any'), isTrue);
      expect(p.can(Permission.ticketsPeriodManage), isFalse);
    });

    test('a scoped grant holds only for its sites and blocks', () {
      final p = PermissionSet.of(
        org([
          {
            'permission': 'tickets.manage',
            'site_ids': ['s1'],
            'block_ids': ['b9'],
          },
        ]),
      );
      expect(p.can(Permission.ticketsPeriodManage), isFalse);
      expect(p.can(Permission.ticketsPeriodManage, siteId: 's1'), isTrue);
      expect(p.can(Permission.ticketsPeriodManage, siteId: 's2'), isFalse);
      expect(p.can(Permission.ticketsPeriodManage, blockId: 'b9'), isTrue);
    });

    test('an unknown permission value never grants anything', () {
      final p = PermissionSet.of(
        org([
          {'permission': 'hologram.project'},
        ]),
      );
      expect(p.can(Permission.unknownDefaultOpenApi), isFalse);
      expect(p.canNamed('hologram.project'), isFalse);
    });

    test('canNamed matches wire names', () {
      final p = PermissionSet.of(
        org([
          {'permission': 'announcements.read'},
        ]),
      );
      expect(p.canNamed('announcements.read'), isTrue);
      expect(p.canNamed('announcements.publish'), isFalse);
    });

    test('no organization means no permissions', () {
      expect(PermissionSet.of(null).can(Permission.ticketsPeriodRead), isFalse);
      expect(PermissionSet.empty.canNamed('tickets.read'), isFalse);
    });
  });

  group('error codes to strings', () {
    final en = lookupAppLocalizations(const Locale('en'));
    final tr = lookupAppLocalizations(const Locale('tr'));

    test('known codes have specific messages in both languages', () {
      const known = [
        'validation_failed',
        'bad_request',
        'unauthenticated',
        'not_found',
        'conflict',
        'version_conflict',
        'idempotency_mismatch',
        'locked_period',
        'insufficient_permission',
        'reauth_required',
        'invalid_grant',
        'rate_limited',
        'site_offboarded',
        'internal_error',
        'sms_unavailable',
        'mail_unavailable',
        'payload_too_large',
        'timeout',
        'network',
        'insecure_server',
        'not_openbekci',
      ];
      for (final code in known) {
        expect(isKnownErrorCode(en, code), isTrue, reason: code);
        final e = errorMessage(en, AppError(code: code));
        final t = errorMessage(tr, AppError(code: code));
        expect(e, isNot(en.errorGeneric), reason: code);
        expect(t, isNot(tr.errorGeneric), reason: code);
        expect(t, isNot(e), reason: 'tr differs from en for $code');
      }
    });

    test('an unknown code falls back to the generic message', () {
      const e = AppError(code: 'shiny_new_code', requestId: 'req-9');
      expect(isKnownErrorCode(en, e.code), isFalse);
      expect(errorMessage(en, e), en.errorGeneric);
      expect(errorMessage(tr, e), tr.errorGeneric);
      expect(errorDetails(en, e), contains('shiny_new_code'));
      expect(errorDetails(en, e), contains('req-9'));
    });

    test('field errors map by code with a generic fallback', () {
      const f = FieldError(field: 'password', code: 'too_short');
      expect(fieldErrorMessage(en, f), en.fieldErrorTooShort);
      expect(
        fieldErrorMessage(en, const FieldError(field: 'x', code: 'required')),
        en.fieldErrorRequired,
      );
      expect(
        fieldErrorMessage(en, const FieldError(field: 'x', code: 'weird')),
        en.fieldErrorInvalid,
      );
    });
  });
}
