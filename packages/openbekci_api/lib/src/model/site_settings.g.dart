// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SiteSettingsCWProxy {
  SiteSettings version(int version);

  SiteSettings tenantsArePortalUsers(bool tenantsArePortalUsers);

  SiteSettings directoryEnabled(bool directoryEnabled);

  SiteSettings ownerFinancialTransparency(bool ownerFinancialTransparency);

  SiteSettings parkingStorageDefault(
    SiteSettingsParkingStorageDefaultEnum parkingStorageDefault,
  );

  SiteSettings billsEnabled(bool billsEnabled);

  SiteSettings announcementPublishers(
    SiteSettingsAnnouncementPublishersEnum announcementPublishers,
  );

  SiteSettings ticketArchiveMonths(int? ticketArchiveMonths);

  SiteSettings visitorLogRetentionDays(int visitorLogRetentionDays);

  SiteSettings legalPreset(String? legalPreset);

  SiteSettings access(AccessSettings access);

  SiteSettings extra(Map<String, Object>? extra);

  SiteSettings payments(SiteSettingsPayments? payments);

  SiteSettings packDefaults(
    Map<String, SiteSettingsPackDefaultsValue>? packDefaults,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SiteSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SiteSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  SiteSettings call({
    int version,
    bool tenantsArePortalUsers,
    bool directoryEnabled,
    bool ownerFinancialTransparency,
    SiteSettingsParkingStorageDefaultEnum parkingStorageDefault,
    bool billsEnabled,
    SiteSettingsAnnouncementPublishersEnum announcementPublishers,
    int? ticketArchiveMonths,
    int visitorLogRetentionDays,
    String? legalPreset,
    AccessSettings access,
    Map<String, Object>? extra,
    SiteSettingsPayments? payments,
    Map<String, SiteSettingsPackDefaultsValue>? packDefaults,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSiteSettings.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSiteSettings.copyWith.fieldName(...)`
class _$SiteSettingsCWProxyImpl implements _$SiteSettingsCWProxy {
  const _$SiteSettingsCWProxyImpl(this._value);

  final SiteSettings _value;

  @override
  SiteSettings version(int version) => this(version: version);

  @override
  SiteSettings tenantsArePortalUsers(bool tenantsArePortalUsers) =>
      this(tenantsArePortalUsers: tenantsArePortalUsers);

  @override
  SiteSettings directoryEnabled(bool directoryEnabled) =>
      this(directoryEnabled: directoryEnabled);

  @override
  SiteSettings ownerFinancialTransparency(bool ownerFinancialTransparency) =>
      this(ownerFinancialTransparency: ownerFinancialTransparency);

  @override
  SiteSettings parkingStorageDefault(
    SiteSettingsParkingStorageDefaultEnum parkingStorageDefault,
  ) => this(parkingStorageDefault: parkingStorageDefault);

  @override
  SiteSettings billsEnabled(bool billsEnabled) =>
      this(billsEnabled: billsEnabled);

  @override
  SiteSettings announcementPublishers(
    SiteSettingsAnnouncementPublishersEnum announcementPublishers,
  ) => this(announcementPublishers: announcementPublishers);

  @override
  SiteSettings ticketArchiveMonths(int? ticketArchiveMonths) =>
      this(ticketArchiveMonths: ticketArchiveMonths);

  @override
  SiteSettings visitorLogRetentionDays(int visitorLogRetentionDays) =>
      this(visitorLogRetentionDays: visitorLogRetentionDays);

  @override
  SiteSettings legalPreset(String? legalPreset) =>
      this(legalPreset: legalPreset);

  @override
  SiteSettings access(AccessSettings access) => this(access: access);

  @override
  SiteSettings extra(Map<String, Object>? extra) => this(extra: extra);

  @override
  SiteSettings payments(SiteSettingsPayments? payments) =>
      this(payments: payments);

  @override
  SiteSettings packDefaults(
    Map<String, SiteSettingsPackDefaultsValue>? packDefaults,
  ) => this(packDefaults: packDefaults);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SiteSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SiteSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  SiteSettings call({
    Object? version = const $CopyWithPlaceholder(),
    Object? tenantsArePortalUsers = const $CopyWithPlaceholder(),
    Object? directoryEnabled = const $CopyWithPlaceholder(),
    Object? ownerFinancialTransparency = const $CopyWithPlaceholder(),
    Object? parkingStorageDefault = const $CopyWithPlaceholder(),
    Object? billsEnabled = const $CopyWithPlaceholder(),
    Object? announcementPublishers = const $CopyWithPlaceholder(),
    Object? ticketArchiveMonths = const $CopyWithPlaceholder(),
    Object? visitorLogRetentionDays = const $CopyWithPlaceholder(),
    Object? legalPreset = const $CopyWithPlaceholder(),
    Object? access = const $CopyWithPlaceholder(),
    Object? extra = const $CopyWithPlaceholder(),
    Object? payments = const $CopyWithPlaceholder(),
    Object? packDefaults = const $CopyWithPlaceholder(),
  }) {
    return SiteSettings(
      version: version == const $CopyWithPlaceholder()
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as int,
      tenantsArePortalUsers:
          tenantsArePortalUsers == const $CopyWithPlaceholder()
          ? _value.tenantsArePortalUsers
          // ignore: cast_nullable_to_non_nullable
          : tenantsArePortalUsers as bool,
      directoryEnabled: directoryEnabled == const $CopyWithPlaceholder()
          ? _value.directoryEnabled
          // ignore: cast_nullable_to_non_nullable
          : directoryEnabled as bool,
      ownerFinancialTransparency:
          ownerFinancialTransparency == const $CopyWithPlaceholder()
          ? _value.ownerFinancialTransparency
          // ignore: cast_nullable_to_non_nullable
          : ownerFinancialTransparency as bool,
      parkingStorageDefault:
          parkingStorageDefault == const $CopyWithPlaceholder()
          ? _value.parkingStorageDefault
          // ignore: cast_nullable_to_non_nullable
          : parkingStorageDefault as SiteSettingsParkingStorageDefaultEnum,
      billsEnabled: billsEnabled == const $CopyWithPlaceholder()
          ? _value.billsEnabled
          // ignore: cast_nullable_to_non_nullable
          : billsEnabled as bool,
      announcementPublishers:
          announcementPublishers == const $CopyWithPlaceholder()
          ? _value.announcementPublishers
          // ignore: cast_nullable_to_non_nullable
          : announcementPublishers as SiteSettingsAnnouncementPublishersEnum,
      ticketArchiveMonths: ticketArchiveMonths == const $CopyWithPlaceholder()
          ? _value.ticketArchiveMonths
          // ignore: cast_nullable_to_non_nullable
          : ticketArchiveMonths as int?,
      visitorLogRetentionDays:
          visitorLogRetentionDays == const $CopyWithPlaceholder()
          ? _value.visitorLogRetentionDays
          // ignore: cast_nullable_to_non_nullable
          : visitorLogRetentionDays as int,
      legalPreset: legalPreset == const $CopyWithPlaceholder()
          ? _value.legalPreset
          // ignore: cast_nullable_to_non_nullable
          : legalPreset as String?,
      access: access == const $CopyWithPlaceholder()
          ? _value.access
          // ignore: cast_nullable_to_non_nullable
          : access as AccessSettings,
      extra: extra == const $CopyWithPlaceholder()
          ? _value.extra
          // ignore: cast_nullable_to_non_nullable
          : extra as Map<String, Object>?,
      payments: payments == const $CopyWithPlaceholder()
          ? _value.payments
          // ignore: cast_nullable_to_non_nullable
          : payments as SiteSettingsPayments?,
      packDefaults: packDefaults == const $CopyWithPlaceholder()
          ? _value.packDefaults
          // ignore: cast_nullable_to_non_nullable
          : packDefaults as Map<String, SiteSettingsPackDefaultsValue>?,
    );
  }
}

extension $SiteSettingsCopyWith on SiteSettings {
  /// Returns a callable class that can be used as follows: `instanceOfSiteSettings.copyWith(...)` or like so:`instanceOfSiteSettings.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SiteSettingsCWProxy get copyWith => _$SiteSettingsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiteSettings _$SiteSettingsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SiteSettings',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'version',
        'tenants_are_portal_users',
        'directory_enabled',
        'owner_financial_transparency',
        'parking_storage_default',
        'bills_enabled',
        'announcement_publishers',
        'ticket_archive_months',
        'visitor_log_retention_days',
        'legal_preset',
        'access',
        'extra',
      ],
    );
    final val = SiteSettings(
      version: $checkedConvert('version', (v) => (v as num).toInt()),
      tenantsArePortalUsers: $checkedConvert(
        'tenants_are_portal_users',
        (v) => v as bool,
      ),
      directoryEnabled: $checkedConvert('directory_enabled', (v) => v as bool),
      ownerFinancialTransparency: $checkedConvert(
        'owner_financial_transparency',
        (v) => v as bool,
      ),
      parkingStorageDefault: $checkedConvert(
        'parking_storage_default',
        (v) => $enumDecode(
          _$SiteSettingsParkingStorageDefaultEnumEnumMap,
          v,
          unknownValue:
              SiteSettingsParkingStorageDefaultEnum.unknownDefaultOpenApi,
        ),
      ),
      billsEnabled: $checkedConvert('bills_enabled', (v) => v as bool),
      announcementPublishers: $checkedConvert(
        'announcement_publishers',
        (v) => $enumDecode(
          _$SiteSettingsAnnouncementPublishersEnumEnumMap,
          v,
          unknownValue:
              SiteSettingsAnnouncementPublishersEnum.unknownDefaultOpenApi,
        ),
      ),
      ticketArchiveMonths: $checkedConvert(
        'ticket_archive_months',
        (v) => (v as num?)?.toInt(),
      ),
      visitorLogRetentionDays: $checkedConvert(
        'visitor_log_retention_days',
        (v) => (v as num).toInt(),
      ),
      legalPreset: $checkedConvert('legal_preset', (v) => v as String?),
      access: $checkedConvert(
        'access',
        (v) => AccessSettings.fromJson(v as Map<String, dynamic>),
      ),
      extra: $checkedConvert(
        'extra',
        (v) => (v as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, e as Object),
        ),
      ),
      payments: $checkedConvert(
        'payments',
        (v) => v == null
            ? null
            : SiteSettingsPayments.fromJson(v as Map<String, dynamic>),
      ),
      packDefaults: $checkedConvert(
        'pack_defaults',
        (v) => (v as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
            k,
            SiteSettingsPackDefaultsValue.fromJson(e as Map<String, dynamic>),
          ),
        ),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'tenantsArePortalUsers': 'tenants_are_portal_users',
    'directoryEnabled': 'directory_enabled',
    'ownerFinancialTransparency': 'owner_financial_transparency',
    'parkingStorageDefault': 'parking_storage_default',
    'billsEnabled': 'bills_enabled',
    'announcementPublishers': 'announcement_publishers',
    'ticketArchiveMonths': 'ticket_archive_months',
    'visitorLogRetentionDays': 'visitor_log_retention_days',
    'legalPreset': 'legal_preset',
    'packDefaults': 'pack_defaults',
  },
);

Map<String, dynamic> _$SiteSettingsToJson(SiteSettings instance) =>
    <String, dynamic>{
      'version': instance.version,
      'tenants_are_portal_users': instance.tenantsArePortalUsers,
      'directory_enabled': instance.directoryEnabled,
      'owner_financial_transparency': instance.ownerFinancialTransparency,
      'parking_storage_default':
          _$SiteSettingsParkingStorageDefaultEnumEnumMap[instance
              .parkingStorageDefault]!,
      'bills_enabled': instance.billsEnabled,
      'announcement_publishers':
          _$SiteSettingsAnnouncementPublishersEnumEnumMap[instance
              .announcementPublishers]!,
      'ticket_archive_months': instance.ticketArchiveMonths,
      'visitor_log_retention_days': instance.visitorLogRetentionDays,
      'legal_preset': instance.legalPreset,
      'access': instance.access.toJson(),
      'extra': instance.extra,
      'payments': ?instance.payments?.toJson(),
      'pack_defaults': ?instance.packDefaults?.map(
        (k, e) => MapEntry(k, e.toJson()),
      ),
    };

const _$SiteSettingsParkingStorageDefaultEnumEnumMap = {
  SiteSettingsParkingStorageDefaultEnum.appurtenance: 'appurtenance',
  SiteSettingsParkingStorageDefaultEnum.independent: 'independent',
  SiteSettingsParkingStorageDefaultEnum.unknownDefaultOpenApi:
      'unknown_default_open_api',
};

const _$SiteSettingsAnnouncementPublishersEnumEnumMap = {
  SiteSettingsAnnouncementPublishersEnum.managerOnly: 'manager_only',
  SiteSettingsAnnouncementPublishersEnum.managerAndBoard: 'manager_and_board',
  SiteSettingsAnnouncementPublishersEnum.unknownDefaultOpenApi:
      'unknown_default_open_api',
};
