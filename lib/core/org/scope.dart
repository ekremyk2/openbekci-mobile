import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_mobile/core/org/org_context.dart';

/// What a per-organization read depends on: the organization and its site.
/// A record, so providers that watch it only rebuild when it really changes
/// (not whenever `/v1/me` is refreshed).
typedef Scope = ({String orgId, String? siteId});

final scopeProvider = Provider<Scope?>((ref) {
  final ctx = ref.watch(orgContextProvider);
  if (ctx == null) return null;
  return (orgId: ctx.orgId, siteId: ctx.siteId);
});
