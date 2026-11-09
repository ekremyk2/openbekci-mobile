//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recurring_visitor_create.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RecurringVisitorCreate {
  /// Returns a new [RecurringVisitorCreate] instance.
  RecurringVisitorCreate({

    required  this.siteId,

    required  this.unitId,

    required  this.name,

     this.plate,

    required  this.days,

    required  this.start,

    required  this.end,

    required  this.validFrom,

     this.validTo,
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
    
    name: r'days',
    required: true,
    includeIfNull: false,
  )


  final List<int> days;



  @JsonKey(
    
    name: r'start',
    required: true,
    includeIfNull: false,
  )


  final String start;



  @JsonKey(
    
    name: r'end',
    required: true,
    includeIfNull: false,
  )


  final String end;



  @JsonKey(
    
    name: r'valid_from',
    required: true,
    includeIfNull: false,
  )


  final String validFrom;



  @JsonKey(
    
    name: r'valid_to',
    required: false,
    includeIfNull: false,
  )


  final String? validTo;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RecurringVisitorCreate &&
      other.siteId == siteId &&
      other.unitId == unitId &&
      other.name == name &&
      other.plate == plate &&
      other.days == days &&
      other.start == start &&
      other.end == end &&
      other.validFrom == validFrom &&
      other.validTo == validTo;

    @override
    int get hashCode =>
        siteId.hashCode +
        unitId.hashCode +
        name.hashCode +
        (plate == null ? 0 : plate.hashCode) +
        days.hashCode +
        start.hashCode +
        end.hashCode +
        validFrom.hashCode +
        (validTo == null ? 0 : validTo.hashCode);

  factory RecurringVisitorCreate.fromJson(Map<String, dynamic> json) => _$RecurringVisitorCreateFromJson(json);

  Map<String, dynamic> toJson() => _$RecurringVisitorCreateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

