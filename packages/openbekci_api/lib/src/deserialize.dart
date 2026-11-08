import 'package:openbekci_api/src/model/auth_method.dart';
import 'package:openbekci_api/src/model/auth_result.dart';
import 'package:openbekci_api/src/model/auth_user.dart';
import 'package:openbekci_api/src/model/branding.dart';
import 'package:openbekci_api/src/model/change_password_request.dart';
import 'package:openbekci_api/src/model/credentials.dart';
import 'package:openbekci_api/src/model/discovery_document.dart';
import 'package:openbekci_api/src/model/instance.dart';
import 'package:openbekci_api/src/model/invitation.dart';
import 'package:openbekci_api/src/model/invitation_accept.dart';
import 'package:openbekci_api/src/model/invitation_list.dart';
import 'package:openbekci_api/src/model/invitation_preview.dart';
import 'package:openbekci_api/src/model/join_block.dart';
import 'package:openbekci_api/src/model/join_info.dart';
import 'package:openbekci_api/src/model/join_unit.dart';
import 'package:openbekci_api/src/model/join_unit_list.dart';
import 'package:openbekci_api/src/model/magic_link_consume_request.dart';
import 'package:openbekci_api/src/model/magic_link_request.dart';
import 'package:openbekci_api/src/model/me.dart';
import 'package:openbekci_api/src/model/me_occupancy.dart';
import 'package:openbekci_api/src/model/me_policies.dart';
import 'package:openbekci_api/src/model/me_site.dart';
import 'package:openbekci_api/src/model/me_user.dart';
import 'package:openbekci_api/src/model/min_app_version.dart';
import 'package:openbekci_api/src/model/occupancy.dart';
import 'package:openbekci_api/src/model/occupancy_list.dart';
import 'package:openbekci_api/src/model/org_access.dart';
import 'package:openbekci_api/src/model/otp_request.dart';
import 'package:openbekci_api/src/model/permission_grant.dart';
import 'package:openbekci_api/src/model/problem.dart';
import 'package:openbekci_api/src/model/problem_field_error.dart';
import 'package:openbekci_api/src/model/push_info.dart';
import 'package:openbekci_api/src/model/reauth_email_code.dart';
import 'package:openbekci_api/src/model/reauth_password.dart';
import 'package:openbekci_api/src/model/reauth_request.dart';
import 'package:openbekci_api/src/model/reauth_response.dart';
import 'package:openbekci_api/src/model/reauth_sms_otp.dart';
import 'package:openbekci_api/src/model/refresh_request.dart';
import 'package:openbekci_api/src/model/relay_enrollment.dart';
import 'package:openbekci_api/src/model/role_grant.dart';
import 'package:openbekci_api/src/model/session.dart';
import 'package:openbekci_api/src/model/session_list.dart';
import 'package:openbekci_api/src/model/session_response.dart';
import 'package:openbekci_api/src/model/token_response.dart';
import 'package:openbekci_api/src/model/unit_claim.dart';
import 'package:openbekci_api/src/model/unit_claim_create.dart';

final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

  ReturnType deserialize<ReturnType, BaseType>(dynamic value, String targetType, {bool growable= true}) {
      switch (targetType) {
        case 'String':
          return '$value' as ReturnType;
        case 'int':
          return (value is int ? value : int.parse('$value')) as ReturnType;
        case 'bool':
          if (value is bool) {
            return value as ReturnType;
          }
          final valueString = '$value'.toLowerCase();
          return (valueString == 'true' || valueString == '1') as ReturnType;
        case 'double':
          return (value is double ? value : double.parse('$value')) as ReturnType;
        case 'AuthMethod':
          return AuthMethod.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AuthResult':
          return AuthResult.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AuthUser':
          return AuthUser.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Branding':
          return Branding.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ChangePasswordRequest':
          return ChangePasswordRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Credentials':
          return Credentials.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DiscoveryDocument':
          return DiscoveryDocument.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Instance':
          return Instance.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Invitation':
          return Invitation.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'InvitationAccept':
          return InvitationAccept.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'InvitationList':
          return InvitationList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'InvitationPreview':
          return InvitationPreview.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'JoinBlock':
          return JoinBlock.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'JoinInfo':
          return JoinInfo.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'JoinUnit':
          return JoinUnit.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'JoinUnitList':
          return JoinUnitList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MagicLinkConsumeRequest':
          return MagicLinkConsumeRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MagicLinkRequest':
          return MagicLinkRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Me':
          return Me.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MeOccupancy':
          return MeOccupancy.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MePolicies':
          return MePolicies.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MeSite':
          return MeSite.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MeUser':
          return MeUser.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MinAppVersion':
          return MinAppVersion.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Occupancy':
          return Occupancy.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'OccupancyList':
          return OccupancyList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'OrgAccess':
          return OrgAccess.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'OtpRequest':
          return OtpRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Permission':
          
          
        case 'PermissionGrant':
          return PermissionGrant.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Problem':
          return Problem.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ProblemFieldError':
          return ProblemFieldError.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PushInfo':
          return PushInfo.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ReauthEmailCode':
          return ReauthEmailCode.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ReauthPassword':
          return ReauthPassword.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ReauthRequest':
          return ReauthRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ReauthResponse':
          return ReauthResponse.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ReauthSmsOtp':
          return ReauthSmsOtp.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RefreshRequest':
          return RefreshRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RelayEnrollment':
          return RelayEnrollment.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RoleGrant':
          return RoleGrant.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Session':
          return Session.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SessionList':
          return SessionList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SessionResponse':
          return SessionResponse.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TokenResponse':
          return TokenResponse.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UnitClaim':
          return UnitClaim.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UnitClaimCreate':
          return UnitClaimCreate.fromJson(value as Map<String, dynamic>) as ReturnType;
        default:
          RegExpMatch? match;

          if (value is List && (match = _regList.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return value
              .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable))
              .toList(growable: growable) as ReturnType;
          }
          if (value is Set && (match = _regSet.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return value
              .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable))
              .toSet() as ReturnType;
          }
          if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
            targetType = match![1]!.trim(); // ignore: parameter_assignments
            return Map<String, BaseType>.fromIterables(
              value.keys as Iterable<String>,
              value.values.map((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable)),
            ) as ReturnType;
          }
          break;
    }
    throw Exception('Cannot deserialize');
  }