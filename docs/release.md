# Releasing the app

Store submission is manual: CI builds and attaches the bundle, a person uploads it.

## Cut a release

1. Set the version in `VERSION` (semver, no `v`), merge it, and check that the N-1 and N-2 contract matrix
   (`test/contract/compat_matrix_test.dart`) and the golden, a11y and live suites are green.
2. Tag: `git tag v$(cat VERSION) && git push origin v$(cat VERSION)`.
3. `.github/workflows/release.yml` checks the tag against `VERSION`, builds the signed prod App Bundle with
   `tool/release.sh` and attaches `app-prod-release.aab` to a GitHub release. It does not upload to any store.

Version: `--build-name` is `VERSION`; the build number is `$BUILD_NUMBER`, else the workflow run number, else the commit
count (Play needs it to rise with every upload).

### Local build

```sh
export OPENBEKCI_KEYSTORE=/abs/path/release.jks OPENBEKCI_KEYSTORE_PASSWORD=... OPENBEKCI_KEY_ALIAS=... OPENBEKCI_KEY_PASSWORD=...
export OPENBEKCI_SERVER=https://app.example.org     # optional: --dart-define default server (else assets/app_config.json)
tool/release.sh            # or tool/release.ps1; --dry-run / -DryRun prints the flutter command
```

Without a keystore the script stops; `OPENBEKCI_ALLOW_DEBUG_SIGNING=1` builds a debug-signed test bundle the stores
refuse. `OPENBEKCI_DEFINES_FILE` adds a `--dart-define-from-file`.

### CI secrets and variables

Secrets: `ANDROID_KEYSTORE_BASE64` (`base64 -w0 release.jks`), `ANDROID_KEYSTORE_PASSWORD`, `ANDROID_KEY_ALIAS`,
`ANDROID_KEY_PASSWORD`. Variable (optional): `OPENBEKCI_SERVER`. Push needs `android/app/google-services.json` (never
committed, README "Push"); the workflow does not provide it yet, so a CI bundle polls instead of receiving FCM push.

## Google Play (manual)

1. Play Console, the app (`org.openbekci.mobile`), Testing > Internal testing > Create release; use Play App Signing
   and upload `app-prod-release.aab`. Release notes per language (en, tr).
2. Once: store listing (title, short and full description, screenshots, icon, feature graphic), content rating
   questionnaire, target audience (adults), Data safety form (below), app access (below), privacy policy URL.
3. Promote internal > closed > production after the reviewer demo instance is checked. Raise `min_app_version` on the
   hosted instance only after the rollout reaches everyone.

**App access for reviewers:** needs a demo instance with a seeded site and test sign-in credentials (plan section 15);
enter them under App content > App access. This does not exist yet.

## App Store (manual, not built yet)

The app is Android first; there is no iOS runner in this repository. When it exists: archive in Xcode, upload to
TestFlight, fill the App Privacy labels from the table below, add the same reviewer credentials. If the hosted
instance offers Google sign-in, Apple requires Sign in with Apple beside it.

## Privacy form answers

Answers describe what the app does; re-check them against the server's `PRIVACY.md` (not in either repository yet) and
the consent texts before each submission.

| Question | Answer |
|---|---|
| Collected data | Name, email address, phone number (account, unit contact); unit and household membership; payment history and amounts owed (financial info shown to the resident, produced by the site); photos a resident attaches to a ticket; device push token and app version (device record); user-generated content (tickets, comments, visitor entries, poll answers) |
| Purpose | App functionality and account management only. No advertising, no analytics SDK, no crash reporter, no tracking |
| Shared with third parties | Not sold or shared for advertising. Push goes through the configured relay (FCM for the store build). Card payments happen on the payment provider's own page in a Custom Tab; the app and the server never see card data |
| Linked to identity | Yes (data belongs to the signed-in account) |
| Encrypted in transit | Yes: the prod flavor allows HTTPS only |
| Encrypted at rest | Refresh token in the Android Keystore through `flutter_secure_storage`; the read cache is app-private storage, cleared on sign-out |
| Deletion | Sign-out removes the device record and local data; deleting the account and its records goes through the site manager or the web app (confirm the process before submitting) |
| Permissions | Camera (QR scan, ticket photos), notifications (Android 13+), biometrics (optional app lock), internet |
| Children | Not directed at children |
