import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'support/golden_support.dart';

/// Applies to every test file: golden comparisons tolerate a tiny fraction of
/// differing pixels (anti-aliasing differs a little between platforms).
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  final current = goldenFileComparator;
  if (current is LocalFileComparator) {
    goldenFileComparator = TolerantGoldenComparator(
      current.basedir.resolve('placeholder_test.dart'),
    );
  }
  await testMain();
}
