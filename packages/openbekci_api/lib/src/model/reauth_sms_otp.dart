//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reauth_sms_otp.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReauthSmsOtp {
  /// Returns a new [ReauthSmsOtp] instance.
  ReauthSmsOtp({

    required  this.method,

    required  this.code,
  });

      /// Always `sms_otp`.
  @JsonKey(
    
    name: r'method',
    required: true,
    includeIfNull: false,
  )


  final String method;



      /// A code sent to the account's own phone by `auth.requestOtp`.
  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ReauthSmsOtp &&
      other.method == method &&
      other.code == code;

    @override
    int get hashCode =>
        method.hashCode +
        code.hashCode;

  factory ReauthSmsOtp.fromJson(Map<String, dynamic> json) => _$ReauthSmsOtpFromJson(json);

  Map<String, dynamic> toJson() => _$ReauthSmsOtpToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

