//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/eligibility_snapshot.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meeting.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Meeting {
  /// Returns a new [Meeting] instance.
  Meeting({

    required  this.id,

    required  this.orgId,

    required  this.siteId,

    required  this.kind,

    required  this.scope,

    required  this.title,

    required  this.scheduledAt,

    required  this.secondCallAt,

    required  this.location,

    required  this.status,

    required  this.eligibilitySnapshot,

    required  this.callLetterDocumentId,

    required  this.minutesDocumentId,

    required  this.calledAt,

    required  this.heldCall,

    required  this.firstCallFailedAt,

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



      /// Open enum.
  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  unknownEnumValue: MeetingKindEnum.unknownDefaultOpenApi,
  )


  final MeetingKindEnum kind;



      /// Only `site` is supported in 0.2; block and council are reserved (G7). Open enum.
  @JsonKey(
    
    name: r'scope',
    required: true,
    includeIfNull: false,
  unknownEnumValue: MeetingScopeEnum.unknownDefaultOpenApi,
  )


  final MeetingScopeEnum scope;



  @JsonKey(
    
    name: r'title',
    required: true,
    includeIfNull: true,
  )


  final String? title;



  @JsonKey(
    
    name: r'scheduled_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime scheduledAt;



  @JsonKey(
    
    name: r'second_call_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime secondCallAt;



  @JsonKey(
    
    name: r'location',
    required: true,
    includeIfNull: false,
  )


  final String location;



      /// Open enum.
  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  unknownEnumValue: MeetingStatusEnum.unknownDefaultOpenApi,
  )


  final MeetingStatusEnum status;



      /// Who could vote and with what weight (G1). A preview taken at `:call`, retaken as of the day the session opens (`:open-first-call`) and fixed from then on. Staff only.
  @JsonKey(
    
    name: r'eligibility_snapshot',
    required: true,
    includeIfNull: true,
  )


  final EligibilitySnapshot? eligibilitySnapshot;



  @JsonKey(
    
    name: r'call_letter_document_id',
    required: true,
    includeIfNull: true,
  )


  final String? callLetterDocumentId;



  @JsonKey(
    
    name: r'minutes_document_id',
    required: true,
    includeIfNull: true,
  )


  final String? minutesDocumentId;



  @JsonKey(
    
    name: r'called_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? calledAt;



      /// The sitting that actually took place, set by `:open-first-call` and `:open-second-call` (never inferred from the clock); null until the session opens. Open enum.
  @JsonKey(
    
    name: r'held_call',
    required: true,
    includeIfNull: true,
  unknownEnumValue: MeetingHeldCallEnum.unknownDefaultOpenApi,
  )


  final MeetingHeldCallEnum? heldCall;



      /// When the first call was found without quorum and the second call opened.
  @JsonKey(
    
    name: r'first_call_failed_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? firstCallFailedAt;



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
    bool operator ==(Object other) => identical(this, other) || other is Meeting &&
      other.id == id &&
      other.orgId == orgId &&
      other.siteId == siteId &&
      other.kind == kind &&
      other.scope == scope &&
      other.title == title &&
      other.scheduledAt == scheduledAt &&
      other.secondCallAt == secondCallAt &&
      other.location == location &&
      other.status == status &&
      other.eligibilitySnapshot == eligibilitySnapshot &&
      other.callLetterDocumentId == callLetterDocumentId &&
      other.minutesDocumentId == minutesDocumentId &&
      other.calledAt == calledAt &&
      other.heldCall == heldCall &&
      other.firstCallFailedAt == firstCallFailedAt &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.version == version;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        siteId.hashCode +
        kind.hashCode +
        scope.hashCode +
        (title == null ? 0 : title.hashCode) +
        scheduledAt.hashCode +
        secondCallAt.hashCode +
        location.hashCode +
        status.hashCode +
        (eligibilitySnapshot == null ? 0 : eligibilitySnapshot.hashCode) +
        (callLetterDocumentId == null ? 0 : callLetterDocumentId.hashCode) +
        (minutesDocumentId == null ? 0 : minutesDocumentId.hashCode) +
        (calledAt == null ? 0 : calledAt.hashCode) +
        (heldCall == null ? 0 : heldCall.hashCode) +
        (firstCallFailedAt == null ? 0 : firstCallFailedAt.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode +
        version.hashCode;

  factory Meeting.fromJson(Map<String, dynamic> json) => _$MeetingFromJson(json);

  Map<String, dynamic> toJson() => _$MeetingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum MeetingKindEnum {
@JsonValue(r'general_assembly')
generalAssembly(r'general_assembly'),
@JsonValue(r'extraordinary')
extraordinary(r'extraordinary'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const MeetingKindEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Only `site` is supported in 0.2; block and council are reserved (G7). Open enum.
enum MeetingScopeEnum {
@JsonValue(r'site')
site(r'site'),
@JsonValue(r'block')
block(r'block'),
@JsonValue(r'council')
council(r'council'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const MeetingScopeEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Open enum.
enum MeetingStatusEnum {
@JsonValue(r'draft')
draft(r'draft'),
@JsonValue(r'called')
called(r'called'),
@JsonValue(r'in_session')
inSession(r'in_session'),
@JsonValue(r'closed')
closed(r'closed'),
@JsonValue(r'cancelled')
cancelled(r'cancelled'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const MeetingStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


/// The sitting that actually took place, set by `:open-first-call` and `:open-second-call` (never inferred from the clock); null until the session opens. Open enum.
enum MeetingHeldCallEnum {
@JsonValue(r'first')
first(r'first'),
@JsonValue(r'second')
second(r'second'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const MeetingHeldCallEnum(this.value);

final String value;

@override
String toString() => value;
}


