//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'effective_debtor.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class EffectiveDebtor {
  /// Returns a new [EffectiveDebtor] instance.
  EffectiveDebtor({

    required  this.debtorKind,

    required  this.personId,

    required  this.displayName,

    required  this.source_,
  });

      /// Open enum.
  @JsonKey(
    
    name: r'debtor_kind',
    required: true,
    includeIfNull: false,
  unknownEnumValue: EffectiveDebtorDebtorKindEnum.unknownDefaultOpenApi,
  )


  final EffectiveDebtorDebtorKindEnum debtorKind;



      /// The person on the due date; null when the side is vacant.
  @JsonKey(
    
    name: r'person_id',
    required: true,
    includeIfNull: true,
  )


  final String? personId;



  @JsonKey(
    
    name: r'display_name',
    required: true,
    includeIfNull: true,
  )


  final String? displayName;



      /// Where the decision came from. Open enum.
  @JsonKey(
    
    name: r'source',
    required: true,
    includeIfNull: false,
  unknownEnumValue: EffectiveDebtorSource_Enum.unknownDefaultOpenApi,
  )


  final EffectiveDebtorSource_Enum source_;





    @override
    bool operator ==(Object other) => identical(this, other) || other is EffectiveDebtor &&
      other.debtorKind == debtorKind &&
      other.personId == personId &&
      other.displayName == displayName &&
      other.source_ == source_;

    @override
    int get hashCode =>
        debtorKind.hashCode +
        (personId == null ? 0 : personId.hashCode) +
        (displayName == null ? 0 : displayName.hashCode) +
        source_.hashCode;

  factory EffectiveDebtor.fromJson(Map<String, dynamic> json) => _$EffectiveDebtorFromJson(json);

  Map<String, dynamic> toJson() => _$EffectiveDebtorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum EffectiveDebtorDebtorKindEnum {
@JsonValue(r'owner')
owner(r'owner'),
@JsonValue(r'tenant')
tenant(r'tenant'),
@JsonValue(r'person')
person(r'person'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const EffectiveDebtorDebtorKindEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Where the decision came from. Open enum.
enum EffectiveDebtorSource_Enum {
@JsonValue(r'charge')
charge(r'charge'),
@JsonValue(r'unit_override')
unitOverride(r'unit_override'),
@JsonValue(r'plan_default')
planDefault(r'plan_default'),
@JsonValue(r'carried')
carried(r'carried'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const EffectiveDebtorSource_Enum(this.value);

final String value;

@override
String toString() => value;
}


