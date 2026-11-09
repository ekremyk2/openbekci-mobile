// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SiteCWProxy {
  Site id(String id);

  Site orgId(String orgId);

  Site name(String name);

  Site address(Address address);

  Site timezone(String timezone);

  Site currency(String currency);

  Site fiscalYearStartMonth(int fiscalYearStartMonth);

  Site lockDate(DateTime? lockDate);

  Site status(SiteStatusEnum status);

  Site createdAt(DateTime createdAt);

  Site updatedAt(DateTime updatedAt);

  Site version(int version);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Site(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Site(...).copyWith(id: 12, name: "My name")
  /// ````
  Site call({
    String id,
    String orgId,
    String name,
    Address address,
    String timezone,
    String currency,
    int fiscalYearStartMonth,
    DateTime? lockDate,
    SiteStatusEnum status,
    DateTime createdAt,
    DateTime updatedAt,
    int version,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSite.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSite.copyWith.fieldName(...)`
class _$SiteCWProxyImpl implements _$SiteCWProxy {
  const _$SiteCWProxyImpl(this._value);

  final Site _value;

  @override
  Site id(String id) => this(id: id);

  @override
  Site orgId(String orgId) => this(orgId: orgId);

  @override
  Site name(String name) => this(name: name);

  @override
  Site address(Address address) => this(address: address);

  @override
  Site timezone(String timezone) => this(timezone: timezone);

  @override
  Site currency(String currency) => this(currency: currency);

  @override
  Site fiscalYearStartMonth(int fiscalYearStartMonth) =>
      this(fiscalYearStartMonth: fiscalYearStartMonth);

  @override
  Site lockDate(DateTime? lockDate) => this(lockDate: lockDate);

  @override
  Site status(SiteStatusEnum status) => this(status: status);

  @override
  Site createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Site updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  Site version(int version) => this(version: version);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Site(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Site(...).copyWith(id: 12, name: "My name")
  /// ````
  Site call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
    Object? timezone = const $CopyWithPlaceholder(),
    Object? currency = const $CopyWithPlaceholder(),
    Object? fiscalYearStartMonth = const $CopyWithPlaceholder(),
    Object? lockDate = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
  }) {
    return Site(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      orgId: orgId == const $CopyWithPlaceholder()
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as Address,
      timezone: timezone == const $CopyWithPlaceholder()
          ? _value.timezone
          // ignore: cast_nullable_to_non_nullable
          : timezone as String,
      currency: currency == const $CopyWithPlaceholder()
          ? _value.currency
          // ignore: cast_nullable_to_non_nullable
          : currency as String,
      fiscalYearStartMonth: fiscalYearStartMonth == const $CopyWithPlaceholder()
          ? _value.fiscalYearStartMonth
          // ignore: cast_nullable_to_non_nullable
          : fiscalYearStartMonth as int,
      lockDate: lockDate == const $CopyWithPlaceholder()
          ? _value.lockDate
          // ignore: cast_nullable_to_non_nullable
          : lockDate as DateTime?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as SiteStatusEnum,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
      version: version == const $CopyWithPlaceholder()
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as int,
    );
  }
}

extension $SiteCopyWith on Site {
  /// Returns a callable class that can be used as follows: `instanceOfSite.copyWith(...)` or like so:`instanceOfSite.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SiteCWProxy get copyWith => _$SiteCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Site _$SiteFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Site',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'org_id',
        'name',
        'address',
        'timezone',
        'currency',
        'fiscal_year_start_month',
        'lock_date',
        'status',
        'created_at',
        'updated_at',
        'version',
      ],
    );
    final val = Site(
      id: $checkedConvert('id', (v) => v as String),
      orgId: $checkedConvert('org_id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      address: $checkedConvert(
        'address',
        (v) => Address.fromJson(v as Map<String, dynamic>),
      ),
      timezone: $checkedConvert('timezone', (v) => v as String),
      currency: $checkedConvert('currency', (v) => v as String),
      fiscalYearStartMonth: $checkedConvert(
        'fiscal_year_start_month',
        (v) => (v as num).toInt(),
      ),
      lockDate: $checkedConvert(
        'lock_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(
          _$SiteStatusEnumEnumMap,
          v,
          unknownValue: SiteStatusEnum.unknownDefaultOpenApi,
        ),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
      version: $checkedConvert('version', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'orgId': 'org_id',
    'fiscalYearStartMonth': 'fiscal_year_start_month',
    'lockDate': 'lock_date',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$SiteToJson(Site instance) => <String, dynamic>{
  'id': instance.id,
  'org_id': instance.orgId,
  'name': instance.name,
  'address': instance.address.toJson(),
  'timezone': instance.timezone,
  'currency': instance.currency,
  'fiscal_year_start_month': instance.fiscalYearStartMonth,
  'lock_date': instance.lockDate?.toIso8601String(),
  'status': _$SiteStatusEnumEnumMap[instance.status]!,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'version': instance.version,
};

const _$SiteStatusEnumEnumMap = {
  SiteStatusEnum.active: 'active',
  SiteStatusEnum.offboarded: 'offboarded',
  SiteStatusEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
