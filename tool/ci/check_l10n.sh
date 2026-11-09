#!/usr/bin/env bash
# Fails when a locale lacks a key or when lib/ holds a hard-coded English label.
set -euo pipefail
flutter gen-l10n
f=build/untranslated_messages.json
if [ -s "$f" ] && [ "$(tr -d ' \n\r\t' < "$f")" != "{}" ]; then
  echo "Untranslated messages:"; cat "$f"; exit 1
fi
git diff --exit-code -- lib/l10n/gen
# Language names are shown in their own language on purpose.
if grep -rnE "(Text|title|label|hintText|labelText|tooltip|semanticLabel|subtitle|helperText|errorText)[:(] *(const )?(Text\()?'[A-Z][a-z]+" lib --include=*.dart \
  | grep -v "lib/l10n/gen" | grep -vE "Text\('(English|Türkçe)'\)"; then
  echo "Hard-coded user-facing string in lib/: move it to the ARB files"; exit 1
fi
