import 'package:openbekci_api/openbekci_api.dart';
import 'package:openbekci_mobile/core/api/api_client.dart';
import 'package:openbekci_mobile/core/cache/cached.dart';

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

  /// Public: creates an account through the site's join code (or, for a known
  /// number, signs in); the server sends an SMS code that sign-in completes.
  Future<void> signUp(String code, {required String phone});

  /// The pending claims of the signed-in user, in every organization
  /// (GET /v1/me/unit-claims).
  Future<List<UnitClaim>> myClaims();

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
  Future<void> signUp(String code, {required String phone}) => unwrapVoid(
    () => anonymous.people.peopleJoinSignUp(
      code: code,
      joinSignUpRequest: JoinSignUpRequest(
        phone: phone,
        client: JoinSignUpRequestClientEnum.mobile,
      ),
    ),
  );

  @override
  Future<List<UnitClaim>> myClaims() {
    final api = authenticated;
    if (api == null) return Future.value(const []);
    return fetchAllPages<UnitClaim>((cursor) async {
      final page = await unwrap(
        () => api.people.peopleListMyUnitClaims(
          status: 'pending',
          cursor: cursor,
        ),
      );
      return (items: page.items, next: page.nextCursor);
    });
  }

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
