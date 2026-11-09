//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_create.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TicketCreate {
  /// Returns a new [TicketCreate] instance.
  TicketCreate({

    required  this.siteId,

     this.unitId,

    required  this.categoryId,

    required  this.title,

    required  this.description,

     this.visibility,

     this.reporterPersonId,

     this.attachmentFileIds,
  });

  @JsonKey(
    
    name: r'site_id',
    required: true,
    includeIfNull: false,
  )


  final String siteId;



  @JsonKey(
    
    name: r'unit_id',
    required: false,
    includeIfNull: false,
  )


  final String? unitId;



  @JsonKey(
    
    name: r'category_id',
    required: true,
    includeIfNull: false,
  )


  final String categoryId;



  @JsonKey(
    
    name: r'title',
    required: true,
    includeIfNull: false,
  )


  final String title;



  @JsonKey(
    
    name: r'description',
    required: true,
    includeIfNull: false,
  )


  final String description;



      /// Open enum. The creator chooses (O3): `private` is about one unit (a resident needs `unit_id` of a unit they occupy, or exactly one), `common` about the shared parts of the site or block. Left out, the category's default applies. Managers may set it for any ticket they open. 
  @JsonKey(
    
    name: r'visibility',
    required: false,
    includeIfNull: false,
  unknownEnumValue: TicketCreateVisibilityEnum.unknownDefaultOpenApi,
  )


  final TicketCreateVisibilityEnum? visibility;



  @JsonKey(
    
    name: r'reporter_person_id',
    required: false,
    includeIfNull: false,
  )


  final String? reporterPersonId;



  @JsonKey(
    
    name: r'attachment_file_ids',
    required: false,
    includeIfNull: false,
  )


  final List<String>? attachmentFileIds;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TicketCreate &&
      other.siteId == siteId &&
      other.unitId == unitId &&
      other.categoryId == categoryId &&
      other.title == title &&
      other.description == description &&
      other.visibility == visibility &&
      other.reporterPersonId == reporterPersonId &&
      other.attachmentFileIds == attachmentFileIds;

    @override
    int get hashCode =>
        siteId.hashCode +
        (unitId == null ? 0 : unitId.hashCode) +
        categoryId.hashCode +
        title.hashCode +
        description.hashCode +
        visibility.hashCode +
        reporterPersonId.hashCode +
        attachmentFileIds.hashCode;

  factory TicketCreate.fromJson(Map<String, dynamic> json) => _$TicketCreateFromJson(json);

  Map<String, dynamic> toJson() => _$TicketCreateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum. The creator chooses (O3): `private` is about one unit (a resident needs `unit_id` of a unit they occupy, or exactly one), `common` about the shared parts of the site or block. Left out, the category's default applies. Managers may set it for any ticket they open. 
enum TicketCreateVisibilityEnum {
@JsonValue(r'private')
private(r'private'),
@JsonValue(r'common')
common(r'common'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const TicketCreateVisibilityEnum(this.value);

final String value;

@override
String toString() => value;
}


