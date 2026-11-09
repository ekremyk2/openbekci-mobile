//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_status.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TicketStatus {
  /// Returns a new [TicketStatus] instance.
  TicketStatus({

    required  this.id,

    required  this.name,

    required  this.semantic,

    required  this.position,

    required  this.key,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



      /// Open enum.
  @JsonKey(
    
    name: r'semantic',
    required: true,
    includeIfNull: false,
  unknownEnumValue: TicketStatusSemanticEnum.unknownDefaultOpenApi,
  )


  final TicketStatusSemanticEnum semantic;



  @JsonKey(
    
    name: r'position',
    required: true,
    includeIfNull: false,
  )


  final int position;



      /// Stable key of the built-in statuses: open, in_progress, done.
  @JsonKey(
    
    name: r'key',
    required: true,
    includeIfNull: true,
  )


  final String? key;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TicketStatus &&
      other.id == id &&
      other.name == name &&
      other.semantic == semantic &&
      other.position == position &&
      other.key == key;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        semantic.hashCode +
        position.hashCode +
        (key == null ? 0 : key.hashCode);

  factory TicketStatus.fromJson(Map<String, dynamic> json) => _$TicketStatusFromJson(json);

  Map<String, dynamic> toJson() => _$TicketStatusToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum TicketStatusSemanticEnum {
@JsonValue(r'open_like')
openLike(r'open_like'),
@JsonValue(r'closed_like')
closedLike(r'closed_like'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const TicketStatusSemanticEnum(this.value);

final String value;

@override
String toString() => value;
}


