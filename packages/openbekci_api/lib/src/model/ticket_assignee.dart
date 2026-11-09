//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_assignee.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TicketAssignee {
  /// Returns a new [TicketAssignee] instance.
  TicketAssignee({

    required  this.kind,

    required  this.personId,

    required  this.vendorId,

    required  this.displayName,
  });

      /// Open enum.
  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  unknownEnumValue: TicketAssigneeKindEnum.unknownDefaultOpenApi,
  )


  final TicketAssigneeKindEnum kind;



  @JsonKey(
    
    name: r'person_id',
    required: true,
    includeIfNull: true,
  )


  final String? personId;



  @JsonKey(
    
    name: r'vendor_id',
    required: true,
    includeIfNull: true,
  )


  final String? vendorId;



  @JsonKey(
    
    name: r'display_name',
    required: true,
    includeIfNull: false,
  )


  final String displayName;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TicketAssignee &&
      other.kind == kind &&
      other.personId == personId &&
      other.vendorId == vendorId &&
      other.displayName == displayName;

    @override
    int get hashCode =>
        kind.hashCode +
        (personId == null ? 0 : personId.hashCode) +
        (vendorId == null ? 0 : vendorId.hashCode) +
        displayName.hashCode;

  factory TicketAssignee.fromJson(Map<String, dynamic> json) => _$TicketAssigneeFromJson(json);

  Map<String, dynamic> toJson() => _$TicketAssigneeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum TicketAssigneeKindEnum {
@JsonValue(r'person')
person(r'person'),
@JsonValue(r'vendor')
vendor(r'vendor'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const TicketAssigneeKindEnum(this.value);

final String value;

@override
String toString() => value;
}


