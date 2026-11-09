//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/code_label.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'codes.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Codes {
  /// Returns a new [Codes] instance.
  Codes({

    required  this.locale,

    required  this.enums,

    required  this.errors,

    required  this.ticketStatuses,
  });

  @JsonKey(
    
    name: r'locale',
    required: true,
    includeIfNull: false,
  )


  final String locale;



      /// Labels per open enum, keyed by enum name (for example `charge_type`, `occupancy_kind`), pack labels included.
  @JsonKey(
    
    name: r'enums',
    required: true,
    includeIfNull: false,
  )


  final Map<String, List<CodeLabel>> enums;



      /// Problem codes.
  @JsonKey(
    
    name: r'errors',
    required: true,
    includeIfNull: false,
  )


  final List<CodeLabel> errors;



      /// Site-defined ticket statuses when `site_id` is given.
  @JsonKey(
    
    name: r'ticket_statuses',
    required: true,
    includeIfNull: false,
  )


  final List<CodeLabel> ticketStatuses;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Codes &&
      other.locale == locale &&
      other.enums == enums &&
      other.errors == errors &&
      other.ticketStatuses == ticketStatuses;

    @override
    int get hashCode =>
        locale.hashCode +
        enums.hashCode +
        errors.hashCode +
        ticketStatuses.hashCode;

  factory Codes.fromJson(Map<String, dynamic> json) => _$CodesFromJson(json);

  Map<String, dynamic> toJson() => _$CodesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

