//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'credentials.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Credentials {
  /// Returns a new [Credentials] instance.
  Credentials({

    required  this.method,

    required  this.identifier,

     this.password,

     this.code,

     this.client = CredentialsClientEnum.web,

     this.deviceName,
  });

  @JsonKey(
    
    name: r'method',
    required: true,
    includeIfNull: false,
  )


  final String method;



  @JsonKey(
    
    name: r'identifier',
    required: true,
    includeIfNull: false,
  )


  final String identifier;



  @JsonKey(
    
    name: r'password',
    required: false,
    includeIfNull: false,
  )


  final String? password;



      /// The code sent by SMS.
  @JsonKey(
    
    name: r'code',
    required: false,
    includeIfNull: false,
  )


  final String? code;



      /// `mobile` makes an emailed link use the `openbekci://` scheme.
  @JsonKey(
    name: r'client',
    required: false,
    includeIfNull: false,
  unknownEnumValue: CredentialsClientEnum.unknownDefaultOpenApi,
  )


  final CredentialsClientEnum? client;



      /// Label of the session in the session list.
  @JsonKey(
    
    name: r'device_name',
    required: false,
    includeIfNull: false,
  )


  final String? deviceName;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Credentials &&
      other.method == method &&
      other.identifier == identifier &&
      other.password == password &&
      other.code == code &&
      other.client == client &&
      other.deviceName == deviceName;

    @override
    int get hashCode =>
        method.hashCode +
        identifier.hashCode +
        password.hashCode +
        code.hashCode +
        client.hashCode +
        deviceName.hashCode;

  factory Credentials.fromJson(Map<String, dynamic> json) => _$CredentialsFromJson(json);

  Map<String, dynamic> toJson() => _$CredentialsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// `mobile` makes an emailed link use the `openbekci://` scheme.
enum CredentialsClientEnum {
@JsonValue(r'web')
web(r'web'),
@JsonValue(r'mobile')
mobile(r'mobile'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const CredentialsClientEnum(this.value);

final String value;

@override
String toString() => value;
}


