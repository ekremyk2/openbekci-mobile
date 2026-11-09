// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_grant.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PermissionGrantCWProxy {
  PermissionGrant permission(Permission permission);

  PermissionGrant siteIds(List<String>? siteIds);

  PermissionGrant blockIds(List<String>? blockIds);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PermissionGrant(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PermissionGrant(...).copyWith(id: 12, name: "My name")
  /// ````
  PermissionGrant call({
    Permission permission,
    List<String>? siteIds,
    List<String>? blockIds,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPermissionGrant.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPermissionGrant.copyWith.fieldName(...)`
class _$PermissionGrantCWProxyImpl implements _$PermissionGrantCWProxy {
  const _$PermissionGrantCWProxyImpl(this._value);

  final PermissionGrant _value;

  @override
  PermissionGrant permission(Permission permission) =>
      this(permission: permission);

  @override
  PermissionGrant siteIds(List<String>? siteIds) => this(siteIds: siteIds);

  @override
  PermissionGrant blockIds(List<String>? blockIds) => this(blockIds: blockIds);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PermissionGrant(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PermissionGrant(...).copyWith(id: 12, name: "My name")
  /// ````
  PermissionGrant call({
    Object? permission = const $CopyWithPlaceholder(),
    Object? siteIds = const $CopyWithPlaceholder(),
    Object? blockIds = const $CopyWithPlaceholder(),
  }) {
    return PermissionGrant(
      permission: permission == const $CopyWithPlaceholder()
          ? _value.permission
          // ignore: cast_nullable_to_non_nullable
          : permission as Permission,
      siteIds: siteIds == const $CopyWithPlaceholder()
          ? _value.siteIds
          // ignore: cast_nullable_to_non_nullable
          : siteIds as List<String>?,
      blockIds: blockIds == const $CopyWithPlaceholder()
          ? _value.blockIds
          // ignore: cast_nullable_to_non_nullable
          : blockIds as List<String>?,
    );
  }
}

extension $PermissionGrantCopyWith on PermissionGrant {
  /// Returns a callable class that can be used as follows: `instanceOfPermissionGrant.copyWith(...)` or like so:`instanceOfPermissionGrant.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PermissionGrantCWProxy get copyWith => _$PermissionGrantCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermissionGrant _$PermissionGrantFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PermissionGrant',
      json,
      ($checkedConvert) {
        $checkKeys(json, requiredKeys: const ['permission']);
        final val = PermissionGrant(
          permission: $checkedConvert(
            'permission',
            (v) => $enumDecode(
              _$PermissionEnumMap,
              v,
              unknownValue: Permission.unknownDefaultOpenApi,
            ),
          ),
          siteIds: $checkedConvert(
            'site_ids',
            (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
          ),
          blockIds: $checkedConvert(
            'block_ids',
            (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {'siteIds': 'site_ids', 'blockIds': 'block_ids'},
    );

Map<String, dynamic> _$PermissionGrantToJson(PermissionGrant instance) =>
    <String, dynamic>{
      'permission': _$PermissionEnumMap[instance.permission]!,
      'site_ids': ?instance.siteIds,
      'block_ids': ?instance.blockIds,
    };

const _$PermissionEnumMap = {
  Permission.accessPeriodManage: 'access.manage',
  Permission.accessPeriodOpen: 'access.open',
  Permission.accessPeriodRead: 'access.read',
  Permission.accessPeriodViewEvents: 'access.view_events',
  Permission.announcementsPeriodPublish: 'announcements.publish',
  Permission.announcementsPeriodRead: 'announcements.read',
  Permission.apikeysPeriodManage: 'apikeys.manage',
  Permission.apikeysPeriodRead: 'apikeys.read',
  Permission.attendancePeriodManage: 'attendance.manage',
  Permission.auditPeriodRead: 'audit.read',
  Permission.auditPeriodReport: 'audit.report',
  Permission.bookingsPeriodCreate: 'bookings.create',
  Permission.bookingsPeriodManage: 'bookings.manage',
  Permission.bookingsPeriodRead: 'bookings.read',
  Permission.claimsPeriodDecide: 'claims.decide',
  Permission.codesPeriodRead: 'codes.read',
  Permission.collectionsPeriodManage: 'collections.manage',
  Permission.dashboardPeriodPortfolio: 'dashboard.portfolio',
  Permission.dashboardPeriodSite: 'dashboard.site',
  Permission.dashboardPeriodStaff: 'dashboard.staff',
  Permission.decisionsPeriodManage: 'decisions.manage',
  Permission.deliveriesPeriodRead: 'deliveries.read',
  Permission.directoryPeriodRead: 'directory.read',
  Permission.documentsPeriodManage: 'documents.manage',
  Permission.documentsPeriodRead: 'documents.read',
  Permission.documentsPeriodReadAddressed: 'documents.read_addressed',
  Permission.documentsPeriodUploadOwn: 'documents.upload_own',
  Permission.exportsPeriodCreate: 'exports.create',
  Permission.facilitiesPeriodManage: 'facilities.manage',
  Permission.filesPeriodManage: 'files.manage',
  Permission.filesPeriodRead: 'files.read',
  Permission.filesPeriodUpload: 'files.upload',
  Permission.gatePeriodManage: 'gate.manage',
  Permission.gatePeriodOperate: 'gate.operate',
  Permission.invitationsPeriodHousehold: 'invitations.household',
  Permission.invitationsPeriodManage: 'invitations.manage',
  Permission.jobsPeriodRead: 'jobs.read',
  Permission.mePeriodDashboard: 'me.dashboard',
  Permission.mePeriodManage: 'me.manage',
  Permission.mePeriodRead: 'me.read',
  Permission.meetingsPeriodManage: 'meetings.manage',
  Permission.meetingsPeriodRead: 'meetings.read',
  Permission.membershipsPeriodManage: 'memberships.manage',
  Permission.membershipsPeriodRead: 'memberships.read',
  Permission.moneyPeriodLock: 'money.lock',
  Permission.moneyPeriodManage: 'money.manage',
  Permission.moneyPeriodPost: 'money.post',
  Permission.moneyPeriodRead: 'money.read',
  Permission.notificationsPeriodManage: 'notifications.manage',
  Permission.notificationsPeriodRead: 'notifications.read',
  Permission.occupanciesPeriodGrantMoney: 'occupancies.grant_money',
  Permission.occupanciesPeriodHousehold: 'occupancies.household',
  Permission.occupanciesPeriodManage: 'occupancies.manage',
  Permission.occupanciesPeriodRead: 'occupancies.read',
  Permission.orgPeriodManage: 'org.manage',
  Permission.orgPeriodRead: 'org.read',
  Permission.packsPeriodManage: 'packs.manage',
  Permission.packsPeriodRead: 'packs.read',
  Permission.paymentsPeriodCheckout: 'payments.checkout',
  Permission.paymentsPeriodDeclare: 'payments.declare',
  Permission.paymentsPeriodRecord: 'payments.record',
  Permission.peoplePeriodErase: 'people.erase',
  Permission.peoplePeriodManage: 'people.manage',
  Permission.peoplePeriodMoveOut: 'people.move_out',
  Permission.peoplePeriodNationalId: 'people.national_id',
  Permission.peoplePeriodRead: 'people.read',
  Permission.platformPeriodManage: 'platform.manage',
  Permission.pollsPeriodAnswer: 'polls.answer',
  Permission.reportsPeriodAggregate: 'reports.aggregate',
  Permission.reportsPeriodDebtors: 'reports.debtors',
  Permission.reportsPeriodRead: 'reports.read',
  Permission.rolesPeriodRead: 'roles.read',
  Permission.sessionsPeriodManageOwn: 'sessions.manage_own',
  Permission.sitesPeriodBankDetails: 'sites.bank_details',
  Permission.sitesPeriodExport: 'sites.export',
  Permission.sitesPeriodManage: 'sites.manage',
  Permission.sitesPeriodOffboard: 'sites.offboard',
  Permission.sitesPeriodRead: 'sites.read',
  Permission.statementsPeriodRead: 'statements.read',
  Permission.statementsPeriodReadOwn: 'statements.read_own',
  Permission.ticketsPeriodManage: 'tickets.manage',
  Permission.ticketsPeriodOpen: 'tickets.open',
  Permission.ticketsPeriodRead: 'tickets.read',
  Permission.ticketsPeriodReadAssigned: 'tickets.read_assigned',
  Permission.ticketsPeriodWork: 'tickets.work',
  Permission.unitsPeriodImport: 'units.import',
  Permission.unitsPeriodManage: 'units.manage',
  Permission.unitsPeriodRead: 'units.read',
  Permission.vehiclesPeriodManage: 'vehicles.manage',
  Permission.vehiclesPeriodRead: 'vehicles.read',
  Permission.vendorsPeriodManage: 'vendors.manage',
  Permission.vendorsPeriodRead: 'vendors.read',
  Permission.visitorsPeriodDecide: 'visitors.decide',
  Permission.visitorsPeriodManage: 'visitors.manage',
  Permission.visitorsPeriodRead: 'visitors.read',
  Permission.webhooksPeriodManage: 'webhooks.manage',
  Permission.webhooksPeriodRead: 'webhooks.read',
  Permission.unknownDefaultOpenApi: 'unknown_default_open_api',
};
