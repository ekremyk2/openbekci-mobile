//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'directory_consent.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DirectoryConsent {
  /// Returns a new [DirectoryConsent] instance.
  DirectoryConsent({

    required  this.siteId,

    required  this.consent,

    required  this.showPhone,
  });

  @JsonKey(
    
    name: r'site_id',
    required: true,
    includeIfNull: false,
  )


  final String siteId;



  @JsonKey(
    
    name: r'consent',
    required: true,
    includeIfNull: false,
  )


  final bool consent;



  @JsonKey(
    
    name: r'show_phone',
    required: true,
    includeIfNull: false,
  )


  final bool showPhone;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DirectoryConsent &&
      other.siteId == siteId &&
      other.consent == consent &&
      other.showPhone == showPhone;

    @override
    int get hashCode =>
        siteId.hashCode +
        consent.hashCode +
        showPhone.hashCode;

  factory DirectoryConsent.fromJson(Map<String, dynamic> json) => _$DirectoryConsentFromJson(json);

  Map<String, dynamic> toJson() => _$DirectoryConsentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

