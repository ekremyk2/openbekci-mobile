//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/address.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'site.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Site {
  /// Returns a new [Site] instance.
  Site({

    required  this.id,

    required  this.orgId,

    required  this.name,

    required  this.address,

    required  this.timezone,

    required  this.currency,

    required  this.fiscalYearStartMonth,

    required  this.lockDate,

    required  this.status,

    required  this.createdAt,

    required  this.updatedAt,

    required  this.version,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'org_id',
    required: true,
    includeIfNull: false,
  )


  final String orgId;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'address',
    required: true,
    includeIfNull: false,
  )


  final Address address;



      /// IANA zone
  @JsonKey(
    
    name: r'timezone',
    required: true,
    includeIfNull: false,
  )


  final String timezone;



      /// ISO 4217; one per site
  @JsonKey(
    
    name: r'currency',
    required: true,
    includeIfNull: false,
  )


  final String currency;



      /// 1..12, default 1
  @JsonKey(
    
    name: r'fiscal_year_start_month',
    required: true,
    includeIfNull: false,
  )


  final int fiscalYearStartMonth;



      /// Postings dated on or before this are rejected (`locked_period`).
  @JsonKey(
    
    name: r'lock_date',
    required: true,
    includeIfNull: true,
  )


  final DateTime? lockDate;



      /// Open enum.
  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  unknownEnumValue: SiteStatusEnum.unknownDefaultOpenApi,
  )


  final SiteStatusEnum status;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'updated_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime updatedAt;



      /// Optimistic-lock counter; send it back as If-Match on updates.
  @JsonKey(
    
    name: r'version',
    required: true,
    includeIfNull: false,
  )


  final int version;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Site &&
      other.id == id &&
      other.orgId == orgId &&
      other.name == name &&
      other.address == address &&
      other.timezone == timezone &&
      other.currency == currency &&
      other.fiscalYearStartMonth == fiscalYearStartMonth &&
      other.lockDate == lockDate &&
      other.status == status &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.version == version;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        name.hashCode +
        address.hashCode +
        timezone.hashCode +
        currency.hashCode +
        fiscalYearStartMonth.hashCode +
        (lockDate == null ? 0 : lockDate.hashCode) +
        status.hashCode +
        createdAt.hashCode +
        updatedAt.hashCode +
        version.hashCode;

  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);

  Map<String, dynamic> toJson() => _$SiteToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum SiteStatusEnum {
@JsonValue(r'active')
active(r'active'),
@JsonValue(r'offboarded')
offboarded(r'offboarded'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const SiteStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


