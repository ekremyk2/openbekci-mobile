#!/usr/bin/env bash
# Runs a command that builds native assets (pdfium_dart and sqlite3 hooks
# download prebuilt libraries from github.com), retrying with a growing sleep.
# Between attempts the hook outputs are deleted so a truncated download (a
# sqlite3 hash mismatch) or a half-written directory is never reused.
#
# usage: tool/ci/retry_native_assets.sh <command> [args...]
set -u
attempts=5
for attempt in $(seq 1 "$attempts"); do
  if "$@"; then
    exit 0
  fi
  if [ "$attempt" -lt "$attempts" ]; then
    delay=$((attempt * 60))
    echo "::warning::attempt $attempt of $attempts failed; clearing downloaded native assets and retrying in ${delay}s"
    rm -rf .dart_tool/hooks_runner .dart_tool/native_assets
    sleep "$delay"
  fi
done
echo "::error::failed after $attempts attempts"
exit 1
