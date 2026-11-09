//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/vote_count.dart';
import 'package:openbekci_api/src/model/decision_effect.dart';
import 'package:openbekci_api/src/model/dissent.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'decision.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Decision {
  /// Returns a new [Decision] instance.
  Decision({

    required  this.id,

    required  this.orgId,

    required  this.siteId,

    required  this.meetingId,

    required  this.agendaItemId,

    required  this.sequenceNo,

    required  this.year,

    required  this.text,

    required  this.outcome,

    required  this.voteCount,

    required  this.dissents,

     this.outcomeOverrideReason,

    required  this.concernsResidents,

    required  this.notifiedAt,

    required  this.effect,

    required  this.createdAt,

    required  this.updatedAt,

    required  this.version,
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
    
    name: r'site_id',
    required: true,
    includeIfNull: false,
  )


  final String siteId;



  @JsonKey(
    
    name: r'meeting_id',
    required: true,
    includeIfNull: false,
  )


  final String meetingId;



  @JsonKey(
    
    name: r'agenda_item_id',
    required: true,
    includeIfNull: true,
  )


  final String? agendaItemId;



      /// Gap-free per site per year, for transcription into the notarized karar defteri.
  @JsonKey(
    
    name: r'sequence_no',
    required: true,
    includeIfNull: false,
  )


  final int sequenceNo;



  @JsonKey(
    
    name: r'year',
    required: true,
    includeIfNull: false,
  )


  final int year;



  @JsonKey(
    
    name: r'text',
    required: true,
    includeIfNull: false,
  )


  final String text;



      /// Open enum.
  @JsonKey(
    
    name: r'outcome',
    required: true,
    includeIfNull: false,
  unknownEnumValue: DecisionOutcomeEnum.unknownDefaultOpenApi,
  )


  final DecisionOutcomeEnum outcome;



  @JsonKey(
    
    name: r'vote_count',
    required: true,
    includeIfNull: true,
  )


  final VoteCount? voteCount;



  @JsonKey(
    
    name: r'dissents',
    required: true,
    includeIfNull: false,
  )


  final List<Dissent> dissents;



      /// Set when the outcome was recorded against, or without, the threshold evaluation of the counts (`outcome_override` on create); audited.
  @JsonKey(
    
    name: r'outcome_override_reason',
    required: false,
    includeIfNull: false,
  )


  final String? outcomeOverrideReason;



      /// Tenants see only decisions marked this way.
  @JsonKey(
    
    name: r'concerns_residents',
    required: true,
    includeIfNull: false,
  )


  final bool concernsResidents;



  @JsonKey(
    
    name: r'notified_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? notifiedAt;



  @JsonKey(
    
    name: r'effect',
    required: true,
    includeIfNull: true,
  )


  final DecisionEffect? effect;



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



      /// Optimistic-lock counter; send it back as If-Match on updates.
  @JsonKey(
    
    name: r'version',
    required: true,
    includeIfNull: false,
  )


  final int version;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Decision &&
      other.id == id &&
      other.orgId == orgId &&
      other.siteId == siteId &&
      other.meetingId == meetingId &&
      other.agendaItemId == agendaItemId &&
      other.sequenceNo == sequenceNo &&
      other.year == year &&
      other.text == text &&
      other.outcome == outcome &&
      other.voteCount == voteCount &&
      other.dissents == dissents &&
      other.outcomeOverrideReason == outcomeOverrideReason &&
      other.concernsResidents == concernsResidents &&
      other.notifiedAt == notifiedAt &&
      other.effect == effect &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.version == version;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        siteId.hashCode +
        meetingId.hashCode +
        (agendaItemId == null ? 0 : agendaItemId.hashCode) +
        sequenceNo.hashCode +
        year.hashCode +
        text.hashCode +
        outcome.hashCode +
        (voteCount == null ? 0 : voteCount.hashCode) +
        dissents.hashCode +
        (outcomeOverrideReason == null ? 0 : outcomeOverrideReason.hashCode) +
        concernsResidents.hashCode +
        (notifiedAt == null ? 0 : notifiedAt.hashCode) +
        (effect == null ? 0 : effect.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode +
        version.hashCode;

  factory Decision.fromJson(Map<String, dynamic> json) => _$DecisionFromJson(json);

  Map<String, dynamic> toJson() => _$DecisionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum DecisionOutcomeEnum {
@JsonValue(r'accepted')
accepted(r'accepted'),
@JsonValue(r'rejected')
rejected(r'rejected'),
@JsonValue(r'no_vote')
noVote(r'no_vote'),
@JsonValue(r'noted')
noted(r'noted'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const DecisionOutcomeEnum(this.value);

final String value;

@override
String toString() => value;
}


