//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/ticket_status_change_changed_by.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_status_change.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TicketStatusChange {
  /// Returns a new [TicketStatusChange] instance.
  TicketStatusChange({

    required  this.id,

    required  this.orgId,

    required  this.ticketId,

    required  this.fromStatusId,

    required  this.fromStatusName,

    required  this.toStatusId,

    required  this.toStatusName,

    required  this.changedBy,

    required  this.comment,

    required  this.at,

    required  this.createdAt,

    required  this.updatedAt,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'org_id',
    required: true,
    includeIfNull: false,
  )


  final String orgId;



  @JsonKey(
    
    name: r'ticket_id',
    required: true,
    includeIfNull: false,
  )


  final String ticketId;



  @JsonKey(
    
    name: r'from_status_id',
    required: true,
    includeIfNull: true,
  )


  final String? fromStatusId;



      /// Name of the status at the time of reading; statuses removed from the workflow keep their name.
  @JsonKey(
    
    name: r'from_status_name',
    required: true,
    includeIfNull: true,
  )


  final String? fromStatusName;



  @JsonKey(
    
    name: r'to_status_id',
    required: true,
    includeIfNull: false,
  )


  final String toStatusId;



  @JsonKey(
    
    name: r'to_status_name',
    required: true,
    includeIfNull: false,
  )


  final String toStatusName;



  @JsonKey(
    
    name: r'changed_by',
    required: true,
    includeIfNull: true,
  )


  final TicketStatusChangeChangedBy? changedBy;



      /// The comment given with a transition; an internal one is null for people who may not read internal notes.
  @JsonKey(
    
    name: r'comment',
    required: true,
    includeIfNull: true,
  )


  final String? comment;



  @JsonKey(
    
    name: r'at',
    required: true,
    includeIfNull: false,
  )


  final DateTime at;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'updated_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime updatedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TicketStatusChange &&
      other.id == id &&
      other.orgId == orgId &&
      other.ticketId == ticketId &&
      other.fromStatusId == fromStatusId &&
      other.fromStatusName == fromStatusName &&
      other.toStatusId == toStatusId &&
      other.toStatusName == toStatusName &&
      other.changedBy == changedBy &&
      other.comment == comment &&
      other.at == at &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        ticketId.hashCode +
        (fromStatusId == null ? 0 : fromStatusId.hashCode) +
        (fromStatusName == null ? 0 : fromStatusName.hashCode) +
        toStatusId.hashCode +
        toStatusName.hashCode +
        (changedBy == null ? 0 : changedBy.hashCode) +
        (comment == null ? 0 : comment.hashCode) +
        at.hashCode +
        createdAt.hashCode +
        updatedAt.hashCode;

  factory TicketStatusChange.fromJson(Map<String, dynamic> json) => _$TicketStatusChangeFromJson(json);

  Map<String, dynamic> toJson() => _$TicketStatusChangeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

