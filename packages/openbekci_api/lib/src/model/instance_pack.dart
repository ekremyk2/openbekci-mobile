//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'instance_pack.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InstancePack {
  /// Returns a new [InstancePack] instance.
  InstancePack({

    required  this.id,

    required  this.version,

    required  this.minSdk,

    required  this.countries,

    required  this.enabled,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'version',
    required: true,
    includeIfNull: false,
  )


  final String version;



  @JsonKey(
    
    name: r'min_sdk',
    required: true,
    includeIfNull: false,
  )


  final String minSdk;



  @JsonKey(
    
    name: r'countries',
    required: true,
    includeIfNull: false,
  )


  final List<String> countries;



      /// Enabled for at least one organization of the instance.
  @JsonKey(
    
    name: r'enabled',
    required: true,
    includeIfNull: false,
  )


  final bool enabled;





    @override
    bool operator ==(Object other) => identical(this, other) || other is InstancePack &&
      other.id == id &&
      other.version == version &&
      other.minSdk == minSdk &&
      other.countries == countries &&
      other.enabled == enabled;

    @override
    int get hashCode =>
        id.hashCode +
        version.hashCode +
        minSdk.hashCode +
        countries.hashCode +
        enabled.hashCode;

  factory InstancePack.fromJson(Map<String, dynamic> json) => _$InstancePackFromJson(json);

  Map<String, dynamic> toJson() => _$InstancePackToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

