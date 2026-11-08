import 'dart:async';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'support/golden_support.dart';

/// Applies to every test file: golden comparisons tolerate a tiny fraction of
/// differing pixels (glyph edges are rasterized slightly differently per
/// platform). The goldens are authored on Linux, as CI renders them; elsewhere
/// set GOLDEN_TOLERANCE=0.02 (2 percent) to check them locally.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  final current = goldenFileComparator;
  if (current is LocalFileComparator) {
    goldenFileComparator = TolerantGoldenComparator(
      current.basedir.resolve('placeholder_test.dart'),
      tolerance:
          double.tryParse(Platform.environment['GOLDEN_TOLERANCE'] ?? '') ??
          0.002,
    );
  }
  await testMain();
}
