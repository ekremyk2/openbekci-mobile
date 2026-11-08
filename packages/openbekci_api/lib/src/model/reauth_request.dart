//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/reauth_sms_otp.dart';
import 'package:openbekci_api/src/model/reauth_password.dart';
import 'package:openbekci_api/src/model/reauth_email_code.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reauth_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReauthRequest {
  /// Returns a new [ReauthRequest] instance.
  ReauthRequest({

    required  this.method,

    required  this.password,

    required  this.code,
  });

      /// Always `email_code`.
  @JsonKey(
    
    name: r'method',
    required: true,
    includeIfNull: false,
  )


  final String method;



  @JsonKey(
    
    name: r'password',
    required: true,
    includeIfNull: false,
  )


  final String password;



      /// A code sent to the account's own email address by `auth.requestReauthEmailCode`.
  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ReauthRequest &&
      other.method == method &&
      other.password == password &&
      other.code == code;

    @override
    int get hashCode =>
        method.hashCode +
        password.hashCode +
        code.hashCode;

  factory ReauthRequest.fromJson(Map<String, dynamic> json) => _$ReauthRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReauthRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

