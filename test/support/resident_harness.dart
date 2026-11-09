import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart' show RequestOptions;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:openbekci_mobile/app/app.dart';
import 'package:openbekci_mobile/app/router.dart';
import 'package:openbekci_mobile/core/services/services.dart';
import 'package:openbekci_mobile/features/documents/presentation/documents_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_harness.dart';
import 'fake_api.dart';
import 'fixtures.dart';

/// Records what the app hands to the share sheet.
class FakeShare implements ShareService {
  final shared = <({String filename, String mime, int size})>[];

  @override
  Future<void> shareFile({
    required Uint8List bytes,
    required String filename,
    required String mime,
  }) async {
    shared.add((filename: filename, mime: mime, size: bytes.length));
  }
}

/// Camera and gallery stand-in.
class FakePhotoPicker implements PhotoPicker {
  new(this.photos);

  final List<PickedPhoto> photos;

  @override
  Future<List<PickedPhoto>> pickFromGallery({required int limit}) async =>
      photos.take(limit).toList();

  @override
  Future<PickedPhoto?> takePhoto() async =>
      photos.isEmpty ? null : photos.first;
}

class FakeLock implements LockAuthenticator {
  new({this.available = true, this.result = LockResult.success});

  bool available;
  LockResult result;
  int prompts = 0;

  @override
  Future<bool> isAvailable() async => available;

  @override
  Future<LockResult> authenticate(String reason) async {
    prompts++;
    return result;
  }
}

/// A small valid PNG, for `Image.memory` and the photo compressor (which
/// re-encodes it as JPEG).
final tinyPng = Uint8List.fromList(
  img.encodePng(img.Image(width: 4, height: 4)),
);

/// A signed-in resident app against a [FakeAdapter] that answers the resident
/// core endpoints from the fixtures. Override single answers on `app.adapter`.
class ResidentApp {
  new({
    Map<String, Object?>? me,
    Map<String, Object?>? dashboard,
    List<Override> extra = const [],
    Locale locale = const Locale('en'),
    FakeShare? share,
    FakePhotoPicker? picker,
    FakeLock? lock,
  }) : share = share ?? FakeShare(),
       lock = lock ?? FakeLock() {
    SharedPreferences.setMockInitialValues({});
    app = TestApp(
      signedIn: true,
      locale: locale,
      extra: [
        shareServiceProvider.overrideWithValue(this.share),
        if (picker != null) photoPickerProvider.overrideWithValue(picker),
        lockAuthenticatorProvider.overrideWithValue(this.lock),
        pdfViewBuilderProvider.overrideWithValue(
          (bytes, name) => Center(child: Text('PDF ${bytes.length} $name')),
        ),
        ...extra,
      ],
    );
    final a = app.adapter
      ..answer('GET /v1/me', FakeResponse.ok(me ?? residentMeJson()))
      ..answer(
        'GET /v1/orgs/$orgId/me/dashboard',
        FakeResponse.ok(dashboard ?? dashboardJson()),
      )
      ..answer(
        'GET /v1/orgs/$orgId/units/$unit12/statements/owner',
        FakeResponse.ok(statementJson()),
      )
      ..answer(
        'GET /v1/orgs/$orgId/payments',
        FakeResponse.ok(pageOf([paymentJson()])),
      )
      ..answer(
        'GET /v1/orgs/$orgId/tickets',
        FakeResponse.ok(pageOf([ticketJson()])),
      )
      ..answer(
        'GET /v1/orgs/$orgId/ticket-categories',
        FakeResponse.ok(pageOf([categoryJson()])),
      )
      ..answer(
        'GET /v1/orgs/$orgId/announcements',
        FakeResponse.ok(pageOf([announcementJson()])),
      )
      ..answer(
        'GET /v1/orgs/$orgId/me/notifications/unread-count',
        const FakeResponse.ok({'unread': 3, 'visitor_approvals_pending': 0}),
      )
      ..answer(
        'GET /v1/orgs/$orgId/me/notifications',
        FakeResponse.ok(pageOf(<Object?>[])),
      )
      ..answer(
        'GET /v1/orgs/$orgId/folders',
        FakeResponse.ok(pageOf(<Object?>[])),
      )
      ..answer(
        'GET /v1/orgs/$orgId/documents',
        FakeResponse.ok(pageOf(<Object?>[])),
      )
      ..answer(
        'GET /v1/instance',
        FakeResponse.ok({
          ...discoveryJson(),
          'policies': {'app_lock_required': false},
        }),
      );
    // Unknown paths answer 404 problems: screens must show them, not crash.
    a.requests.clear();
  }

  final FakeShare share;
  final FakeLock lock;
  late final TestApp app;
  FakeAdapter get adapter => app.adapter;

  /// Requests seen for `'METHOD /path'`.
  List<RequestOptions> seen(String key) => adapter.seen(key);
}

void phoneSize(WidgetTester tester, {double scale = 1}) {
  tester.view
    ..physicalSize = const Size(390 * 3, 844 * 3)
    ..devicePixelRatio = 3;
  addTearDown(tester.view.reset);
}

Future<void> pumpResident(WidgetTester tester, ResidentApp r) async {
  phoneSize(tester);
  addTearDown(r.app.dispose);
  await tester.pumpWidget(r.app.widget());
  await tester.pumpAndSettle();
}

void goTo(WidgetTester tester, String location) {
  final container = ProviderScope.containerOf(
    tester.element(find.byType(OpenBekciApp)),
  );
  container.read(routerProvider).go(location);
}

String currentLocation(WidgetTester tester) {
  final container = ProviderScope.containerOf(
    tester.element(find.byType(OpenBekciApp)),
  );
  return container
      .read(routerProvider)
      .routerDelegate
      .currentConfiguration
      .uri
      .toString();
}

Future<void> tapKey(WidgetTester tester, String key) async {
  await tester.ensureVisible(find.byKey(Key(key)));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Key(key)));
  await tester.pumpAndSettle();
}

Future<void> typeInto(WidgetTester tester, String key, String text) async {
  await tester.ensureVisible(find.byKey(Key(key)));
  await tester.enterText(find.byKey(Key(key)), text);
  await tester.pump();
}

/// Opens [location] and waits for it to settle.
Future<void> open(WidgetTester tester, String location) async {
  goTo(tester, location);
  await tester.pumpAndSettle();
}

/// The decoded JSON body of a recorded request (generated clients send a
/// JSON string).
Object? bodyOf(RequestOptions request) {
  final data = request.data;
  return data is String ? json.decode(data) : data;
}
