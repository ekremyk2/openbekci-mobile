//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'magic_link_consume_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MagicLinkConsumeRequest {
  /// Returns a new [MagicLinkConsumeRequest] instance.
  MagicLinkConsumeRequest({

    required  this.token,

     this.client = MagicLinkConsumeRequestClientEnum.web,

     this.deviceName,
  });

  @JsonKey(
    
    name: r'token',
    required: true,
    includeIfNull: false,
  )


  final String token;



      /// `web` sets the session cookie, `mobile` returns tokens.
  @JsonKey(
    name: r'client',
    required: false,
    includeIfNull: false,
  unknownEnumValue: MagicLinkConsumeRequestClientEnum.unknownDefaultOpenApi,
  )


  final MagicLinkConsumeRequestClientEnum? client;



  @JsonKey(
    
    name: r'device_name',
    required: false,
    includeIfNull: false,
  )


  final String? deviceName;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MagicLinkConsumeRequest &&
      other.token == token &&
      other.client == client &&
      other.deviceName == deviceName;

    @override
    int get hashCode =>
        token.hashCode +
        client.hashCode +
        deviceName.hashCode;

  factory MagicLinkConsumeRequest.fromJson(Map<String, dynamic> json) => _$MagicLinkConsumeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MagicLinkConsumeRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// `web` sets the session cookie, `mobile` returns tokens.
enum MagicLinkConsumeRequestClientEnum {
@JsonValue(r'web')
web(r'web'),
@JsonValue(r'mobile')
mobile(r'mobile'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const MagicLinkConsumeRequestClientEnum(this.value);

final String value;

@override
String toString() => value;
}


