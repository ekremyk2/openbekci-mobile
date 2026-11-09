//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_update.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ProfileUpdate {
  /// Returns a new [ProfileUpdate] instance.
  ProfileUpdate({

     this.displayName,

     this.locale,
  });

      /// The account's display name; an empty string clears it.
  @JsonKey(
    
    name: r'display_name',
    required: false,
    includeIfNull: false,
  )


  final String? displayName;



      /// One of the locales the server has texts for, `tr` or `en`.
  @JsonKey(
    
    name: r'locale',
    required: false,
    includeIfNull: false,
  )


  final String? locale;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ProfileUpdate &&
      other.displayName == displayName &&
      other.locale == locale;

    @override
    int get hashCode =>
        displayName.hashCode +
        locale.hashCode;

  factory ProfileUpdate.fromJson(Map<String, dynamic> json) => _$ProfileUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileUpdateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

