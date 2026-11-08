import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_mobile/core/api/interceptors.dart';

void main() {
  group('scrubUrl', () {
    test('masks tokens in queries and secret path segments', () {
      for (final (url, secret) in [
        ('https://h.org/login/magic?token=abc.def', 'abc.def'),
        ('https://h.org/v1/invitations/INVTOKEN', 'INVTOKEN'),
        ('https://h.org/v1/join/JOINCODE/units?q=1', 'JOINCODE'),
        ('https://h.org/reset/RESETTOK', 'RESETTOK'),
        ('https://h.org/login/link/WEBTOK', 'WEBTOK'),
        ('https://h.org/v1/x?otp=123456&Idempotency-Key=k-1', '123456'),
      ]) {
        expect(scrubUrl(Uri.parse(url)), isNot(contains(secret)), reason: url);
      }
      expect(
        scrubUrl(Uri.parse('https://h.org/v1/x?otp=1&key=k')),
        isNot(contains('k-1')),
      );
    });
  });

  group('scrubText', () {
    test('masks bearer tokens, idempotency keys and body secrets', () {
      const text =
          'Authorization: Bearer a.b-c_d~e '
          'Idempotency-Key: 0192-aaaa-bbbb '
          '{"code":"123456","otp":"987654","refresh_token":"r.t","password":"pw"}';
      final out = scrubText(text);
      for (final secret in [
        'a.b-c_d~e',
        '0192-aaaa-bbbb',
        '123456',
        '987654',
        'r.t',
        'pw',
      ]) {
        expect(out, isNot(contains(secret)), reason: secret);
      }
    });
  });
}
