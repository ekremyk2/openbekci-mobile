//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'visitor_entry_create.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VisitorEntryCreate {
  /// Returns a new [VisitorEntryCreate] instance.
  VisitorEntryCreate({

    required  this.siteId,

    required  this.unitId,

    required  this.name,

     this.plate,

    required  this.windowFrom,

    required  this.windowTo,
  });

  @JsonKey(
    
    name: r'site_id',
    required: true,
    includeIfNull: false,
  )


  final String siteId;



  @JsonKey(
    
    name: r'unit_id',
    required: true,
    includeIfNull: false,
  )


  final String unitId;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'plate',
    required: false,
    includeIfNull: false,
  )


  final String? plate;



  @JsonKey(
    
    name: r'window_from',
    required: true,
    includeIfNull: false,
  )


  final DateTime windowFrom;



  @JsonKey(
    
    name: r'window_to',
    required: true,
    includeIfNull: false,
  )


  final DateTime windowTo;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VisitorEntryCreate &&
      other.siteId == siteId &&
      other.unitId == unitId &&
      other.name == name &&
      other.plate == plate &&
      other.windowFrom == windowFrom &&
      other.windowTo == windowTo;

    @override
    int get hashCode =>
        siteId.hashCode +
        unitId.hashCode +
        name.hashCode +
        (plate == null ? 0 : plate.hashCode) +
        windowFrom.hashCode +
        windowTo.hashCode;

  factory VisitorEntryCreate.fromJson(Map<String, dynamic> json) => _$VisitorEntryCreateFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorEntryCreateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

