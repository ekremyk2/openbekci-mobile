import 'dart:convert';

import 'package:openbekci_api/openbekci_api.dart';
import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/cache/cache_policy.dart';

/// The site QR path (backend plan section 6): describe the site behind a join
/// code, list units for the picker, and claim one after signing in.
abstract class JoinRepository {
  Future<JoinInfo> info(String code);

  Future<JoinUnitList> units(
    String code, {
    String? blockId,
    String? query,
    String? cursor,
  });

  /// Needs a signed-in session. The claim waits for the manager's approval;
  /// nothing is granted before.
  Future<UnitClaim> claim(
    String code, {
    required String unitId,
    required UnitClaimCreateClaimedRoleEnum role,
    String? note,
  });
}

/// [JoinRepository] on the generated client. [anonymous] serves the public
/// reads; [authenticated] (may be null when signed out) serves the claim.
class ApiJoinRepository implements JoinRepository {
  new({required this.anonymous, this.authenticated});

  final ApiClient anonymous;
  final ApiClient? authenticated;

  @override
  Future<JoinInfo> info(String code) =>
      unwrap(() => anonymous.people.peopleGetJoinInfo(code: code));

  @override
  Future<JoinUnitList> units(
    String code, {
    String? blockId,
    String? query,
    String? cursor,
  }) => unwrap(
    () => anonymous.people.peopleListJoinUnits(
      code: code,
      blockId: blockId,
      q: query == null || query.isEmpty ? null : query,
      cursor: cursor,
    ),
  );

  @override
  Future<UnitClaim> claim(
    String code, {
    required String unitId,
    required UnitClaimCreateClaimedRoleEnum role,
    String? note,
  }) {
    final api = authenticated;
    if (api == null) {
      throw StateError('claiming a unit needs a signed-in session');
    }
    return unwrap(
      () => api.people.peopleCreateUnitClaim(
        code: code,
        unitClaimCreate: UnitClaimCreate(
          unitId: unitId,
          claimedRole: role,
          note: note == null || note.isEmpty ? null : note,
        ),
      ),
    );
  }
}

/// The user's own unit claims, kept in the read cache because the API has no
/// "my claims" endpoint (see the phase A report): a claim is shown as
/// "waiting for approval" until the unit shows up in `/v1/me` occupancies or
/// the user dismisses it.
class LocalClaims {
  new(this._cache);

  final CachePolicy _cache;
  static const _key = 'my_unit_claims';

  Future<List<UnitClaim>> read() async {
    final entry = await _cache.read(_key);
    final raw = entry?.json;
    if (raw is! List) return const [];
    try {
      return [
        for (final e in raw) UnitClaim.fromJson(e as Map<String, dynamic>),
      ];
    } on Object {
      return const [];
    }
  }

  Future<void> add(UnitClaim claim) async {
    final list = [
      claim,
      for (final c in await read())
        if (c.id != claim.id) c,
    ];
    await _write(list);
  }

  Future<void> remove(String claimId) async {
    await _write([
      for (final c in await read())
        if (c.id != claimId) c,
    ]);
  }

  Future<void> _write(List<UnitClaim> claims) => _cache.write(
    _key,
    json.decode(json.encode([for (final c in claims) c.toJson()])),
  );
}
