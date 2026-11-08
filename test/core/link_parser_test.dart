import 'package:flutter_test/flutter_test.dart';
import 'package:openbekci_mobile/core/links/app_link.dart';

void main() {
  group('web links', () {
    test('invitation', () {
      final link = AppLink.parse('https://Gul.Example.org/invite/abc123');
      expect(link, isA<InviteLink>());
      final invite = link! as InviteLink;
      expect(invite.token, 'abc123');
      expect(invite.origin, 'https://gul.example.org');
    });

    test('site QR join with port', () {
      final link =
          AppLink.parse('https://host.example:8443/join/XYZ-9')! as JoinLink;
      expect(link.code, 'XYZ-9');
      expect(link.origin, 'https://host.example:8443');
    });

    test('magic link', () {
      final link =
          AppLink.parse('https://host.example/login/magic?token=t0k')!
              as MagicLoginLink;
      expect(link.token, 't0k');
      expect(link.origin, 'https://host.example');
    });

    test('bare host is a server QR', () {
      final link = AppLink.parse('https://host.example/')! as ServerLink;
      expect(link.origin, 'https://host.example');
    });

    test('an unrelated page of a server falls back to the server', () {
      final link = AppLink.parse('https://host.example/orgs/1/tickets');
      expect(link, isA<ServerLink>());
    });

    test('local http (dev) keeps the scheme and port', () {
      final link = AppLink.parse('http://10.0.2.2:8484/join/c0de')! as JoinLink;
      expect(link.origin, 'http://10.0.2.2:8484');
    });
  });

  group('openbekci:// links (no host in the link)', () {
    test('magic link', () {
      final link =
          AppLink.parse('openbekci://login/magic?token=abc')! as MagicLoginLink;
      expect(link.token, 'abc');
      expect(link.origin, isNull);
    });

    test('invitation', () {
      final link = AppLink.parse('openbekci://invite/tok')! as InviteLink;
      expect(link.token, 'tok');
      expect(link.origin, isNull);
    });

    test('join', () {
      final link = AppLink.parse('openbekci://join/CODE')! as JoinLink;
      expect(link.code, 'CODE');
    });

    test('optional server= parameter names the server', () {
      final link =
          AppLink.parse(
                'openbekci://invite/tok?server=https%3A%2F%2Fgul.example.org%2Fapi',
              )!
              as InviteLink;
      expect(link.origin, 'https://gul.example.org');
    });

    test('connect link with server and invitation', () {
      final link =
          AppLink.parse(
                'openbekci://connect?server=gul.example.org&invite=tok',
              )!
              as InviteLink;
      expect(link.origin, 'https://gul.example.org');
      expect(link.token, 'tok');
    });

    test('connect link with only a server', () {
      final link = AppLink.parse(
        'openbekci://connect?server=https://gul.example.org',
      );
      expect(link, isA<ServerLink>());
    });
  });

  group('not ours', () {
    for (final text in [
      '',
      'not a url at all',
      'ftp://host/invite/x',
      'mailto:a@b.c',
      'openbekci://',
      'openbekci://invite',
      'openbekci://login/magic',
      'openbekci://login/magic?token=',
      'openbekci://reset/abc',
      'https://',
    ]) {
      test('"$text" is null', () {
        expect(AppLink.parse(text), isNull);
      });
    }
  });

  test('toString never prints the secret', () {
    expect(
      const InviteLink(token: 'SECRET', origin: 'https://a').toString(),
      isNot(contains('SECRET')),
    );
    expect(
      const MagicLoginLink(token: 'SECRET').toString(),
      isNot(contains('SECRET')),
    );
    expect(
      const JoinLink(code: 'SECRET').toString(),
      isNot(contains('SECRET')),
    );
  });
}
