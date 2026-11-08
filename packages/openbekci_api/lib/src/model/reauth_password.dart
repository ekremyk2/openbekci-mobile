//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reauth_password.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReauthPassword {
  /// Returns a new [ReauthPassword] instance.
  ReauthPassword({

    required  this.method,

    required  this.password,
  });

      /// Always `password`.
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





    @override
    bool operator ==(Object other) => identical(this, other) || other is ReauthPassword &&
      other.method == method &&
      other.password == password;

    @override
    int get hashCode =>
        method.hashCode +
        password.hashCode;

  factory ReauthPassword.fromJson(Map<String, dynamic> json) => _$ReauthPasswordFromJson(json);

  Map<String, dynamic> toJson() => _$ReauthPasswordToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

