//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reauth_email_code.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReauthEmailCode {
  /// Returns a new [ReauthEmailCode] instance.
  ReauthEmailCode({

    required  this.method,

    required  this.code,
  });

      /// Always `email_code`.
  @JsonKey(
    
    name: r'method',
    required: true,
    includeIfNull: false,
  )


  final String method;



      /// A code sent to the account's own email address by `auth.requestReauthEmailCode`.
  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ReauthEmailCode &&
      other.method == method &&
      other.code == code;

    @override
    int get hashCode =>
        method.hashCode +
        code.hashCode;

  factory ReauthEmailCode.fromJson(Map<String, dynamic> json) => _$ReauthEmailCodeFromJson(json);

  Map<String, dynamic> toJson() => _$ReauthEmailCodeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

