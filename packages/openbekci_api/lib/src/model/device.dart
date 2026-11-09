//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Device {
  /// Returns a new [Device] instance.
  Device({

    required  this.id,

    required  this.pushKind,

    required  this.relayId,

    required  this.appVersion,

    required  this.locale,

    required  this.enabled,

    required  this.createdAt,

    required  this.updatedAt,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'push_kind',
    required: true,
    includeIfNull: false,
  )


  final String pushKind;



  @JsonKey(
    
    name: r'relay_id',
    required: true,
    includeIfNull: true,
  )


  final String? relayId;



  @JsonKey(
    
    name: r'app_version',
    required: true,
    includeIfNull: true,
  )


  final String? appVersion;



  @JsonKey(
    
    name: r'locale',
    required: true,
    includeIfNull: true,
  )


  final String? locale;



      /// False after the relay reported the token invalid; registering the token again enables the device.
  @JsonKey(
    
    name: r'enabled',
    required: true,
    includeIfNull: false,
  )


  final bool enabled;



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





    @override
    bool operator ==(Object other) => identical(this, other) || other is Device &&
      other.id == id &&
      other.pushKind == pushKind &&
      other.relayId == relayId &&
      other.appVersion == appVersion &&
      other.locale == locale &&
      other.enabled == enabled &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        id.hashCode +
        pushKind.hashCode +
        (relayId == null ? 0 : relayId.hashCode) +
        (appVersion == null ? 0 : appVersion.hashCode) +
        (locale == null ? 0 : locale.hashCode) +
        enabled.hashCode +
        createdAt.hashCode +
        updatedAt.hashCode;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

