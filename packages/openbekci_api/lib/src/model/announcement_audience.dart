//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'announcement_audience.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AnnouncementAudience {
  /// Returns a new [AnnouncementAudience] instance.
  AnnouncementAudience({

    required  this.kind,

     this.blockId,

     this.unitIds,
  });

  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  unknownEnumValue: AnnouncementAudienceKindEnum.unknownDefaultOpenApi,
  )


  final AnnouncementAudienceKindEnum kind;



  @JsonKey(
    
    name: r'block_id',
    required: false,
    includeIfNull: false,
  )


  final String? blockId;



  @JsonKey(
    
    name: r'unit_ids',
    required: false,
    includeIfNull: false,
  )


  final List<String>? unitIds;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AnnouncementAudience &&
      other.kind == kind &&
      other.blockId == blockId &&
      other.unitIds == unitIds;

    @override
    int get hashCode =>
        kind.hashCode +
        blockId.hashCode +
        unitIds.hashCode;

  factory AnnouncementAudience.fromJson(Map<String, dynamic> json) => _$AnnouncementAudienceFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementAudienceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum AnnouncementAudienceKindEnum {
@JsonValue(r'site')
site(r'site'),
@JsonValue(r'block')
block(r'block'),
@JsonValue(r'owners')
owners(r'owners'),
@JsonValue(r'tenants')
tenants(r'tenants'),
@JsonValue(r'units')
units(r'units'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const AnnouncementAudienceKindEnum(this.value);

final String value;

@override
String toString() => value;
}


