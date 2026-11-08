//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'branding.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Branding {
  /// Returns a new [Branding] instance.
  Branding({

     this.logoUrl,

     this.primaryColor,
  });

  @JsonKey(
    
    name: r'logo_url',
    required: false,
    includeIfNull: false,
  )


  final String? logoUrl;



  @JsonKey(
    
    name: r'primary_color',
    required: false,
    includeIfNull: false,
  )


  final String? primaryColor;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Branding &&
      other.logoUrl == logoUrl &&
      other.primaryColor == primaryColor;

    @override
    int get hashCode =>
        logoUrl.hashCode +
        primaryColor.hashCode;

  factory Branding.fromJson(Map<String, dynamic> json) => _$BrandingFromJson(json);

  Map<String, dynamic> toJson() => _$BrandingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

