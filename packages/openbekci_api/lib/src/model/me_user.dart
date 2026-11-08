//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'me_user.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MeUser {
  /// Returns a new [MeUser] instance.
  MeUser({

    required  this.id,

    required  this.displayName,

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



      /// The name of the person linked to the account (first organization), else the email or phone.
  @JsonKey(
    
    name: r'display_name',
    required: true,
    includeIfNull: false,
  )


  final String displayName;



  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: true,
  )


  final String? email;



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
    bool operator ==(Object other) => identical(this, other) || other is MeUser &&
      other.id == id &&
      other.displayName == displayName &&
      other.email == email &&
      other.phone == phone &&
      other.locale == locale &&
      other.isPlatformAdmin == isPlatformAdmin;

    @override
    int get hashCode =>
        id.hashCode +
        displayName.hashCode +
        (email == null ? 0 : email.hashCode) +
        (phone == null ? 0 : phone.hashCode) +
        locale.hashCode +
        isPlatformAdmin.hashCode;

  factory MeUser.fromJson(Map<String, dynamic> json) => _$MeUserFromJson(json);

  Map<String, dynamic> toJson() => _$MeUserToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

