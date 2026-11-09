import 'package:openbekci_api/src/model/address.dart';
import 'package:openbekci_api/src/model/allocation_basis.dart';
import 'package:openbekci_api/src/model/announcement.dart';
import 'package:openbekci_api/src/model/announcement_attachment.dart';
import 'package:openbekci_api/src/model/announcement_audience.dart';
import 'package:openbekci_api/src/model/announcement_list.dart';
import 'package:openbekci_api/src/model/auth_method.dart';
import 'package:openbekci_api/src/model/auth_result.dart';
import 'package:openbekci_api/src/model/auth_user.dart';
import 'package:openbekci_api/src/model/bank_details.dart';
import 'package:openbekci_api/src/model/branding.dart';
import 'package:openbekci_api/src/model/change_password_request.dart';
import 'package:openbekci_api/src/model/charge.dart';
import 'package:openbekci_api/src/model/charge_list.dart';
import 'package:openbekci_api/src/model/code_label.dart';
import 'package:openbekci_api/src/model/codes.dart';
import 'package:openbekci_api/src/model/credentials.dart';
import 'package:openbekci_api/src/model/dashboard_meeting.dart';
import 'package:openbekci_api/src/model/debtor_ref.dart';
import 'package:openbekci_api/src/model/directory_consent.dart';
import 'package:openbekci_api/src/model/discovery_document.dart';
import 'package:openbekci_api/src/model/document.dart';
import 'package:openbekci_api/src/model/document_list.dart';
import 'package:openbekci_api/src/model/document_visibility.dart';
import 'package:openbekci_api/src/model/effective_debtor.dart';
import 'package:openbekci_api/src/model/file.dart';
import 'package:openbekci_api/src/model/file_links.dart';
import 'package:openbekci_api/src/model/file_variant.dart';
import 'package:openbekci_api/src/model/folder.dart';
import 'package:openbekci_api/src/model/folder_crumb.dart';
import 'package:openbekci_api/src/model/folder_list.dart';
import 'package:openbekci_api/src/model/generated_from.dart';
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
import 'package:openbekci_api/src/model/me_dashboard.dart';
import 'package:openbekci_api/src/model/me_occupancy.dart';
import 'package:openbekci_api/src/model/me_policies.dart';
import 'package:openbekci_api/src/model/me_site.dart';
import 'package:openbekci_api/src/model/me_user.dart';
import 'package:openbekci_api/src/model/min_app_version.dart';
import 'package:openbekci_api/src/model/money.dart';
import 'package:openbekci_api/src/model/my_person_update.dart';
import 'package:openbekci_api/src/model/my_side.dart';
import 'package:openbekci_api/src/model/notification.dart';
import 'package:openbekci_api/src/model/notification_list.dart';
import 'package:openbekci_api/src/model/notification_mutes.dart';
import 'package:openbekci_api/src/model/notification_mutes_set.dart';
import 'package:openbekci_api/src/model/notifications_read_all.dart';
import 'package:openbekci_api/src/model/occupancy.dart';
import 'package:openbekci_api/src/model/occupancy_list.dart';
import 'package:openbekci_api/src/model/org_access.dart';
import 'package:openbekci_api/src/model/otp_request.dart';
import 'package:openbekci_api/src/model/payment.dart';
import 'package:openbekci_api/src/model/payment_allocation.dart';
import 'package:openbekci_api/src/model/payment_declare.dart';
import 'package:openbekci_api/src/model/payment_list.dart';
import 'package:openbekci_api/src/model/permission_grant.dart';
import 'package:openbekci_api/src/model/person.dart';
import 'package:openbekci_api/src/model/person_contact.dart';
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
import 'package:openbekci_api/src/model/site.dart';
import 'package:openbekci_api/src/model/statement.dart';
import 'package:openbekci_api/src/model/statement_line.dart';
import 'package:openbekci_api/src/model/ticket.dart';
import 'package:openbekci_api/src/model/ticket_assignee.dart';
import 'package:openbekci_api/src/model/ticket_attachment.dart';
import 'package:openbekci_api/src/model/ticket_attachment_create.dart';
import 'package:openbekci_api/src/model/ticket_category.dart';
import 'package:openbekci_api/src/model/ticket_category_list.dart';
import 'package:openbekci_api/src/model/ticket_comment.dart';
import 'package:openbekci_api/src/model/ticket_comment_create.dart';
import 'package:openbekci_api/src/model/ticket_comment_list.dart';
import 'package:openbekci_api/src/model/ticket_create.dart';
import 'package:openbekci_api/src/model/ticket_list.dart';
import 'package:openbekci_api/src/model/ticket_status.dart';
import 'package:openbekci_api/src/model/ticket_status_change.dart';
import 'package:openbekci_api/src/model/ticket_status_change_changed_by.dart';
import 'package:openbekci_api/src/model/ticket_status_change_list.dart';
import 'package:openbekci_api/src/model/ticket_vote.dart';
import 'package:openbekci_api/src/model/ticket_workflow.dart';
import 'package:openbekci_api/src/model/token_response.dart';
import 'package:openbekci_api/src/model/unit_claim.dart';
import 'package:openbekci_api/src/model/unit_claim_create.dart';
import 'package:openbekci_api/src/model/unread_count.dart';

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
        case 'Address':
          return Address.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AllocationBasis':
          return AllocationBasis.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Announcement':
          return Announcement.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AnnouncementAttachment':
          return AnnouncementAttachment.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AnnouncementAudience':
          return AnnouncementAudience.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AnnouncementList':
          return AnnouncementList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AuthMethod':
          return AuthMethod.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AuthResult':
          return AuthResult.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AuthUser':
          return AuthUser.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'BankDetails':
          return BankDetails.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Branding':
          return Branding.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ChangePasswordRequest':
          return ChangePasswordRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Charge':
          return Charge.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ChargeList':
          return ChargeList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CodeLabel':
          return CodeLabel.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Codes':
          return Codes.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Credentials':
          return Credentials.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DashboardMeeting':
          return DashboardMeeting.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DebtorRef':
          return DebtorRef.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DirectoryConsent':
          return DirectoryConsent.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DiscoveryDocument':
          return DiscoveryDocument.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Document':
          return Document.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DocumentList':
          return DocumentList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DocumentVisibility':
          return DocumentVisibility.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'EffectiveDebtor':
          return EffectiveDebtor.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'File':
          return File.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FileLinks':
          return FileLinks.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FileVariant':
          return FileVariant.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Folder':
          return Folder.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FolderCrumb':
          return FolderCrumb.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FolderList':
          return FolderList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GeneratedFrom':
          return GeneratedFrom.fromJson(value as Map<String, dynamic>) as ReturnType;
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
        case 'MeDashboard':
          return MeDashboard.fromJson(value as Map<String, dynamic>) as ReturnType;
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
        case 'Money':
          return Money.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MyPersonUpdate':
          return MyPersonUpdate.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MySide':
          return MySide.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Notification':
          return Notification.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'NotificationList':
          return NotificationList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'NotificationMutes':
          return NotificationMutes.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'NotificationMutesSet':
          return NotificationMutesSet.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'NotificationsReadAll':
          return NotificationsReadAll.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Occupancy':
          return Occupancy.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'OccupancyList':
          return OccupancyList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'OrgAccess':
          return OrgAccess.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'OtpRequest':
          return OtpRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Payment':
          return Payment.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PaymentAllocation':
          return PaymentAllocation.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PaymentDeclare':
          return PaymentDeclare.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PaymentList':
          return PaymentList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Permission':
          
          
        case 'PermissionGrant':
          return PermissionGrant.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Person':
          return Person.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PersonContact':
          return PersonContact.fromJson(value as Map<String, dynamic>) as ReturnType;
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
        case 'Site':
          return Site.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Statement':
          return Statement.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'StatementLine':
          return StatementLine.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Ticket':
          return Ticket.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TicketAssignee':
          return TicketAssignee.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TicketAttachment':
          return TicketAttachment.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TicketAttachmentCreate':
          return TicketAttachmentCreate.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TicketCategory':
          return TicketCategory.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TicketCategoryList':
          return TicketCategoryList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TicketComment':
          return TicketComment.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TicketCommentCreate':
          return TicketCommentCreate.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TicketCommentList':
          return TicketCommentList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TicketCreate':
          return TicketCreate.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TicketList':
          return TicketList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TicketSemantic':
          
          
        case 'TicketStatus':
          return TicketStatus.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TicketStatusChange':
          return TicketStatusChange.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TicketStatusChangeChangedBy':
          return TicketStatusChangeChangedBy.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TicketStatusChangeList':
          return TicketStatusChangeList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TicketVote':
          return TicketVote.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TicketWorkflow':
          return TicketWorkflow.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TokenResponse':
          return TokenResponse.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UnitClaim':
          return UnitClaim.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UnitClaimCreate':
          return UnitClaimCreate.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UnreadCount':
          return UnreadCount.fromJson(value as Map<String, dynamic>) as ReturnType;
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