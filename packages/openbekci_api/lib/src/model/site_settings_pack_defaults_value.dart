//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'site_settings_pack_defaults_value.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SiteSettingsPackDefaultsValue {
  /// Returns a new [SiteSettingsPackDefaultsValue] instance.
  SiteSettingsPackDefaultsValue({

    required  this.pack,

    required  this.value,
  });

      /// Id of the pack that wrote the value.
  @JsonKey(
    
    name: r'pack',
    required: true,
    includeIfNull: false,
  )


  final String pack;



      /// The value the pack wrote.
  @JsonKey(
    
    name: r'value',
    required: true,
    includeIfNull: true,
  )


  final Object? value;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SiteSettingsPackDefaultsValue &&
      other.pack == pack &&
      other.value == value;

    @override
    int get hashCode =>
        pack.hashCode +
        (value == null ? 0 : value.hashCode);

  factory SiteSettingsPackDefaultsValue.fromJson(Map<String, dynamic> json) => _$SiteSettingsPackDefaultsValueFromJson(json);

  Map<String, dynamic> toJson() => _$SiteSettingsPackDefaultsValueToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

