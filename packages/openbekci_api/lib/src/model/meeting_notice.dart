//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meeting_notice.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MeetingNotice {
  /// Returns a new [MeetingNotice] instance.
  MeetingNotice({

    required  this.id,

    required  this.orgId,

    required  this.meetingId,

    required  this.personId,

    required  this.personDisplayName,

    required  this.phase,

    required  this.method,

    required  this.status,

    required  this.sentAt,

    required  this.trackingNo,

    required  this.proofFileId,

    required  this.note,

     this.late_,

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
    
    name: r'meeting_id',
    required: true,
    includeIfNull: false,
  )


  final String meetingId;



  @JsonKey(
    
    name: r'person_id',
    required: true,
    includeIfNull: false,
  )


  final String personId;



  @JsonKey(
    
    name: r'person_display_name',
    required: true,
    includeIfNull: false,
  )


  final String personDisplayName;



      /// `decisions`: the post-meeting notification of absent owners. Open enum.
  @JsonKey(
    
    name: r'phase',
    required: true,
    includeIfNull: false,
  unknownEnumValue: MeetingNoticePhaseEnum.unknownDefaultOpenApi,
  )


  final MeetingNoticePhaseEnum phase;



      /// Open enum.
  @JsonKey(
    
    name: r'method',
    required: true,
    includeIfNull: true,
  unknownEnumValue: MeetingNoticeMethodEnum.unknownDefaultOpenApi,
  )


  final MeetingNoticeMethodEnum? method;



      /// Open enum.
  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  unknownEnumValue: MeetingNoticeStatusEnum.unknownDefaultOpenApi,
  )


  final MeetingNoticeStatusEnum status;



  @JsonKey(
    
    name: r'sent_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? sentAt;



  @JsonKey(
    
    name: r'tracking_no',
    required: true,
    includeIfNull: true,
  )


  final String? trackingNo;



      /// A file of the organization (the scanned receipt or signature page); checked when recorded.
  @JsonKey(
    
    name: r'proof_file_id',
    required: true,
    includeIfNull: true,
  )


  final String? proofFileId;



  @JsonKey(
    
    name: r'note',
    required: true,
    includeIfNull: true,
  )


  final String? note;



      /// The call reached this owner less than `call_min_days` before the meeting (computed when recorded).
  @JsonKey(
    
    name: r'late',
    required: false,
    includeIfNull: false,
  )


  final bool? late_;



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
    bool operator ==(Object other) => identical(this, other) || other is MeetingNotice &&
      other.id == id &&
      other.orgId == orgId &&
      other.meetingId == meetingId &&
      other.personId == personId &&
      other.personDisplayName == personDisplayName &&
      other.phase == phase &&
      other.method == method &&
      other.status == status &&
      other.sentAt == sentAt &&
      other.trackingNo == trackingNo &&
      other.proofFileId == proofFileId &&
      other.note == note &&
      other.late_ == late_ &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        meetingId.hashCode +
        personId.hashCode +
        personDisplayName.hashCode +
        phase.hashCode +
        (method == null ? 0 : method.hashCode) +
        status.hashCode +
        (sentAt == null ? 0 : sentAt.hashCode) +
        (trackingNo == null ? 0 : trackingNo.hashCode) +
        (proofFileId == null ? 0 : proofFileId.hashCode) +
        (note == null ? 0 : note.hashCode) +
        late_.hashCode +
        createdAt.hashCode +
        updatedAt.hashCode;

  factory MeetingNotice.fromJson(Map<String, dynamic> json) => _$MeetingNoticeFromJson(json);

  Map<String, dynamic> toJson() => _$MeetingNoticeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// `decisions`: the post-meeting notification of absent owners. Open enum.
enum MeetingNoticePhaseEnum {
@JsonValue(r'call')
call(r'call'),
@JsonValue(r'decisions')
decisions(r'decisions'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const MeetingNoticePhaseEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Open enum.
enum MeetingNoticeMethodEnum {
@JsonValue(r'registered_mail')
registeredMail(r'registered_mail'),
@JsonValue(r'signed')
signed(r'signed'),
@JsonValue(r'email')
email(r'email'),
@JsonValue(r'sms')
sms(r'sms'),
@JsonValue(r'other')
other(r'other'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const MeetingNoticeMethodEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Open enum.
enum MeetingNoticeStatusEnum {
@JsonValue(r'pending')
pending(r'pending'),
@JsonValue(r'recorded')
recorded(r'recorded'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const MeetingNoticeStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


