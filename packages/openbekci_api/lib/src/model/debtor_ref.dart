//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'debtor_ref.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DebtorRef {
  /// Returns a new [DebtorRef] instance.
  DebtorRef({

    required  this.mode,

     this.unitId,

     this.debtorKind,

     this.personId,
  });

  @JsonKey(
    
    name: r'mode',
    required: true,
    includeIfNull: false,
  unknownEnumValue: DebtorRefModeEnum.unknownDefaultOpenApi,
  )


  final DebtorRefModeEnum mode;



  @JsonKey(
    
    name: r'unit_id',
    required: false,
    includeIfNull: false,
  )


  final String? unitId;



  @JsonKey(
    
    name: r'debtor_kind',
    required: false,
    includeIfNull: false,
  unknownEnumValue: DebtorRefDebtorKindEnum.unknownDefaultOpenApi,
  )


  final DebtorRefDebtorKindEnum? debtorKind;



  @JsonKey(
    
    name: r'person_id',
    required: false,
    includeIfNull: false,
  )


  final String? personId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DebtorRef &&
      other.mode == mode &&
      other.unitId == unitId &&
      other.debtorKind == debtorKind &&
      other.personId == personId;

    @override
    int get hashCode =>
        mode.hashCode +
        unitId.hashCode +
        debtorKind.hashCode +
        personId.hashCode;

  factory DebtorRef.fromJson(Map<String, dynamic> json) => _$DebtorRefFromJson(json);

  Map<String, dynamic> toJson() => _$DebtorRefToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum DebtorRefModeEnum {
@JsonValue(r'unit_side')
unitSide(r'unit_side'),
@JsonValue(r'person')
person(r'person'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const DebtorRefModeEnum(this.value);

final String value;

@override
String toString() => value;
}


enum DebtorRefDebtorKindEnum {
@JsonValue(r'owner')
owner(r'owner'),
@JsonValue(r'tenant')
tenant(r'tenant'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const DebtorRefDebtorKindEnum(this.value);

final String value;

@override
String toString() => value;
}


