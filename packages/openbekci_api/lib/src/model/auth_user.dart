//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_user.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AuthUser {
  /// Returns a new [AuthUser] instance.
  AuthUser({

    required  this.id,

    required  this.email,

    required  this.phone,

    required  this.locale,

    required  this.isPlatformAdmin,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: true,
  )


  final String? email;



      /// E.164.
  @JsonKey(
    
    name: r'phone',
    required: true,
    includeIfNull: true,
  )


  final String? phone;



  @JsonKey(
    
    name: r'locale',
    required: true,
    includeIfNull: false,
  )


  final String locale;



  @JsonKey(
    
    name: r'is_platform_admin',
    required: true,
    includeIfNull: false,
  )


  final bool isPlatformAdmin;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AuthUser &&
      other.id == id &&
      other.email == email &&
      other.phone == phone &&
      other.locale == locale &&
      other.isPlatformAdmin == isPlatformAdmin;

    @override
    int get hashCode =>
        id.hashCode +
        (email == null ? 0 : email.hashCode) +
        (phone == null ? 0 : phone.hashCode) +
        locale.hashCode +
        isPlatformAdmin.hashCode;

  factory AuthUser.fromJson(Map<String, dynamic> json) => _$AuthUserFromJson(json);

  Map<String, dynamic> toJson() => _$AuthUserToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

