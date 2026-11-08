#!/usr/bin/env bash
# Pins the OpenBekci API spec: copies the bundled openapi.yaml from a core checkout into spec/
# and records the core commit it came from in spec/api_version.lock.
# Usage: tool/fetch_spec.sh [path-to-core-repo]   (default: ../OpenBekci or $OPENBEKCI_CORE_REPO)
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
core="${1:-${OPENBEKCI_CORE_REPO:-$root/../OpenBekci}}"
src="$core/api/openapi.yaml"
[ -f "$src" ] || { echo "No api/openapi.yaml in $core" >&2; exit 1; }
commit="$(git -C "$core" rev-parse HEAD)"
mkdir -p "$root/spec"
cp "$src" "$root/spec/openapi.yaml"
hash="$( (sha256sum "$root/spec/openapi.yaml" 2>/dev/null || shasum -a 256 "$root/spec/openapi.yaml") | cut -d' ' -f1)"
{
  echo "commit=$commit"
  echo "sha256=$hash"
  echo "source=api/openapi.yaml"
  [ -n "$(git -C "$core" status --porcelain -- api/openapi.yaml)" ] && echo "dirty=true"
} > "$root/spec/api_version.lock" || true
echo "Pinned spec from $core @ $commit (sha256 $hash)"
