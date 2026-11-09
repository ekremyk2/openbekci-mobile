// Prunes the pinned OpenAPI spec to the operations listed in tool/client_ops.txt
// and the components they reach, and writes it as JSON for the generator.
//
// Usage: dart run tool/prune_spec.dart <in.yaml> <ops.txt> <out.json>
import 'dart:convert';
import 'dart:io';

import 'package:yaml/yaml.dart';

Object? _plain(Object? v) {
  if (v is YamlMap) {
    return {for (final e in v.entries) e.key.toString(): _plain(e.value)};
  }
  if (v is YamlList) return [for (final e in v) _plain(e)];
  return v;
}

RegExp _glob(String g) =>
    RegExp('^${g.split('*').map(RegExp.escape).join('.*')}\$');

void main(List<String> args) {
  if (args.length != 3) {
    stderr.writeln('usage: prune_spec <in.yaml> <ops.txt> <out.json>');
    exit(64);
  }
  final spec =
      _plain(loadYaml(File(args[0]).readAsStringSync()))!
          as Map<String, Object?>;
  final patterns = File(args[1])
      .readAsLinesSync()
      .map((l) => l.trim())
      .where((l) => l.isNotEmpty && !l.startsWith('#'))
      .map(_glob)
      .toList();

  const methods = {'get', 'put', 'post', 'delete', 'patch', 'head', 'options'};
  final paths = spec['paths']! as Map<String, Object?>;
  final keptPaths = <String, Object?>{};
  for (final p in paths.entries) {
    final item = Map<String, Object?>.from(p.value! as Map);
    final kept = <String, Object?>{};
    var any = false;
    for (final e in item.entries) {
      if (methods.contains(e.key)) {
        final op = e.value! as Map<String, Object?>;
        final id = op['operationId'] as String?;
        if (id != null && patterns.any((r) => r.hasMatch(id))) {
          kept[e.key] = e.value;
          any = true;
        }
      } else {
        kept[e.key] = e.value; // path-level parameters etc.
      }
    }
    if (any) keptPaths[p.key] = kept;
  }

  final components = spec['components']! as Map<String, Object?>;
  final used = <String>{};
  void walk(Object? node) {
    if (node is Map) {
      final ref = node[r'$ref'];
      if (ref is String && ref.startsWith('#/components/')) {
        if (used.add(ref)) {
          final parts = ref.substring(2).split('/');
          Object? cur = spec;
          for (final part in parts) {
            cur = (cur! as Map)[part];
          }
          walk(cur);
        }
      }
      node.values.forEach(walk);
    } else if (node is List) {
      node.forEach(walk);
    }
  }

  walk(keptPaths);
  // Discriminator mappings reference schemas as strings.
  void walkMappings(Object? node) {
    if (node is Map) {
      final d = node['discriminator'];
      if (d is Map && d['mapping'] is Map) {
        for (final v in (d['mapping'] as Map).values) {
          if (v is String && v.startsWith('#/components/')) {
            walk({r'$ref': v});
          }
        }
      }
      node.values.forEach(walkMappings);
    } else if (node is List) {
      node.forEach(walkMappings);
    }
  }

  for (var i = 0; i < 3; i++) {
    walkMappings(keptPaths);
    walkMappings({for (final u in used) u: null});
  }
  final outComponents = <String, Object?>{};
  for (final section in components.entries) {
    final src = section.value;
    if (src is! Map) continue;
    final prefix = '#/components/${section.key}/';
    final keep = <String, Object?>{
      for (final e in src.entries)
        if (used.contains('$prefix${e.key}')) e.key as String: e.value,
    };
    if (keep.isNotEmpty) outComponents[section.key] = keep;
  }
  final out = {
    'openapi': spec['openapi'],
    'info': spec['info'],
    'servers': spec['servers'],
    'paths': keptPaths,
    'components': outComponents,
  };
  _applyContractFixups(out);
  File(args[2])
      .writeAsStringSync(const JsonEncoder.withIndent(' ').convert(out));
  stdout.writeln(
    'Pruned: ${keptPaths.length} paths, '
    '${(outComponents['schemas'] as Map?)?.length ?? 0} schemas.',
  );
}

/// Fixes where the generator's output cannot talk to the served contract.
///
/// * `format: date` on a query parameter, on `PaymentDeclare.paid_on` and on
///   `RecurringVisitorCreate.valid_from` / `valid_to` (values
///   the app sends) becomes a plain string: the generated Dart would send a
///   full ISO timestamp, the server wants `YYYY-MM-DD`. Response dates stay
///   `DateTime` (they parse).
/// * `DebtorRef` is a discriminated `oneOf`; openapi-generator flattens it
///   into one class with every member required, which fails to decode a real
///   statement. It becomes one object with only `mode` required.
/// * `MeUser.version`, `OrgAccess.occupant_permissions` and `MyPoll.answers` are
///   required by the current spec but absent on N-1 and N-2 servers: they
///   become optional so an older server's answer still decodes.
void _applyContractFixups(Map<String, Object?> spec) {
  void params(Object? node) {
    if (node is Map) {
      final schema = node['schema'];
      // Query dates and instants the app sends: the generated Dart would
      // send `DateTime.toString()` (`2026-11-08 21:00:00.000Z`, a 422), the
      // server wants RFC 3339 / `YYYY-MM-DD`.
      if (node['in'] == 'query' &&
          schema is Map &&
          (schema['format'] == 'date' || schema['format'] == 'date-time')) {
        schema.remove('format');
      }
      node.values.forEach(params);
    } else if (node is List) {
      node.forEach(params);
    }
  }

  params(spec['paths']);
  final components = spec['components'] as Map<String, Object?>?;
  params(components?['parameters']);
  final schemas = components?['schemas'] as Map<String, Object?>?;
  if (schemas == null) return;
  final declare = schemas['PaymentDeclare'];
  if (declare is Map) {
    final paidOn = (declare['properties'] as Map?)?['paid_on'];
    if (paidOn is Map) paidOn.remove('format');
  }
  final recurring = schemas['RecurringVisitorCreate'];
  if (recurring is Map) {
    // Dates the app sends (the recurring visitor's validity) stay strings.
    final props = recurring['properties'] as Map?;
    for (final key in ['valid_from', 'valid_to']) {
      final p = props?[key];
      if (p is Map) p.remove('format');
    }
  }
  const addedLater = {
    'MeUser': 'version',
    'OrgAccess': 'occupant_permissions',
    'MyPoll': 'answers',
  };
  for (final e in addedLater.entries) {
    final req = (schemas[e.key] as Map?)?['required'];
    if (req is List) req.remove(e.value);
  }
  if (schemas.containsKey('DebtorRef')) {
    schemas['DebtorRef'] = {
      'type': 'object',
      'description':
          'Whose debt: a unit side (mode unit_side: unit_id and debtor_kind) '
          'or a person (mode person: person_id).',
      'required': ['mode'],
      'properties': {
        'mode': {
          'type': 'string',
          'enum': ['unit_side', 'person'],
          'x-open-enum': true,
        },
        'unit_id': {'type': 'string', 'format': 'uuid'},
        'debtor_kind': {
          'type': 'string',
          'enum': ['owner', 'tenant'],
          'x-open-enum': true,
        },
        'person_id': {'type': 'string', 'format': 'uuid'},
      },
    };
    schemas
      ..remove('DebtorRefUnitSide')
      ..remove('DebtorRefPerson');
  }
}
