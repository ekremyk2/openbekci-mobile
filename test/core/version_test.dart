import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('VERSION is a semver the release script accepts', () {
    expect(
      File('VERSION').readAsStringSync().trim(),
      matches(RegExp(r'^\d+\.\d+\.\d+(-[0-9A-Za-z.]+)?$')),
    );
  });
}
