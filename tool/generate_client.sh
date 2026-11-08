#!/usr/bin/env bash
# Regenerates packages/openbekci_api from the pinned spec (spec/openapi.yaml).
#   1. prune the spec to tool/client_ops.txt (dart run tool/prune_spec.dart)
#   2. openapi-generator (dart-dio, json_serializable, enumUnknownDefaultCase) -> temp dir
#   3. swap lib/ of packages/openbekci_api, run build_runner there
# Needs: Java 11+ (JAVA_HOME or PATH), Dart/Flutter on PATH. The generator jar is downloaded once to
# .tool_cache/ and checked against tool/generator/openapi-generator.lock.
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"
lock=tool/generator/openapi-generator.lock
url="$(grep '^url=' $lock | cut -d= -f2-)"; want="$(grep '^sha256=' $lock | cut -d= -f2)"
jar=".tool_cache/openapi-generator-cli.jar"
sha() { (sha256sum "$1" 2>/dev/null || shasum -a 256 "$1") | cut -d' ' -f1; }
if [ ! -f "$jar" ] || [ "$(sha $jar)" != "$want" ]; then
  mkdir -p .tool_cache
  echo "Downloading openapi-generator-cli ..."
  curl -sSL -o "$jar" "$url"
  [ "$(sha $jar)" = "$want" ] || { echo "sha256 mismatch for $jar" >&2; rm -f "$jar"; exit 1; }
fi
[ -f spec/openapi.yaml ] || { echo "spec/openapi.yaml missing: run tool/fetch_spec.sh" >&2; exit 1; }
work="$(mktemp -d)"; trap 'rm -rf "$work"' EXIT
dart pub get >/dev/null
dart run tool/prune_spec.dart spec/openapi.yaml tool/client_ops.txt "$work/spec.json"
java -jar "$jar" generate -g dart-dio -i "$work/spec.json" -o "$work/out" \
  --skip-validate-spec \
  --additional-properties=pubName=openbekci_api,serializationLibrary=json_serializable,enumUnknownDefaultCase=true,useEnumExtension=true,nullableFields=true \
  >"$work/gen.log" 2>&1 || { tail -30 "$work/gen.log"; exit 1; }
pkg=packages/openbekci_api
rm -rf "$pkg/lib"
mkdir -p "$pkg/lib"
cp -r "$work/out/lib/." "$pkg/lib/"
cp "$work/out/build.yaml" "$pkg/build.yaml"
cp spec/api_version.lock "$pkg/lib/.spec_version"
# Generator bug: enum-typed defaults come out as `const XEnum._('web')`; turn them into `XEnum.web`.
grep -rlE "const [A-Za-z]+Enum\._\(" "$pkg/lib" | while read -r f; do
  sed -i -E "s/const ([A-Za-z]+Enum)\._\('([a-z_]+)'\)/\1.\2/g" "$f"
done
# Same bug for json_serializable: `defaultValue: 'web'` is a String for an enum field and does not compile.
# The constructor default already supplies the value, so drop the annotation argument.
grep -rlE "^    defaultValue: '[a-z_]+',$" "$pkg/lib" | while read -r f; do
  sed -i -E "/^    defaultValue: '[a-z_]+',$/d" "$f"
done
(cd "$pkg" && dart pub get >/dev/null && dart run build_runner build --delete-conflicting-outputs 2>&1 | tail -3)
echo "Generated $(find $pkg/lib -name '*.dart' ! -name '*.g.dart' | wc -l) files into $pkg"
