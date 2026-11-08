# openbekci-mobile

The OpenBekci resident app (Flutter, Android first). It works against **any OpenBekci instance**: the hosted service or
a self-hosted server, chosen at first launch through the discovery document. Licensed **MPL-2.0** (see `LICENSE`).

Plans: `docs/plans/03-mobile.md` in the core repository (`ekremyk2/OpenBekci`). This repository consumes a **pinned
OpenAPI spec**; it never builds against the core working tree.

Status: **phase A (foundation)**. Server entry and site QR scan, sign-in by SMS code, password, email link and
invitation, unit claim ("waiting for approval"), single account, token refresh, read cache and a minimal profile. The
resident screens (statement, tickets, ...) are phase B.

## Requirements

- Flutter **3.47.9** stable (pinned in `.fvmrc`), Dart 3.13
- JDK 17 and the Android SDK (for `flutter build apk`)
- Java 11+ only to regenerate the API client (see below), not to build or test

## Run

```sh
flutter pub get
flutter run --flavor dev -t lib/main_dev.dart                 # emulator: the server is http://10.0.2.2:8484
flutter run --flavor prod -t lib/main_prod.dart               # HTTPS only
flutter build apk --debug --flavor dev -t lib/main_dev.dart   # build/app/outputs/flutter-apk/app-dev-debug.apk
```

### Flavors

| | `dev` | `prod` |
|---|---|---|
| Entry point | `lib/main_dev.dart` | `lib/main_prod.dart` |
| Application id | `org.openbekci.mobile.dev`, label "OpenBekci Dev" | `org.openbekci.mobile`, label "OpenBekci" |
| Plain `http://` | only `localhost`, `127.0.0.1`, `10.0.2.2` (app check and Android `network_security_config` in `android/app/src/dev`) | never |
| User-installed CAs | trusted | trusted (private-CA self-hosting, plan section 5.1) |

### Point the dev flavor at a server

The server screen takes an address (`example.org`, `https://example.org`, `http://10.0.2.2:8484` in dev), a pasted
invitation / site / sign-in link, or a scanned QR. To prefill it, pass a compile-time default:

```sh
flutter run --flavor dev -t lib/main_dev.dart --dart-define=OPENBEKCI_SERVER=http://10.0.2.2:8484
```

`10.0.2.2` is the emulator's alias for the host. For a phone on the same network use the host's LAN address (the dev
flavor allows plain http to loopback aliases only; use HTTPS or a tunnel for anything else). The release default comes
from `assets/app_config.json` (`default_server_url`, `relay_id`, brand colors, support URL).

To run a local server see `server/README.md` in the core repository (`tools/dev-db`, `migrate up`, `serve` with
`OPENBEKCI_SMS_PROVIDER=log` and `OPENBEKCI_MAIL_PROVIDER=log`, so sign-in codes and links appear in the server log).

### Links

`openbekci://invite/<token>`, `openbekci://join/<code>`, `openbekci://login/magic?token=<token>` open the app
(Android intent filter); so do the same paths on a server's own URL once App Links are verified for a domain (the
hosted domain is not configured yet, see `AndroidManifest.xml`). Pasting `https://host/invite/<token>` into the server
field works everywhere.

## Layout

```
lib/main_dev.dart, main_prod.dart   entry points
lib/app/        MaterialApp.router, go_router and its guards, theme, AppConfig
lib/core/       api (Dio, interceptors, AppError), account, auth (token manager, sign-in, links), instance
                (discovery, version gate), db (drift read cache), cache (stale-while-revalidate), permissions,
                l10n (money, site-timezone dates, codes.dart), widgets
lib/features/   onboarding (server, scan, sign-in methods, invitation, join and claim), home, profile
lib/l10n/       ARB files (en, tr) and the generated AppLocalizations
packages/openbekci_api/   generated API client (committed)
spec/           pinned openapi.yaml and api_version.lock
tool/           fetch_spec, generate_client, prune_spec, client_ops.txt
docs/adr/       architecture decisions
test/ integration_test/   see Tests
```

State is Riverpod (plain `Notifier`/`Provider`, no codegen), routing is go_router (hand-written routes), tokens are
opaque strings: the refresh token lives in `flutter_secure_storage`, the access token in memory only.

## Regenerate the API client

```sh
tool/fetch_spec.sh ../OpenBekci          # or: tool/fetch_spec.ps1 -CoreRepo ..\OpenBekci
tool/generate_client.sh                  # or: tool/generate_client.ps1   (needs JAVA_HOME or java on PATH)
```

`fetch_spec` copies the core repo's bundled `api/openapi.yaml` into `spec/` and records the core commit and SHA-256 in
`spec/api_version.lock`. `generate_client` prunes the spec to the operations in `tool/client_ops.txt`, runs
openapi-generator (`dart-dio`, `json_serializable`, `enumUnknownDefaultCase`), and runs `build_runner` in the package.
Commit the result. Why this generator: `docs/adr/0001-dart-client-generator.md`. To cover more of the API, add
`operationId` patterns to `tool/client_ops.txt` first.

Other generated code: `dart run build_runner build` (drift database), `flutter gen-l10n` (also runs on `pub get`).

## Localization

ARB files `lib/l10n/app_en.arb` (template) and `app_tr.arb`. Backend problem codes map to strings in one place,
`lib/core/l10n/codes.dart`, with a generic fallback and the raw code under "details". Money (`MoneyText`) and dates
(`SiteDate`, site timezone) go through `lib/core/l10n/format.dart`. RTL is covered by goldens in a pseudo `ar` locale
(Arabic Material localizations, English strings); the app ships no Arabic yet.

## Tests

```sh
flutter analyze            # very_good_analysis, strict casts/inference/raw types
dart format --output=none --set-exit-if-changed lib test tool integration_test
flutter test               # unit, widget, contract, goldens; live tests skip themselves
```

- **Unit**: `AppError` mapping, token manager single-flight refresh, interceptors, link parsing, discovery and
  version gate, money and site-date formatting, permissions, error-code strings, drift read cache.
- **Contract** (`test/contract`): the generated client against the pinned spec; unknown enum values decode to the
  unknown case; the spec file matches its lock.
- **Widget** (`test/features`): every onboarding screen and flow with fakes: server entry, gate, SMS code, password,
  email link, invitation, site QR and claim, profile and sign-out, offline hint.
- **Goldens** (`test/golden`): onboarding screens in light, dark, Turkish and an RTL pseudo-`ar` column, plus 200 %
  text. Fonts are the test font, so the images are the same on every OS. Update deliberately with
  `flutter test --update-goldens test/golden` and review the diff; **CI never updates goldens**. The committed images
  are the ones rendered on Linux (as CI does); text edges differ by about 1 % of the pixels on other platforms, so
  there set `GOLDEN_TOLERANCE=0.02` to compare locally (CI uses 0.2 %). To refresh them, take the `*_testImage.png`
  files from the `golden-failures` artifact of a CI run rather than regenerating on Windows or macOS.
- **Live** (`test/live`): the real app (router, guards, Dio, token manager, generated client) over real HTTP against a
  running dev server. Skipped unless these are set:

  ```sh
  OPENBEKCI_LIVE_SERVER=http://localhost:8484
  OPENBEKCI_LIVE_LOG=/path/to/server.log                # server started with SMS and mail providers = log
  OPENBEKCI_LIVE_ADMIN_EMAIL=ayse@example.org           # an organization administrator with a password
  OPENBEKCI_LIVE_ADMIN_PASSWORD=...
  flutter test test/live
  ```

  It seeds a site, blocks and units through the admin API on every run, then signs in by invitation (pasted link),
  SMS code (read from the server log), password and email link, claims a unit through the site QR path and checks the
  token refresh against the real server.
- **Integration** (`integration_test/app_test.dart`): an on-device smoke test; needs an emulator or phone.

## CI

`.github/workflows/ci.yml` runs on pull requests: `pub get`, format check, `flutter analyze`, `flutter test`
(including goldens, compared never updated) and `flutter build apk --debug --flavor dev`, with pub and Gradle caches.

## Known gaps against the backend contract (phase A)

- There is **no self sign-up** endpoint: `auth.requestOtp` only answers for existing accounts, so "site QR, sign up with
  SMS code, claim" needs the account to exist first (invitation or a manager). The app claims after sign-in.
- **`GET /v1/me/unit-claims`** (list my claims) is in the draft contract but not served, so the app remembers its own
  claims locally until the unit shows up in `/v1/me`.
- `openbekci://` links carry **no server address** (backend `LinkURL`); invitations created by a manager are sent as
  web links `{BASE_URL}/invite/{token}`. The app resolves hostless links against the server it is connecting to, and
  accepts pasted web links; it also understands an optional `server=` query parameter.
- `server_version` is `dev` on development builds; the app does not gate those.
- The unknown case of an open enum does not keep the raw string (ADR 0001).
