// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_grant.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RoleGrantCWProxy {
  RoleGrant role(RoleGrantRoleEnum role);

  RoleGrant scopeType(RoleGrantScopeTypeEnum scopeType);

  RoleGrant scopeId(String? scopeId);

  RoleGrant siteOwned(bool siteOwned);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RoleGrant(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RoleGrant(...).copyWith(id: 12, name: "My name")
  /// ````
  RoleGrant call({
    RoleGrantRoleEnum role,
    RoleGrantScopeTypeEnum scopeType,
    String? scopeId,
    bool siteOwned,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRoleGrant.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRoleGrant.copyWith.fieldName(...)`
class _$RoleGrantCWProxyImpl implements _$RoleGrantCWProxy {
  const _$RoleGrantCWProxyImpl(this._value);

  final RoleGrant _value;

  @override
  RoleGrant role(RoleGrantRoleEnum role) => this(role: role);

  @override
  RoleGrant scopeType(RoleGrantScopeTypeEnum scopeType) =>
      this(scopeType: scopeType);

  @override
  RoleGrant scopeId(String? scopeId) => this(scopeId: scopeId);

  @override
  RoleGrant siteOwned(bool siteOwned) => this(siteOwned: siteOwned);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RoleGrant(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RoleGrant(...).copyWith(id: 12, name: "My name")
  /// ````
  RoleGrant call({
    Object? role = const $CopyWithPlaceholder(),
    Object? scopeType = const $CopyWithPlaceholder(),
    Object? scopeId = const $CopyWithPlaceholder(),
    Object? siteOwned = const $CopyWithPlaceholder(),
  }) {
    return RoleGrant(
      role: role == const $CopyWithPlaceholder()
          ? _value.role
          // ignore: cast_nullable_to_non_nullable
          : role as RoleGrantRoleEnum,
      scopeType: scopeType == const $CopyWithPlaceholder()
          ? _value.scopeType
          // ignore: cast_nullable_to_non_nullable
          : scopeType as RoleGrantScopeTypeEnum,
      scopeId: scopeId == const $CopyWithPlaceholder()
          ? _value.scopeId
          // ignore: cast_nullable_to_non_nullable
          : scopeId as String?,
      siteOwned: siteOwned == const $CopyWithPlaceholder()
          ? _value.siteOwned
          // ignore: cast_nullable_to_non_nullable
          : siteOwned as bool,
    );
  }
}

extension $RoleGrantCopyWith on RoleGrant {
  /// Returns a callable class that can be used as follows: `instanceOfRoleGrant.copyWith(...)` or like so:`instanceOfRoleGrant.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RoleGrantCWProxy get copyWith => _$RoleGrantCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleGrant _$RoleGrantFromJson(Map<String, dynamic> json) => $checkedCreate(
  'RoleGrant',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['role', 'scope_type', 'scope_id', 'site_owned'],
    );
    final val = RoleGrant(
      role: $checkedConvert(
        'role',
        (v) => $enumDecode(
          _$RoleGrantRoleEnumEnumMap,
          v,
          unknownValue: RoleGrantRoleEnum.unknownDefaultOpenApi,
        ),
      ),
      scopeType: $checkedConvert(
        'scope_type',
        (v) => $enumDecode(
          _$RoleGrantScopeTypeEnumEnumMap,
          v,
          unknownValue: RoleGrantScopeTypeEnum.unknownDefaultOpenApi,
        ),
      ),
      scopeId: $checkedConvert('scope_id', (v) => v as String?),
      siteOwned: $checkedConvert('site_owned', (v) => v as bool),
    );
    return val;
  },
  fieldKeyMap: const {
    'scopeType': 'scope_type',
    'scopeId': 'scope_id',
    'siteOwned': 'site_owned',
  },
);

Map<String, dynamic> _$RoleGrantToJson(RoleGrant instance) => <String, dynamic>{
  'role': _$RoleGrantRoleEnumEnumMap[instance.role]!,
  'scope_type': _$RoleGrantScopeTypeEnumEnumMap[instance.scopeType]!,
  'scope_id': instance.scopeId,
  'site_owned': instance.siteOwned,
};

const _$RoleGrantRoleEnumEnumMap = {
  RoleGrantRoleEnum.orgAdmin: 'org_admin',
  RoleGrantRoleEnum.siteManager: 'site_manager',
  RoleGrantRoleEnum.boardMember: 'board_member',
  RoleGrantRoleEnum.auditor: 'auditor',
  RoleGrantRoleEnum.accountant: 'accountant',
  RoleGrantRoleEnum.staff: 'staff',
  RoleGrantRoleEnum.guard: 'guard',
  RoleGrantRoleEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};

const _$RoleGrantScopeTypeEnumEnumMap = {
  RoleGrantScopeTypeEnum.org: 'org',
  RoleGrantScopeTypeEnum.site: 'site',
  RoleGrantScopeTypeEnum.block: 'block',
  RoleGrantScopeTypeEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
