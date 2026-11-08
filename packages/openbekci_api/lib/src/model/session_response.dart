//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/auth_user.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SessionResponse {
  /// Returns a new [SessionResponse] instance.
  SessionResponse({

    required  this.sessionId,

    required  this.expiresAt,

    required  this.user,
  });

      /// Id of the session in `GET /v1/me/sessions`.
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





    @override
    bool operator ==(Object other) => identical(this, other) || other is SessionResponse &&
      other.sessionId == sessionId &&
      other.expiresAt == expiresAt &&
      other.user == user;

    @override
    int get hashCode =>
        sessionId.hashCode +
        expiresAt.hashCode +
        user.hashCode;

  factory SessionResponse.fromJson(Map<String, dynamic> json) => _$SessionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SessionResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

