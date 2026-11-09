//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device_register.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DeviceRegister {
  /// Returns a new [DeviceRegister] instance.
  DeviceRegister({

    required  this.pushKind,

    required  this.token,

     this.relayId,

     this.appVersion,

     this.locale,
  });

      /// `fcm` and `apns` go through the relay named by `relay_id`; `unifiedpush` posts to the endpoint URL held in `token`. Open on input; the known values are listed here.
  @JsonKey(
    
    name: r'push_kind',
    required: true,
    includeIfNull: false,
  )


  final String pushKind;



      /// The FCM or APNs device token, or the https endpoint URL of the UnifiedPush distributor.
  @JsonKey(
    
    name: r'token',
    required: true,
    includeIfNull: false,
  )


  final String token;



      /// The relay of the app build (`app_config.json`; `official` in the store build). Required for `fcm` and `apns`, ignored for `unifiedpush`.
  @JsonKey(
    
    name: r'relay_id',
    required: false,
    includeIfNull: false,
  )


  final String? relayId;



  @JsonKey(
    
    name: r'app_version',
    required: false,
    includeIfNull: false,
  )


  final String? appVersion;



  @JsonKey(
    
    name: r'locale',
    required: false,
    includeIfNull: false,
  )


  final String? locale;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DeviceRegister &&
      other.pushKind == pushKind &&
      other.token == token &&
      other.relayId == relayId &&
      other.appVersion == appVersion &&
      other.locale == locale;

    @override
    int get hashCode =>
        pushKind.hashCode +
        token.hashCode +
        relayId.hashCode +
        appVersion.hashCode +
        locale.hashCode;

  factory DeviceRegister.fromJson(Map<String, dynamic> json) => _$DeviceRegisterFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceRegisterToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

