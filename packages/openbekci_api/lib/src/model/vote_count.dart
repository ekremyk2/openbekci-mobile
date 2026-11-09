//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vote_count.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VoteCount {
  /// Returns a new [VoteCount] instance.
  VoteCount({

    required  this.agendaItemId,

    required  this.yesCount,

    required  this.noCount,

    required  this.abstainCount,

    required  this.yesShare,

    required  this.noShare,

    required  this.abstainShare,

    required  this.recordedBy,

    required  this.recordedAt,

    required  this.outcomeHint,
  });

  @JsonKey(
    
    name: r'agenda_item_id',
    required: true,
    includeIfNull: false,
  )


  final String agendaItemId;



  @JsonKey(
    
    name: r'yes_count',
    required: true,
    includeIfNull: false,
  )


  final int yesCount;



  @JsonKey(
    
    name: r'no_count',
    required: true,
    includeIfNull: false,
  )


  final int noCount;



  @JsonKey(
    
    name: r'abstain_count',
    required: true,
    includeIfNull: false,
  )


  final int abstainCount;



  @JsonKey(
    
    name: r'yes_share',
    required: true,
    includeIfNull: true,
  )


  final num? yesShare;



  @JsonKey(
    
    name: r'no_share',
    required: true,
    includeIfNull: true,
  )


  final num? noShare;



  @JsonKey(
    
    name: r'abstain_share',
    required: true,
    includeIfNull: true,
  )


  final num? abstainShare;



  @JsonKey(
    
    name: r'recorded_by',
    required: true,
    includeIfNull: true,
  )


  final String? recordedBy;



  @JsonKey(
    
    name: r'recorded_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? recordedAt;



      /// Computed from the threshold rule; the decision records the final outcome. Open enum.
  @JsonKey(
    
    name: r'outcome_hint',
    required: true,
    includeIfNull: false,
  unknownEnumValue: VoteCountOutcomeHintEnum.unknownDefaultOpenApi,
  )


  final VoteCountOutcomeHintEnum outcomeHint;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VoteCount &&
      other.agendaItemId == agendaItemId &&
      other.yesCount == yesCount &&
      other.noCount == noCount &&
      other.abstainCount == abstainCount &&
      other.yesShare == yesShare &&
      other.noShare == noShare &&
      other.abstainShare == abstainShare &&
      other.recordedBy == recordedBy &&
      other.recordedAt == recordedAt &&
      other.outcomeHint == outcomeHint;

    @override
    int get hashCode =>
        agendaItemId.hashCode +
        yesCount.hashCode +
        noCount.hashCode +
        abstainCount.hashCode +
        (yesShare == null ? 0 : yesShare.hashCode) +
        (noShare == null ? 0 : noShare.hashCode) +
        (abstainShare == null ? 0 : abstainShare.hashCode) +
        (recordedBy == null ? 0 : recordedBy.hashCode) +
        (recordedAt == null ? 0 : recordedAt.hashCode) +
        outcomeHint.hashCode;

  factory VoteCount.fromJson(Map<String, dynamic> json) => _$VoteCountFromJson(json);

  Map<String, dynamic> toJson() => _$VoteCountToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Computed from the threshold rule; the decision records the final outcome. Open enum.
enum VoteCountOutcomeHintEnum {
@JsonValue(r'accepted')
accepted(r'accepted'),
@JsonValue(r'rejected')
rejected(r'rejected'),
@JsonValue(r'undetermined')
undetermined(r'undetermined'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const VoteCountOutcomeHintEnum(this.value);

final String value;

@override
String toString() => value;
}


