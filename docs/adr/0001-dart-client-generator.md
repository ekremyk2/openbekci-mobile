# ADR 0001: Dart client generator

- Status: accepted (phase A, 2026-11-09)
- Context: mobile plan section 3 (API client row) asks for a generated client from the pinned OpenAPI spec, with
  `enumUnknownDefaultCase` for open enums, and a spike in phase A: `dart-dio` with `built_value`, or, if that is too
  heavy, `dart` plus `json_serializable`.

## Decision

Use **openapi-generator 7.27.0, `dart-dio` target with `serializationLibrary=json_serializable`**, generated from a
**pruned copy of the pinned spec**, committed as the package `packages/openbekci_api` (path dependency of the app).

The pipeline (`tool/fetch_spec.*`, `tool/generate_client.*`):

1. `tool/fetch_spec` copies the bundled `api/openapi.yaml` of a core checkout to `spec/openapi.yaml` and records the
   core commit and the SHA-256 in `spec/api_version.lock`. A test checks that file against the lock, and that the
   generated package was built from the same lock (`packages/openbekci_api/lib/.spec_version`).
2. `tool/prune_spec.dart` keeps only the operations listed in `tool/client_ops.txt` (glob patterns on `operationId`)
   and the components they reach, and writes JSON.
3. The generator jar (downloaded once to `.tool_cache/`, SHA-256 pinned in `tool/generator/openapi-generator.lock`)
   generates into a temp dir; `lib/` of the package is replaced; two known generator bugs are patched (below);
   `build_runner` produces the `*.g.dart` files, which are committed so CI and contributors need neither Java nor
   `build_runner` for the client.

## Spike

All three candidates were generated from the same pruned spec (23 paths, 48 schemas) and compared. Only the chosen
one was built, analyzed and exercised end to end.

| Candidate | Generated Dart (before codegen) | Notes |
|---|---|---|
| `dart-dio` + `built_value` | 48 model files, 11.3k lines | Heaviest: every model carries `Builder` and `Serializer` boilerplate, enums go through `EnumClass`, needs the `built_value` runtime and a large `build_runner` pass. Open-enum handling works (`enumUnknownDefaultCase`), but the app would work with builders, not plain classes. |
| `dart-dio` + `json_serializable` | 47 model files, 8.7k lines | Plain immutable classes with `fromJson`/`toJson`, optional `copyWith`; Dio-native so the plan's interceptors (bearer, single-flight refresh, `Idempotency-Key`, retry) attach directly to the same `Dio`. `build_runner` over the package takes 15 to 30 s. **Chosen.** |
| `dart` (`http` package) | 47 model files, 11.3k lines | No `build_runner`, but it brings its own `http`-based `ApiClient`: every plan requirement for Dio interceptors would be re-implemented around `http` and the single-flight refresh could not share one stack. Rejected on the HTTP choice, not on model quality. |

Not evaluated: `swagger_parser`, `chopper`-style generators and a hand-written client. The plan forbids hand-written API
models, and the two openapi-generator Dart targets above already cover the spike's question ("too heavy?").

Cost of generating the whole spec: it has 402 operations and 488 schemas; pruning to what a phase needs keeps the
generated package at 59 hand-reviewable files. Phase B adds the operations it needs to `tool/client_ops.txt`.

## Open enums

The spec marks open enums with `x-open-enum: true` plus an `enum` list. With `enumUnknownDefaultCase=true` every
generated enum gets an extra `unknownDefaultOpenApi` value and every enum field a
`@JsonKey(unknownEnumValue: ...unknownDefaultOpenApi)`, so an unknown wire value decodes to that case instead of
throwing. `test/contract/open_enum_test.dart` asserts this for the enums the app reads (occupancy kind and side,
permission, role, invitation kind and channel, claim status, session client), for a whole `/v1/me` document with
unknown values, and, by scanning the generated sources, that **every** generated enum has the unknown case.

Open enums on input (auth method ids, filters) have no `enum` list in the spec, so they are plain strings.

Known limitation: the unknown case does **not** keep the raw wire string, whereas the plan says unknown values
"render as their raw string". Screens show a neutral label for the unknown case (for example "Resident"). Keeping the
raw string would need a custom `JsonConverter` per open enum, or a generator template change; revisit when a screen
needs to display an unknown value verbatim (status names are per-site workflow strings in phase B and are plain
strings in the spec, so they are not affected).

## Generator bugs patched by `tool/generate_client.sh`

1. A field with a default of an enum type is emitted as `const XEnum._('web')` (no such constructor). The script
   rewrites it to `XEnum.web`.
2. For the same fields `@JsonKey(defaultValue: 'web')` is a `String` for an enum field and does not compile. The
   script drops the annotation argument (the constructor default supplies the value).

Both only affect the request `client` field (`web` / `mobile`). If the generator is upgraded, delete the patches that
are no longer needed.

## Consequences

- The app depends on `openbekci_api` by path; bumping the spec is: `tool/fetch_spec`, edit `tool/client_ops.txt` if
  needed, `tool/generate_client`, commit the diff (mobile plan section 15: "an ordinary PR with regenerated code").
- The plan's "published Dart client from core releases" is not available yet (the core repo publishes no client
  package), so the app generates its own from the pinned spec. When core publishes one, replace the package and keep
  the contract tests.
- Generated Java-tooling (JDK 11+) is needed only to regenerate, never to build or test the app.
- Generated enum members have unwieldy names (`Permission.accessPeriodManage`); the app compares by `.value`
  (`PermissionSet.canNamed`) where readability matters.

## Phase B additions: contract fix-ups in `prune_spec`

Generating the resident core (41 more operations) exposed two generator limits that `tool/prune_spec.dart` now corrects
before the generator runs (the pinned spec itself stays untouched):

- **Discriminated `oneOf`.** `DebtorRef` (`unit_side` or `person`) came out as a single class with every member of both
  variants `required`, which cannot decode a real statement. It is rewritten as one object with only `mode` required
  and the variant fields optional; `DebtorRefUnitSide` and `DebtorRefPerson` are dropped.
- **`format: date` on values the app sends.** The generated Dart models a date as `DateTime` and serializes a full ISO
  timestamp, but the server wants `YYYY-MM-DD`. Query parameters and `PaymentDeclare.paid_on` become plain strings;
  dates the app only reads stay `DateTime`.

Binary bodies (statement PDF, file content) are multi-content operations and are read as bytes through Dio directly.
`test/contract/resident_contract_test.dart` covers both fix-ups and the unknown cases of the new enums.
