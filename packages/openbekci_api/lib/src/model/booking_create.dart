//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking_create.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BookingCreate {
  /// Returns a new [BookingCreate] instance.
  BookingCreate({

    required  this.facilityId,

    required  this.unitId,

    required  this.start,

    required  this.end,

     this.personId,

     this.debtorKind,
  });

  @JsonKey(
    
    name: r'facility_id',
    required: true,
    includeIfNull: false,
  )


  final String facilityId;



  @JsonKey(
    
    name: r'unit_id',
    required: true,
    includeIfNull: false,
  )


  final String unitId;



  @JsonKey(
    
    name: r'start',
    required: true,
    includeIfNull: false,
  )


  final DateTime start;



  @JsonKey(
    
    name: r'end',
    required: true,
    includeIfNull: false,
  )


  final DateTime end;



      /// Managers may book on behalf of a unit.
  @JsonKey(
    
    name: r'person_id',
    required: false,
    includeIfNull: false,
  )


  final String? personId;



      /// Side charged for the fee.
  @JsonKey(
    
    name: r'debtor_kind',
    required: false,
    includeIfNull: false,
  unknownEnumValue: BookingCreateDebtorKindEnum.unknownDefaultOpenApi,
  )


  final BookingCreateDebtorKindEnum? debtorKind;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BookingCreate &&
      other.facilityId == facilityId &&
      other.unitId == unitId &&
      other.start == start &&
      other.end == end &&
      other.personId == personId &&
      other.debtorKind == debtorKind;

    @override
    int get hashCode =>
        facilityId.hashCode +
        unitId.hashCode +
        start.hashCode +
        end.hashCode +
        personId.hashCode +
        debtorKind.hashCode;

  factory BookingCreate.fromJson(Map<String, dynamic> json) => _$BookingCreateFromJson(json);

  Map<String, dynamic> toJson() => _$BookingCreateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Side charged for the fee.
enum BookingCreateDebtorKindEnum {
@JsonValue(r'owner')
owner(r'owner'),
@JsonValue(r'tenant')
tenant(r'tenant'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const BookingCreateDebtorKindEnum(this.value);

final String value;

@override
String toString() => value;
}


