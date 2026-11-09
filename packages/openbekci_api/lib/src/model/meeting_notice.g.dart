// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_notice.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MeetingNoticeCWProxy {
  MeetingNotice id(String id);

  MeetingNotice orgId(String orgId);

  MeetingNotice meetingId(String meetingId);

  MeetingNotice personId(String personId);

  MeetingNotice personDisplayName(String personDisplayName);

  MeetingNotice phase(MeetingNoticePhaseEnum phase);

  MeetingNotice method(MeetingNoticeMethodEnum? method);

  MeetingNotice status(MeetingNoticeStatusEnum status);

  MeetingNotice sentAt(DateTime? sentAt);

  MeetingNotice trackingNo(String? trackingNo);

  MeetingNotice proofFileId(String? proofFileId);

  MeetingNotice note(String? note);

  MeetingNotice late_(bool? late_);

  MeetingNotice createdAt(DateTime createdAt);

  MeetingNotice updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MeetingNotice(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MeetingNotice(...).copyWith(id: 12, name: "My name")
  /// ````
  MeetingNotice call({
    String id,
    String orgId,
    String meetingId,
    String personId,
    String personDisplayName,
    MeetingNoticePhaseEnum phase,
    MeetingNoticeMethodEnum? method,
    MeetingNoticeStatusEnum status,
    DateTime? sentAt,
    String? trackingNo,
    String? proofFileId,
    String? note,
    bool? late_,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMeetingNotice.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMeetingNotice.copyWith.fieldName(...)`
class _$MeetingNoticeCWProxyImpl implements _$MeetingNoticeCWProxy {
  const _$MeetingNoticeCWProxyImpl(this._value);

  final MeetingNotice _value;

  @override
  MeetingNotice id(String id) => this(id: id);

  @override
  MeetingNotice orgId(String orgId) => this(orgId: orgId);

  @override
  MeetingNotice meetingId(String meetingId) => this(meetingId: meetingId);

  @override
  MeetingNotice personId(String personId) => this(personId: personId);

  @override
  MeetingNotice personDisplayName(String personDisplayName) =>
      this(personDisplayName: personDisplayName);

  @override
  MeetingNotice phase(MeetingNoticePhaseEnum phase) => this(phase: phase);

  @override
  MeetingNotice method(MeetingNoticeMethodEnum? method) => this(method: method);

  @override
  MeetingNotice status(MeetingNoticeStatusEnum status) => this(status: status);

  @override
  MeetingNotice sentAt(DateTime? sentAt) => this(sentAt: sentAt);

  @override
  MeetingNotice trackingNo(String? trackingNo) => this(trackingNo: trackingNo);

  @override
  MeetingNotice proofFileId(String? proofFileId) =>
      this(proofFileId: proofFileId);

  @override
  MeetingNotice note(String? note) => this(note: note);

  @override
  MeetingNotice late_(bool? late_) => this(late_: late_);

  @override
  MeetingNotice createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  MeetingNotice updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MeetingNotice(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MeetingNotice(...).copyWith(id: 12, name: "My name")
  /// ````
  MeetingNotice call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? meetingId = const $CopyWithPlaceholder(),
    Object? personId = const $CopyWithPlaceholder(),
    Object? personDisplayName = const $CopyWithPlaceholder(),
    Object? phase = const $CopyWithPlaceholder(),
    Object? method = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? sentAt = const $CopyWithPlaceholder(),
    Object? trackingNo = const $CopyWithPlaceholder(),
    Object? proofFileId = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
    Object? late_ = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return MeetingNotice(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      orgId: orgId == const $CopyWithPlaceholder()
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String,
      meetingId: meetingId == const $CopyWithPlaceholder()
          ? _value.meetingId
          // ignore: cast_nullable_to_non_nullable
          : meetingId as String,
      personId: personId == const $CopyWithPlaceholder()
          ? _value.personId
          // ignore: cast_nullable_to_non_nullable
          : personId as String,
      personDisplayName: personDisplayName == const $CopyWithPlaceholder()
          ? _value.personDisplayName
          // ignore: cast_nullable_to_non_nullable
          : personDisplayName as String,
      phase: phase == const $CopyWithPlaceholder()
          ? _value.phase
          // ignore: cast_nullable_to_non_nullable
          : phase as MeetingNoticePhaseEnum,
      method: method == const $CopyWithPlaceholder()
          ? _value.method
          // ignore: cast_nullable_to_non_nullable
          : method as MeetingNoticeMethodEnum?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as MeetingNoticeStatusEnum,
      sentAt: sentAt == const $CopyWithPlaceholder()
          ? _value.sentAt
          // ignore: cast_nullable_to_non_nullable
          : sentAt as DateTime?,
      trackingNo: trackingNo == const $CopyWithPlaceholder()
          ? _value.trackingNo
          // ignore: cast_nullable_to_non_nullable
          : trackingNo as String?,
      proofFileId: proofFileId == const $CopyWithPlaceholder()
          ? _value.proofFileId
          // ignore: cast_nullable_to_non_nullable
          : proofFileId as String?,
      note: note == const $CopyWithPlaceholder()
          ? _value.note
          // ignore: cast_nullable_to_non_nullable
          : note as String?,
      late_: late_ == const $CopyWithPlaceholder()
          ? _value.late_
          // ignore: cast_nullable_to_non_nullable
          : late_ as bool?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
    );
  }
}

extension $MeetingNoticeCopyWith on MeetingNotice {
  /// Returns a callable class that can be used as follows: `instanceOfMeetingNotice.copyWith(...)` or like so:`instanceOfMeetingNotice.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MeetingNoticeCWProxy get copyWith => _$MeetingNoticeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetingNotice _$MeetingNoticeFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MeetingNotice',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'org_id',
            'meeting_id',
            'person_id',
            'person_display_name',
            'phase',
            'method',
            'status',
            'sent_at',
            'tracking_no',
            'proof_file_id',
            'note',
            'created_at',
            'updated_at',
          ],
        );
        final val = MeetingNotice(
          id: $checkedConvert('id', (v) => v as String),
          orgId: $checkedConvert('org_id', (v) => v as String),
          meetingId: $checkedConvert('meeting_id', (v) => v as String),
          personId: $checkedConvert('person_id', (v) => v as String),
          personDisplayName: $checkedConvert(
            'person_display_name',
            (v) => v as String,
          ),
          phase: $checkedConvert(
            'phase',
            (v) => $enumDecode(
              _$MeetingNoticePhaseEnumEnumMap,
              v,
              unknownValue: MeetingNoticePhaseEnum.unknownDefaultOpenApi,
            ),
          ),
          method: $checkedConvert(
            'method',
            (v) => $enumDecodeNullable(
              _$MeetingNoticeMethodEnumEnumMap,
              v,
              unknownValue: MeetingNoticeMethodEnum.unknownDefaultOpenApi,
            ),
          ),
          status: $checkedConvert(
            'status',
            (v) => $enumDecode(
              _$MeetingNoticeStatusEnumEnumMap,
              v,
              unknownValue: MeetingNoticeStatusEnum.unknownDefaultOpenApi,
            ),
          ),
          sentAt: $checkedConvert(
            'sent_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          trackingNo: $checkedConvert('tracking_no', (v) => v as String?),
          proofFileId: $checkedConvert('proof_file_id', (v) => v as String?),
          note: $checkedConvert('note', (v) => v as String?),
          late_: $checkedConvert('late', (v) => v as bool?),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          updatedAt: $checkedConvert(
            'updated_at',
            (v) => DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'orgId': 'org_id',
        'meetingId': 'meeting_id',
        'personId': 'person_id',
        'personDisplayName': 'person_display_name',
        'sentAt': 'sent_at',
        'trackingNo': 'tracking_no',
        'proofFileId': 'proof_file_id',
        'late_': 'late',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$MeetingNoticeToJson(MeetingNotice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'org_id': instance.orgId,
      'meeting_id': instance.meetingId,
      'person_id': instance.personId,
      'person_display_name': instance.personDisplayName,
      'phase': _$MeetingNoticePhaseEnumEnumMap[instance.phase]!,
      'method': _$MeetingNoticeMethodEnumEnumMap[instance.method],
      'status': _$MeetingNoticeStatusEnumEnumMap[instance.status]!,
      'sent_at': instance.sentAt?.toIso8601String(),
      'tracking_no': instance.trackingNo,
      'proof_file_id': instance.proofFileId,
      'note': instance.note,
      'late': ?instance.late_,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$MeetingNoticePhaseEnumEnumMap = {
  MeetingNoticePhaseEnum.call: 'call',
  MeetingNoticePhaseEnum.decisions: 'decisions',
  MeetingNoticePhaseEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};

const _$MeetingNoticeMethodEnumEnumMap = {
  MeetingNoticeMethodEnum.registeredMail: 'registered_mail',
  MeetingNoticeMethodEnum.signed: 'signed',
  MeetingNoticeMethodEnum.email: 'email',
  MeetingNoticeMethodEnum.sms: 'sms',
  MeetingNoticeMethodEnum.other: 'other',
  MeetingNoticeMethodEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};

const _$MeetingNoticeStatusEnumEnumMap = {
  MeetingNoticeStatusEnum.pending: 'pending',
  MeetingNoticeStatusEnum.recorded: 'recorded',
  MeetingNoticeStatusEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
