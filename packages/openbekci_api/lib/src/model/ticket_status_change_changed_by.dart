//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_status_change_changed_by.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TicketStatusChangeChangedBy {
  /// Returns a new [TicketStatusChangeChangedBy] instance.
  TicketStatusChangeChangedBy({

    required  this.id,

    required  this.displayName,
  });

      /// The user id.
  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'display_name',
    required: true,
    includeIfNull: false,
  )


  final String displayName;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TicketStatusChangeChangedBy &&
      other.id == id &&
      other.displayName == displayName;

    @override
    int get hashCode =>
        id.hashCode +
        displayName.hashCode;

  factory TicketStatusChangeChangedBy.fromJson(Map<String, dynamic> json) => _$TicketStatusChangeChangedByFromJson(json);

  Map<String, dynamic> toJson() => _$TicketStatusChangeChangedByToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

