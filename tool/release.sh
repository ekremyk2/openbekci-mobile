#!/usr/bin/env bash
# Builds the prod Android App Bundle (build/app/outputs/bundle/prodRelease/app-prod-release.aab).
#   version      VERSION file (semver), --build-name
#   build number $BUILD_NUMBER, else $GITHUB_RUN_NUMBER, else the commit count
#   signing      OPENBEKCI_KEYSTORE, OPENBEKCI_KEYSTORE_PASSWORD, OPENBEKCI_KEY_ALIAS, OPENBEKCI_KEY_PASSWORD
#                (read by android/app/build.gradle.kts); without a keystore the build stops, unless
#                OPENBEKCI_ALLOW_DEBUG_SIGNING=1 (a test bundle the stores refuse)
#   --dart-define  OPENBEKCI_SERVER (default server URL), OPENBEKCI_DEFINES_FILE (a --dart-define-from-file)
# Usage: tool/release.sh [--dry-run]    (prints the command instead of running it)
set -euo pipefail
cd "$(dirname "$0")/.."
version="$(tr -d '[:space:]' < VERSION)"
[[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+(-[0-9A-Za-z.]+)?$ ]] || { echo "VERSION '$version' is not semver" >&2; exit 1; }
build="${BUILD_NUMBER:-${GITHUB_RUN_NUMBER:-$(git rev-list --count HEAD)}}"
if [ -z "${OPENBEKCI_KEYSTORE:-}" ] && [ "${OPENBEKCI_ALLOW_DEBUG_SIGNING:-}" != 1 ]; then
  echo "OPENBEKCI_KEYSTORE is not set; set it, or OPENBEKCI_ALLOW_DEBUG_SIGNING=1 for a test bundle" >&2; exit 1
fi
args=(build appbundle --release --flavor prod -t lib/main_prod.dart --build-name "$version" --build-number "$build")
[ -z "${OPENBEKCI_SERVER:-}" ] || args+=("--dart-define=OPENBEKCI_SERVER=$OPENBEKCI_SERVER")
[ -z "${OPENBEKCI_DEFINES_FILE:-}" ] || args+=("--dart-define-from-file=$OPENBEKCI_DEFINES_FILE")
if [ "${1:-}" = "--dry-run" ]; then echo flutter "${args[@]}"; exit 0; fi
flutter "${args[@]}"
echo "Built $version+$build: build/app/outputs/bundle/prodRelease/app-prod-release.aab"
