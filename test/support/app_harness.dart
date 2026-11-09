import 'dart:async';

import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:openbekci_api/openbekci_api.dart';
import 'package:openbekci_mobile/app/app.dart';
import 'package:openbekci_mobile/app/config/app_config.dart';
import 'package:openbekci_mobile/core/account/account.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/auth/auth_repository.dart';
import 'package:openbekci_mobile/core/auth/link_handler.dart';
import 'package:openbekci_mobile/core/db/database.dart';
import 'package:openbekci_mobile/core/instance/discovery.dart';
import 'package:openbekci_mobile/core/instance/server_connector.dart';
import 'package:openbekci_mobile/core/links/app_link.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/features/onboarding/application/onboarding_providers.dart';
import 'package:openbekci_mobile/features/onboarding/data/join_repository.dart';
import 'package:openbekci_mobile/features/push/application/push_service.dart';

import 'fake_api.dart';

const testOrigin = 'https://gul.example.org';

AppConfig testConfig({Flavor flavor = Flavor.prod}) => AppConfig(
  flavor: flavor,
  appName: 'OpenBekci',
  relayId: 'official',
  seedColor: const Color(0xFF1A73E8),
);

Discovery testDiscovery({
  List<String> methods = const ['sms_otp', 'password', 'magic_link'],
  String serverVersion = '0.3.0',
  String minAndroid = '1.0.0',
}) => Discovery(
  origin: testOrigin,
  document: DiscoveryDocument.fromJson(
    discoveryJson(
      methods: methods,
      serverVersion: serverVersion,
      minAndroid: minAndroid,
    ),
  ),
);

SignInResult testSignIn() => SignInResult(
  accessToken: 'access-1',
  accessExpiresAt: DateTime.utc(2099),
  refreshToken: 'refresh-1',
  userId: '0192a3f0-1000-7000-8000-0000000000aa',
);

/// Scriptable [AuthRepository].
class FakeAuthRepository implements AuthRepository {
  Future<void> Function(String phone)? onRequestOtp;
  Future<SignInResult> Function(String phone, String code)? onOtpSignIn;
  Future<SignInResult> Function(String identifier, String password)?
  onPasswordSignIn;
  Future<void> Function(String email)? onRequestMagic;
  Future<SignInResult> Function(String token)? onConsumeMagic;
  Future<InvitationPreview> Function(String token)? onPreview;
  Future<SignInResult> Function(
    String token,
    String? password,
    String? displayName,
  )?
  onAccept;

  final calls = <String>[];

  @override
  Future<void> requestOtp(String phone) async {
    calls.add('requestOtp:$phone');
    await onRequestOtp?.call(phone);
  }

  @override
  Future<SignInResult> signInWithOtp({
    required String phone,
    required String code,
  }) async {
    calls.add('otp:$phone:$code');
    return await onOtpSignIn?.call(phone, code) ?? testSignIn();
  }

  @override
  Future<SignInResult> signInWithPassword({
    required String identifier,
    required String password,
  }) async {
    calls.add('password:$identifier');
    return await onPasswordSignIn?.call(identifier, password) ?? testSignIn();
  }

  @override
  Future<void> requestMagicLink(String email) async {
    calls.add('magic:$email');
    await onRequestMagic?.call(email);
  }

  @override
  Future<SignInResult> consumeMagicLink(String token) async {
    calls.add('consume:$token');
    return await onConsumeMagic?.call(token) ?? testSignIn();
  }

  @override
  Future<SignInResult> acceptInvitation(
    String token, {
    String? password,
    String? displayName,
    String? locale,
  }) async {
    calls.add('accept:$token');
    return await onAccept?.call(token, password, displayName) ?? testSignIn();
  }

  @override
  Future<InvitationPreview> previewInvitation(String token) async {
    calls.add('preview:$token');
    return await onPreview?.call(token) ?? invitationPreview();
  }
}

InvitationPreview invitationPreview({
  bool existingAccount = false,
  String? door = '12',
}) => InvitationPreview.fromJson({
  'kind': 'manager',
  'org_name': 'Gul Yonetim',
  'site_name': 'Gul Sitesi',
  'unit_door_number': door,
  'person_display_name': 'Ayse Yilmaz',
  'channel': 'sms',
  'expires_at': '2099-01-01T00:00:00Z',
  'existing_account': existingAccount,
});

class FakeServerConnector implements ServerConnector {
  new([Discovery? result]) : result = result ?? testDiscovery();

  Discovery result;
  AppError? failWith;
  final inputs = <String>[];

  @override
  Future<Discovery> connect(String input) async {
    inputs.add(input);
    if (failWith != null) throw failWith!;
    return result;
  }
}

class FakeJoinRepository implements JoinRepository {
  JoinInfo joinInfo = JoinInfo.fromJson({
    'site_name': 'Gul Sitesi',
    'org_name': 'Gul Yonetim',
    'blocks': [
      {'id': '0192a3f0-1000-7000-8000-0000000000b1', 'name': 'A Blok'},
      {'id': '0192a3f0-1000-7000-8000-0000000000b2', 'name': 'B Blok'},
    ],
  });
  List<JoinUnit> unitList = [
    JoinUnit.fromJson({
      'id': '0192a3f0-1000-7000-8000-0000000000c1',
      'door_number': '12',
      'block_name': 'A Blok',
    }),
    JoinUnit.fromJson({
      'id': '0192a3f0-1000-7000-8000-0000000000c2',
      'door_number': '14',
      'block_name': 'A Blok',
    }),
  ];
  AppError? claimError;
  final claims =
      <({String unitId, UnitClaimCreateClaimedRoleEnum role, String? note})>[];

  @override
  Future<JoinInfo> info(String code) async => joinInfo;

  @override
  Future<JoinUnitList> units(
    String code, {
    String? blockId,
    String? query,
    String? cursor,
  }) async {
    final filtered = [
      for (final u in unitList)
        if (query == null || query.isEmpty || u.doorNumber.contains(query)) u,
    ];
    return JoinUnitList(items: filtered, nextCursor: null);
  }

  @override
  Future<UnitClaim> claim(
    String code, {
    required String unitId,
    required UnitClaimCreateClaimedRoleEnum role,
    String? note,
  }) async {
    if (claimError != null) throw claimError!;
    claims.add((unitId: unitId, role: role, note: note));
    final unit = unitList.firstWhere((u) => u.id == unitId);
    return UnitClaim.fromJson({
      'id': '0192a3f0-1000-7000-8000-0000000000d1',
      'org_id': '0192a3f0-1000-7000-8000-000000000001',
      'user_id': '0192a3f0-1000-7000-8000-0000000000aa',
      'display_name': 'Ayse Yilmaz',
      'unit_id': unitId,
      'unit_door_number': unit.doorNumber,
      'claimed_role': role.value,
      'status': 'pending',
      'decided_by': null,
      'decided_at': null,
      'decision_note': null,
      'note': note,
      'created_at': '2026-11-08T10:00:00Z',
      'updated_at': '2026-11-08T10:00:00Z',
    });
  }
}

/// Test-controlled pending server.
class PreSetServer extends PendingServerController {
  new(this.initial);
  final Discovery? initial;
  @override
  Discovery? build() => initial;
}

class FixedLocale extends LocaleController {
  new(this.locale);
  final Locale locale;
  @override
  Locale? build() => locale;
}

class PreSetLink extends PendingLinkController {
  new(this.initial);
  final AppLink? initial;
  @override
  AppLink? build() => initial;
}

/// Everything a widget test needs around [OpenBekciApp].
class TestApp {
  new({
    Discovery? server,
    this.signedIn = false,
    this.locale = const Locale('en'),
    AppLink? pendingLink,
    List<Override> extra = const [],
    this.flavor = Flavor.prod,
    AppDatabase? database,
    bool pushEnabled = false,
  }) : _ownsDb = database == null {
    store = MemoryAccountStore();
    if (signedIn) {
      store
        ..account = const Account(
          serverOrigin: testOrigin,
          instanceId: '0192a3f0-1000-7000-8000-000000000999',
          instanceName: 'Gul Sitesi',
          userId: '0192a3f0-1000-7000-8000-0000000000aa',
        )
        ..refreshToken = 'refresh-1';
    }
    db = database ?? AppDatabase.forTesting(NativeDatabase.memory());
    auth = FakeAuthRepository();
    connector = FakeServerConnector(server ?? testDiscovery());
    join = FakeJoinRepository();
    links = StreamController<AppLink>.broadcast();
    adapter = FakeAdapter()
      ..answer('GET /v1/me', FakeResponse.ok(meJson()))
      ..answer(
        'POST /v1/auth/token/refresh',
        FakeResponse.ok(tokenJson(access: 'access-2', refresh: 'refresh-2')),
      )
      ..answer('DELETE /v1/me/sessions/current', const FakeResponse(204));
    overrides = [
      appConfigProvider.overrideWithValue(testConfig(flavor: flavor)),
      appInfoProvider.overrideWithValue(
        const AppInfo(version: '1.0.0', build: '1'),
      ),
      accountStoreProvider.overrideWithValue(store),
      databaseProvider.overrideWithValue(db),
      httpAdapterProvider.overrideWithValue(adapter),
      localeProvider.overrideWith(() => FixedLocale(locale)),
      if (server != null || !signedIn)
        pendingServerProvider.overrideWith(
          () => PreSetServer(signedIn ? null : (server ?? testDiscovery())),
        ),
      if (pendingLink != null)
        pendingLinkProvider.overrideWith(() => PreSetLink(pendingLink)),
      authRepositoryProvider.overrideWithValue(auth),
      serverConnectorProvider.overrideWithValue(connector),
      joinRepositoryProvider.overrideWithValue(join),
      incomingLinksProvider.overrideWithValue(links.stream),
      // Widget tests that do not exercise push run without its timers.
      pushEnabledProvider.overrideWithValue(pushEnabled),
      ...extra,
    ];
  }

  final bool _ownsDb;
  final bool signedIn;
  final Locale locale;
  final Flavor flavor;
  late final MemoryAccountStore store;
  late final AppDatabase db;
  late final FakeAuthRepository auth;
  late final FakeServerConnector connector;
  late final FakeJoinRepository join;
  late final StreamController<AppLink> links;
  late final FakeAdapter adapter;
  late final List<Override> overrides;

  Widget widget() =>
      ProviderScope(overrides: overrides, child: const OpenBekciApp());

  Future<void> dispose() async {
    await links.close();
    if (_ownsDb) await db.close();
  }
}
