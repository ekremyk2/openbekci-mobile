import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/core/permissions/permissions.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The organization (and its site) the resident is looking at: everything in
/// the resident screens is scoped by it. Built from `GET /v1/me`.
@immutable
class OrgContext {
  const new({
    required this.me,
    required this.org,
    required this.site,
    required this.permissions,
  });

  final Me me;
  final OrgAccess org;

  /// The site of the user's unit in [org] (first active occupancy), else the
  /// first site of the organization.
  final MeSite? site;
  final PermissionSet permissions;

  String get orgId => org.id;
  String? get siteId => site?.id;
  String get currency => site?.currency ?? 'TRY';
  String get timezone => site?.timezone ?? 'Europe/Istanbul';

  /// Active occupancies in this organization.
  List<MeOccupancy> get occupancies => [
    for (final o in me.occupancies)
      if (o.orgId == org.id) o,
  ];

  /// Cache key prefix: one namespace per organization.
  String get cachePrefix => 'org/$orgId';
}

/// Picks the site for [org]: the site of the first current occupancy, else the
/// first site.
MeSite? siteFor(OrgAccess org, List<MeOccupancy> occupancies) {
  for (final o in occupancies) {
    if (o.orgId != org.id) continue;
    for (final s in org.sites) {
      if (s.id == o.siteId) return s;
    }
  }
  return org.sites.isEmpty ? null : org.sites.first;
}

/// Builds the context for [orgId] (or the first organization when it is null
/// or no longer in the list).
OrgContext? buildOrgContext(Me me, String? orgId) {
  if (me.organizations.isEmpty) return null;
  final org = me.organizations.firstWhere(
    (o) => o.id == orgId,
    orElse: () => me.organizations.first,
  );
  return OrgContext(
    me: me,
    org: org,
    site: siteFor(org, me.occupancies),
    permissions: PermissionSet.of(org),
  );
}

const _orgKey = 'selected_org_id';

/// The organization chosen in the switcher; survives restarts.
class SelectedOrgController extends Notifier<String?> {
  @override
  String? build() {
    unawaited(_load());
    return null;
  }

  Future<void> _load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final saved = prefs.getString(_orgKey);
      if (saved != null && state == null) state = saved;
    } on Object {
      // Preferences are a convenience; the first organization is the default.
    }
  }

  Future<void> select(String orgId) async {
    state = orgId;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_orgKey, orgId);
    } on Object {
      // Not persisted: fine.
    }
  }
}

final selectedOrgProvider = NotifierProvider<SelectedOrgController, String?>(
  SelectedOrgController.new,
);

/// The current [OrgContext] (null until `/v1/me` loaded, or without
/// organizations).
final orgContextProvider = Provider<OrgContext?>((ref) {
  final me = ref.watch(meProvider).value?.data;
  if (me == null) return null;
  return buildOrgContext(me, ref.watch(selectedOrgProvider));
});
