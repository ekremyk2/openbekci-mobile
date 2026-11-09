# openbekci-mobile

The OpenBekci resident app (Flutter, Android first). It works against **any OpenBekci instance**: the hosted service or
a self-hosted server, chosen at first launch through the discovery document. Licensed **MPL-2.0** (see `LICENSE`).

Plans: `docs/plans/03-mobile.md` in the core repository (`ekremyk2/OpenBekci`). This repository consumes a **pinned
OpenAPI spec**; it never builds against the core working tree.

Status: **phase D (card checkout, contract matrix, a11y, release automation)**, on top of phase C (community, governance, push) and phase B (resident core). On top of phase A (server entry, site QR scan, sign-in by SMS code, password, email
link and invitation, unit claim, token refresh, read cache): home per organization, the statement per debtor side with
the late fee accrued to today and a PDF, pay by bank transfer with the "I've paid by transfer" declaration, tickets
(per-site workflow statuses, private or common, "+1", photos), announcements with read receipts, documents (including
the unit's private folder and generated files), the notification center with mutes, and the profile (my details, gate
contact phone, directory opt-in, sessions, app lock, consents, about). Phase C adds bookings (rules, slot picker, fee preview, cancel with the refund rule), visitors (pre-registration with a
shared QR, recurring visitors, approve or deny from a notification), parcels, governance (assembly with agenda and call
letter, pre-meeting polls, check-in QR, decisions, minutes), device registration, push handling and the "Open in web"
action. Phase D adds card checkout ("Pay by card" when the site settings say `payments.card.available`: charges or an
amount per side, `money.createCheckout` with `client=mobile`, the provider page in a Custom Tab, the return link
`openbekci://pay/return?org_id&checkout_id`, a status poll with backoff that shows `amount_mismatch`, and "my card
payments"), the N-1/N-2 contract matrix, an accessibility test and release automation (`docs/release.md`).

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

## Push

`lib/features/push`: the push layer is written against a `PushTransport` (FCM, UnifiedPush or a fake), a `LocalNotifier`
(Android channels per area, Approve / Deny buttons) and a `PushController` (registration after sign-in and on token
change, `DELETE /v1/me/devices/{id}` on sign-out, generic per-type titles, `GET /v1/me/notifications/{id}` to replace the
text while the app runs, taps routed by type, badge from the payload, periodic fetch of the unread count with the
"notifications may be delayed" hint when registration fails, the instance has no relay or nothing arrived for six hours).

- **prod** (`lib/main_prod.dart`) uses Firebase Cloud Messaging through the relay. **No `google-services.json` is committed**
  (it is in `.gitignore`). To build with push, put the Firebase project's file at `android/app/google-services.json`
  (or `android/app/src/prod/google-services.json`); the Gradle script applies the google-services plugin only when a file
  exists. Without it the build works and the app uses periodic fetching.
- **dev** and **foss** (`lib/main_dev.dart`, `lib/main_foss.dart`) use UnifiedPush (`push_kind: unifiedpush`, the endpoint
  URL as token; the server posts the payload to it). With no distributor app installed they use periodic fetching. The
  `foss` Gradle flavor exists, but the Firebase libraries are still linked into it (never initialized); a Google-free
  binary needs the Firebase dependencies split out (follow-up).
- Dev flavor without Firebase: tests use a fake transport that delivers payloads (`test/support/push_harness.dart`).

## Layout

```
lib/main_dev.dart, main_prod.dart   entry points
lib/app/        MaterialApp.router, go_router and its guards, theme, AppConfig
lib/core/       api (Dio, interceptors, AppError), account, auth (token manager, sign-in, links), org (current
                organization and site), files, services (share, photo picker, app lock), instance
                (discovery, version gate), db (drift read cache), cache (stale-while-revalidate), permissions,
                l10n (money, site-timezone dates, codes.dart), widgets
lib/features/   onboarding (server, scan, sign-in methods, invitation, join and claim), home, money (statement, pay),
                tickets, announcements, documents, notifications, profile, shell (bottom navigation, app lock gate)
                each with data/ (repository), application/ (providers) and presentation/ where it has them
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
- **Resident core, live** (`test/live/live_resident_test.dart`, same variables): seeds a site from a units CSV with bank
  details, a cash box, an owner, a tenant and a household member (accounts through invitations read from the server
  log), overdue dues, a recorded cash payment and a published announcement; then drives the app as the owner (home and
  statement per side with the accrued late fee, a declared transfer, a ticket with a photo, "+1", a comment, the
  announcement read receipt, all checked through the admin API), as the tenant (tenant side only) and as the household
  member (no money). Start the server from the core repository as for the phase A suite.
- **Community, governance and push, live** (`test/live/live_community_test.dart`): books a facility with a fee and cancels
  it (refund checked), pre-registers a visitor and reads its `obk1.` QR token, answers a guard-created approval request,
  lists a guard-logged parcel, answers a poll and reads the check-in token, registers a `unifiedpush` device pointing at a
  local HTTP endpoint and asserts that the server posts exactly the six payload keys to it. Start the server with
  `OPENBEKCI_PUSH_ALLOW_PRIVATE=true` and an organization administrator account (same variables as above).
- **Contract matrix** (`test/contract/compat_matrix_test.dart`): samples built from the two previous spec pins kept in
  `spec/compat/` (N-1 and N-2, with their locks) are decoded by the current generated client, alone and with an unknown
  field on every object and an unknown value for every enum. Known gaps (fields the current spec requires that an older
  server lacks) are listed in the test. When bumping the pin: copy the current `spec/openapi.yaml` and lock into
  `spec/compat/` under the old commit's short sha and drop the oldest pair.
- **Accessibility** (`test/features/a11y_test.dart`): `meetsGuideline` for 48 dp targets, labelled targets and text contrast on
  home, money and card checkout, light and dark.
- **Card checkout, live** (`test/live/live_checkout_test.dart`): needs a server built with `-tags examplepack` (the example
  pack's fake provider; the test enables it with a webhook secret). The provider has no page a test can drive, so the
  test posts the signed "paid" callback to `/v1/orgs/{org}/packs/example/payments/example/webhook` itself (once for the
  full amount, once for less, which shows the mismatch notice), feeds the return link to the app and checks the
  payments the server booked.
- **Integration** (`integration_test/app_test.dart`): an on-device smoke test; needs an emulator or phone.

## Release

`VERSION` holds the semver; `tool/release.sh` (or `.ps1`) builds the prod AAB; a `v*` tag runs `.github/workflows/release.yml`.
Store steps and privacy-form answers: `docs/release.md`.

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

## Known gaps against the backend contract (phase B)

- **No `PATCH /v1/me`**: name and locale of the user cannot be updated through the served contract. The profile edits
  the name and the gate contact phone through `PATCH /v1/orgs/{org}/me/person` and keeps the language as a device
  setting (sent as `Accept-Language`), not stored on the server.
- **No consents endpoints** (texts, accept, decline): the only consent served is the per-site directory opt-in
  (`PUT /v1/orgs/{org}/me/directory-consent`), which the Consents screen lists. Other consent documents need endpoints.
- **Card checkout capability** (resolved in phase D): the button follows `payments.card.available` of `GET /sites/{id}/settings`.
- **Pending declared payments are not statement lines** (nothing is posted until a manager confirms): the app lists
  them from `GET /payments` as "declared, awaiting confirmation" above the lines.
- **`DebtorRef` (oneOf with a discriminator) is flattened by the generator**: `tool/prune_spec.dart` rewrites it into
  one object with only `mode` required; `format: date` of sent values stays a string (see ADR 0001 additions).
- Statement and file downloads (`format=pdf`, `/files/{id}`) are multi-content operations: the app reads their bytes
  through Dio directly instead of the generated method.
- `tickets`: residents get the ticket list of the **site**; "my unit's" private tickets are whatever the server returns
  (own private plus all common).
- `GET /v1/orgs/{org}/folders` without `parent_id` is assumed to list every folder (the tree is built client side).

## Known gaps against the backend contract (phase C)

- **No booking preview endpoint.** The fee shown before confirming is the facility's flat fee, and the refund rule comes from
  `cancel_refund_cutoff_hours`; the app computes both. Quota, lead time and hours are mirrored client side, the server decides.
- **`MyPoll.answered_units` has no answer**, so the app shows "answered" per unit but cannot show which answer; it remembers
  what this device sent.
- **`GET /v1/orgs/{org}/visitor-approval-requests/{id}` does not exist**; the approval screen reads the list (two pages).
- The generated client **sends `null` as the body** of an optional request body that is not given (`communityCancelBooking`):
  the server answers 422. The app always sends `{}`. Query `date-time` values were sent as `DateTime.toString()`
  (`2026-11-08 21:00:00.000Z`, a 422): `tool/prune_spec.dart` now makes them strings.
- **Push payload carries no text**, so a background message on Android can only show the generic title; the text is fetched
  while the app runs. Notification buttons open the app (they need the session), then the answer is sent at once.
- Background fetch (WorkManager) for the periodic fallback is not built: the fallback runs while the app process lives.
- The `foss` flavor still links Firebase (see Push).
