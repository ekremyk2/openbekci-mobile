//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/ticket_status.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_workflow.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TicketWorkflow {
  /// Returns a new [TicketWorkflow] instance.
  TicketWorkflow({

    required  this.siteId,

    required  this.statuses,

    required  this.isDefault,

    required  this.version,
  });

  @JsonKey(
    
    name: r'site_id',
    required: true,
    includeIfNull: false,
  )


  final String siteId;



  @JsonKey(
    
    name: r'statuses',
    required: true,
    includeIfNull: false,
  )


  final List<TicketStatus> statuses;



      /// The site still uses the default open, in progress, done flow.
  @JsonKey(
    
    name: r'is_default',
    required: true,
    includeIfNull: false,
  )


  final bool isDefault;



  @JsonKey(
    
    name: r'version',
    required: true,
    includeIfNull: false,
  )


  final int version;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TicketWorkflow &&
      other.siteId == siteId &&
      other.statuses == statuses &&
      other.isDefault == isDefault &&
      other.version == version;

    @override
    int get hashCode =>
        siteId.hashCode +
        statuses.hashCode +
        isDefault.hashCode +
        version.hashCode;

  factory TicketWorkflow.fromJson(Map<String, dynamic> json) => _$TicketWorkflowFromJson(json);

  Map<String, dynamic> toJson() => _$TicketWorkflowToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

