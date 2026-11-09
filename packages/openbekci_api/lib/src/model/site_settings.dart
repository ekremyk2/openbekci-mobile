//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/access_settings.dart';
import 'package:openbekci_api/src/model/site_settings_payments.dart';
import 'package:openbekci_api/src/model/site_settings_pack_defaults_value.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'site_settings.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SiteSettings {
  /// Returns a new [SiteSettings] instance.
  SiteSettings({

    required  this.version,

    required  this.tenantsArePortalUsers,

    required  this.directoryEnabled,

    required  this.ownerFinancialTransparency,

    required  this.parkingStorageDefault,

    required  this.billsEnabled,

    required  this.announcementPublishers,

    required  this.ticketArchiveMonths,

    required  this.visitorLogRetentionDays,

    required  this.legalPreset,

    required  this.access,

    required  this.extra,

     this.payments,

     this.packDefaults,
  });

      /// The site `version`; send it back as `If-Match` on the next update (the settings and the bank details are written with the site).
  @JsonKey(
    
    name: r'version',
    required: true,
    includeIfNull: false,
  )


  final int version;



      /// Tenants get a portal login (S3).
  @JsonKey(
    
    name: r'tenants_are_portal_users',
    required: true,
    includeIfNull: false,
  )


  final bool tenantsArePortalUsers;



      /// Opt-in resident directory is on (S8).
  @JsonKey(
    
    name: r'directory_enabled',
    required: true,
    includeIfNull: false,
  )


  final bool directoryEnabled;



      /// Owners see aggregate gelir-gider and budget vs actual.
  @JsonKey(
    
    name: r'owner_financial_transparency',
    required: true,
    includeIfNull: false,
  )


  final bool ownerFinancialTransparency;



      /// Default for parking and storage units (S2). Open enum.
  @JsonKey(
    
    name: r'parking_storage_default',
    required: true,
    includeIfNull: false,
  unknownEnumValue: SiteSettingsParkingStorageDefaultEnum.unknownDefaultOpenApi,
  )


  final SiteSettingsParkingStorageDefaultEnum parkingStorageDefault;



      /// Vendor bills with due dates and partial payments are switched on (M6).
  @JsonKey(
    
    name: r'bills_enabled',
    required: true,
    includeIfNull: false,
  )


  final bool billsEnabled;



      /// Open enum.
  @JsonKey(
    
    name: r'announcement_publishers',
    required: true,
    includeIfNull: false,
  unknownEnumValue: SiteSettingsAnnouncementPublishersEnum.unknownDefaultOpenApi,
  )


  final SiteSettingsAnnouncementPublishersEnum announcementPublishers;



      /// Archive closed tickets after N months; null: never.
  @JsonKey(
    
    name: r'ticket_archive_months',
    required: true,
    includeIfNull: true,
  )


  final int? ticketArchiveMonths;



      /// Default 90 (C2).
  @JsonKey(
    
    name: r'visitor_log_retention_days',
    required: true,
    includeIfNull: false,
  )


  final int visitorLogRetentionDays;



      /// National preset id supplied by a pack, for example `tr`.
  @JsonKey(
    
    name: r'legal_preset',
    required: true,
    includeIfNull: true,
  )


  final String? legalPreset;



  @JsonKey(
    
    name: r'access',
    required: true,
    includeIfNull: false,
  )


  final AccessSettings access;



      /// Pack-defined settings (schema-driven in 0.4).
  @JsonKey(
    
    name: r'extra',
    required: true,
    includeIfNull: true,
  )


  final Map<String, Object>? extra;



  @JsonKey(
    
    name: r'payments',
    required: false,
    includeIfNull: false,
  )


  final SiteSettingsPayments? payments;



      /// The settings a pack filled in (presets) that still hold the value the pack wrote, by settings key, for the \"pack default\" marker. A setting the site edited is its own and is not listed. Absent without packs. 
  @JsonKey(
    
    name: r'pack_defaults',
    required: false,
    includeIfNull: false,
  )


  final Map<String, SiteSettingsPackDefaultsValue>? packDefaults;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SiteSettings &&
      other.version == version &&
      other.tenantsArePortalUsers == tenantsArePortalUsers &&
      other.directoryEnabled == directoryEnabled &&
      other.ownerFinancialTransparency == ownerFinancialTransparency &&
      other.parkingStorageDefault == parkingStorageDefault &&
      other.billsEnabled == billsEnabled &&
      other.announcementPublishers == announcementPublishers &&
      other.ticketArchiveMonths == ticketArchiveMonths &&
      other.visitorLogRetentionDays == visitorLogRetentionDays &&
      other.legalPreset == legalPreset &&
      other.access == access &&
      other.extra == extra &&
      other.payments == payments &&
      other.packDefaults == packDefaults;

    @override
    int get hashCode =>
        version.hashCode +
        tenantsArePortalUsers.hashCode +
        directoryEnabled.hashCode +
        ownerFinancialTransparency.hashCode +
        parkingStorageDefault.hashCode +
        billsEnabled.hashCode +
        announcementPublishers.hashCode +
        (ticketArchiveMonths == null ? 0 : ticketArchiveMonths.hashCode) +
        visitorLogRetentionDays.hashCode +
        (legalPreset == null ? 0 : legalPreset.hashCode) +
        access.hashCode +
        (extra == null ? 0 : extra.hashCode) +
        payments.hashCode +
        packDefaults.hashCode;

  factory SiteSettings.fromJson(Map<String, dynamic> json) => _$SiteSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SiteSettingsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Default for parking and storage units (S2). Open enum.
enum SiteSettingsParkingStorageDefaultEnum {
@JsonValue(r'appurtenance')
appurtenance(r'appurtenance'),
@JsonValue(r'independent')
independent(r'independent'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const SiteSettingsParkingStorageDefaultEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Open enum.
enum SiteSettingsAnnouncementPublishersEnum {
@JsonValue(r'manager_only')
managerOnly(r'manager_only'),
@JsonValue(r'manager_and_board')
managerAndBoard(r'manager_and_board'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const SiteSettingsAnnouncementPublishersEnum(this.value);

final String value;

@override
String toString() => value;
}


