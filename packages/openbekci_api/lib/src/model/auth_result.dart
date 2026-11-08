//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/auth_user.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_result.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AuthResult {
  /// Returns a new [AuthResult] instance.
  AuthResult({

    required  this.client,

    required  this.sessionId,

    required  this.expiresAt,

    required  this.user,

     this.accessToken,

     this.refreshToken,

     this.refreshExpiresAt,
  });

      /// Which kind of session was created (open enum).
  @JsonKey(
    
    name: r'client',
    required: true,
    includeIfNull: false,
  unknownEnumValue: AuthResultClientEnum.unknownDefaultOpenApi,
  )


  final AuthResultClientEnum client;



  @JsonKey(
    
    name: r'session_id',
    required: true,
    includeIfNull: false,
  )


  final String sessionId;



  @JsonKey(
    
    name: r'expires_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiresAt;



  @JsonKey(
    
    name: r'user',
    required: true,
    includeIfNull: false,
  )


  final AuthUser user;



      /// Only for `client=mobile`.
  @JsonKey(
    
    name: r'access_token',
    required: false,
    includeIfNull: false,
  )


  final String? accessToken;



      /// Only for `client=mobile`.
  @JsonKey(
    
    name: r'refresh_token',
    required: false,
    includeIfNull: false,
  )


  final String? refreshToken;



      /// Only for `client=mobile`.
  @JsonKey(
    
    name: r'refresh_expires_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? refreshExpiresAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AuthResult &&
      other.client == client &&
      other.sessionId == sessionId &&
      other.expiresAt == expiresAt &&
      other.user == user &&
      other.accessToken == accessToken &&
      other.refreshToken == refreshToken &&
      other.refreshExpiresAt == refreshExpiresAt;

    @override
    int get hashCode =>
        client.hashCode +
        sessionId.hashCode +
        expiresAt.hashCode +
        user.hashCode +
        accessToken.hashCode +
        refreshToken.hashCode +
        refreshExpiresAt.hashCode;

  factory AuthResult.fromJson(Map<String, dynamic> json) => _$AuthResultFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResultToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Which kind of session was created (open enum).
enum AuthResultClientEnum {
@JsonValue(r'web')
web(r'web'),
@JsonValue(r'mobile')
mobile(r'mobile'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const AuthResultClientEnum(this.value);

final String value;

@override
String toString() => value;
}


