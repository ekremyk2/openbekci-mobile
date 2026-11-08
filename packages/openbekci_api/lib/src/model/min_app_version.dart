//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'min_app_version.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MinAppVersion {
  /// Returns a new [MinAppVersion] instance.
  MinAppVersion({

    required  this.android,

    required  this.ios,
  });

  @JsonKey(
    
    name: r'android',
    required: true,
    includeIfNull: false,
  )


  final String android;



  @JsonKey(
    
    name: r'ios',
    required: true,
    includeIfNull: false,
  )


  final String ios;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MinAppVersion &&
      other.android == android &&
      other.ios == ios;

    @override
    int get hashCode =>
        android.hashCode +
        ios.hashCode;

  factory MinAppVersion.fromJson(Map<String, dynamic> json) => _$MinAppVersionFromJson(json);

  Map<String, dynamic> toJson() => _$MinAppVersionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

