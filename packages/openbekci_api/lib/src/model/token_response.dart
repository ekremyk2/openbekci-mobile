//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/auth_user.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TokenResponse {
  /// Returns a new [TokenResponse] instance.
  TokenResponse({

    required  this.tokenType,

    required  this.accessToken,

    required  this.accessExpiresAt,

    required  this.refreshToken,

    required  this.refreshExpiresAt,

    required  this.sessionId,

    required  this.user,
  });

  @JsonKey(
    
    name: r'token_type',
    required: true,
    includeIfNull: false,
  )


  final String tokenType;



  @JsonKey(
    
    name: r'access_token',
    required: true,
    includeIfNull: false,
  )


  final String accessToken;



  @JsonKey(
    
    name: r'access_expires_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime accessExpiresAt;



  @JsonKey(
    
    name: r'refresh_token',
    required: true,
    includeIfNull: false,
  )


  final String refreshToken;



  @JsonKey(
    
    name: r'refresh_expires_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime refreshExpiresAt;



  @JsonKey(
    
    name: r'session_id',
    required: true,
    includeIfNull: false,
  )


  final String sessionId;



  @JsonKey(
    
    name: r'user',
    required: true,
    includeIfNull: false,
  )


  final AuthUser user;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TokenResponse &&
      other.tokenType == tokenType &&
      other.accessToken == accessToken &&
      other.accessExpiresAt == accessExpiresAt &&
      other.refreshToken == refreshToken &&
      other.refreshExpiresAt == refreshExpiresAt &&
      other.sessionId == sessionId &&
      other.user == user;

    @override
    int get hashCode =>
        tokenType.hashCode +
        accessToken.hashCode +
        accessExpiresAt.hashCode +
        refreshToken.hashCode +
        refreshExpiresAt.hashCode +
        sessionId.hashCode +
        user.hashCode;

  factory TokenResponse.fromJson(Map<String, dynamic> json) => _$TokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

