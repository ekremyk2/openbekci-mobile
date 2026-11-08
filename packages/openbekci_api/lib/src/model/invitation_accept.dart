//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invitation_accept.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InvitationAccept {
  /// Returns a new [InvitationAccept] instance.
  InvitationAccept({

     this.password,

     this.displayName,

     this.locale,

     this.client,
  });

      /// Required for a new account; minimum 10 characters.
  @JsonKey(
    
    name: r'password',
    required: false,
    includeIfNull: false,
  )


  final String? password;



  @JsonKey(
    
    name: r'display_name',
    required: false,
    includeIfNull: false,
  )


  final String? displayName;



  @JsonKey(
    
    name: r'locale',
    required: false,
    includeIfNull: false,
  )


  final String? locale;



  @JsonKey(
    
    name: r'client',
    required: false,
    includeIfNull: false,
  unknownEnumValue: InvitationAcceptClientEnum.unknownDefaultOpenApi,
  )


  final InvitationAcceptClientEnum? client;





    @override
    bool operator ==(Object other) => identical(this, other) || other is InvitationAccept &&
      other.password == password &&
      other.displayName == displayName &&
      other.locale == locale &&
      other.client == client;

    @override
    int get hashCode =>
        password.hashCode +
        displayName.hashCode +
        locale.hashCode +
        client.hashCode;

  factory InvitationAccept.fromJson(Map<String, dynamic> json) => _$InvitationAcceptFromJson(json);

  Map<String, dynamic> toJson() => _$InvitationAcceptToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum InvitationAcceptClientEnum {
@JsonValue(r'web')
web(r'web'),
@JsonValue(r'mobile')
mobile(r'mobile'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const InvitationAcceptClientEnum(this.value);

final String value;

@override
String toString() => value;
}


