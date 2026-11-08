import 'package:openbekci_api/openbekci_api.dart';

export 'package:openbekci_api/openbekci_api.dart' show Permission;

/// Effective permissions of the signed-in user in one organization, from
/// `GET /v1/me` (`organizations[].permissions`). The server enforces; the app
/// only hides what the user cannot do (mobile plan section 2).
///
/// A grant without `site_ids` / `block_ids` holds organization-wide;
/// otherwise only for the listed sites and blocks. A permission value the
/// generated client does not know (an additive server release) decodes to
/// [Permission.unknownDefaultOpenApi] and never grants anything.
class PermissionSet {
  const new(this._grants);

  /// Builds the set for [org] (empty when null).
  factory of(OrgAccess? org) => PermissionSet(org?.permissions ?? const []);

  /// No permissions at all.
  static const empty = PermissionSet([]);

  final List<PermissionGrant> _grants;

  /// True when [permission] holds in the whole organization, or for [siteId] /
  /// [blockId] when given.
  bool can(Permission permission, {String? siteId, String? blockId}) {
    if (permission == Permission.unknownDefaultOpenApi) return false;
    for (final g in _grants) {
      if (g.permission != permission) continue;
      final sites = g.siteIds;
      final blocks = g.blockIds;
      final orgWide =
          (sites == null || sites.isEmpty) &&
          (blocks == null || blocks.isEmpty);
      if (orgWide) return true;
      if (siteId != null && (sites?.contains(siteId) ?? false)) return true;
      if (blockId != null && (blocks?.contains(blockId) ?? false)) return true;
    }
    return false;
  }

  /// Like [can] for a permission given by its wire name (`tickets.read`).
  bool canNamed(String name, {String? siteId, String? blockId}) {
    for (final p in Permission.values) {
      if (p.value == name) return can(p, siteId: siteId, blockId: blockId);
    }
    return false;
  }
}

/// `can()` on `/v1/me` for the organization the user is looking at.
extension MePermissions on Me {
  PermissionSet permissionsIn(String orgId) {
    for (final o in organizations) {
      if (o.id == orgId) return PermissionSet.of(o);
    }
    return PermissionSet.empty;
  }
}
