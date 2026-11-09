// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MeetingCWProxy {
  Meeting id(String id);

  Meeting orgId(String orgId);

  Meeting siteId(String siteId);

  Meeting kind(MeetingKindEnum kind);

  Meeting scope(MeetingScopeEnum scope);

  Meeting title(String? title);

  Meeting scheduledAt(DateTime scheduledAt);

  Meeting secondCallAt(DateTime secondCallAt);

  Meeting location(String location);

  Meeting status(MeetingStatusEnum status);

  Meeting eligibilitySnapshot(EligibilitySnapshot? eligibilitySnapshot);

  Meeting callLetterDocumentId(String? callLetterDocumentId);

  Meeting minutesDocumentId(String? minutesDocumentId);

  Meeting calledAt(DateTime? calledAt);

  Meeting heldCall(MeetingHeldCallEnum? heldCall);

  Meeting firstCallFailedAt(DateTime? firstCallFailedAt);

  Meeting createdAt(DateTime createdAt);

  Meeting updatedAt(DateTime updatedAt);

  Meeting version(int version);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Meeting(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Meeting(...).copyWith(id: 12, name: "My name")
  /// ````
  Meeting call({
    String id,
    String orgId,
    String siteId,
    MeetingKindEnum kind,
    MeetingScopeEnum scope,
    String? title,
    DateTime scheduledAt,
    DateTime secondCallAt,
    String location,
    MeetingStatusEnum status,
    EligibilitySnapshot? eligibilitySnapshot,
    String? callLetterDocumentId,
    String? minutesDocumentId,
    DateTime? calledAt,
    MeetingHeldCallEnum? heldCall,
    DateTime? firstCallFailedAt,
    DateTime createdAt,
    DateTime updatedAt,
    int version,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMeeting.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMeeting.copyWith.fieldName(...)`
class _$MeetingCWProxyImpl implements _$MeetingCWProxy {
  const _$MeetingCWProxyImpl(this._value);

  final Meeting _value;

  @override
  Meeting id(String id) => this(id: id);

  @override
  Meeting orgId(String orgId) => this(orgId: orgId);

  @override
  Meeting siteId(String siteId) => this(siteId: siteId);

  @override
  Meeting kind(MeetingKindEnum kind) => this(kind: kind);

  @override
  Meeting scope(MeetingScopeEnum scope) => this(scope: scope);

  @override
  Meeting title(String? title) => this(title: title);

  @override
  Meeting scheduledAt(DateTime scheduledAt) => this(scheduledAt: scheduledAt);

  @override
  Meeting secondCallAt(DateTime secondCallAt) =>
      this(secondCallAt: secondCallAt);

  @override
  Meeting location(String location) => this(location: location);

  @override
  Meeting status(MeetingStatusEnum status) => this(status: status);

  @override
  Meeting eligibilitySnapshot(EligibilitySnapshot? eligibilitySnapshot) =>
      this(eligibilitySnapshot: eligibilitySnapshot);

  @override
  Meeting callLetterDocumentId(String? callLetterDocumentId) =>
      this(callLetterDocumentId: callLetterDocumentId);

  @override
  Meeting minutesDocumentId(String? minutesDocumentId) =>
      this(minutesDocumentId: minutesDocumentId);

  @override
  Meeting calledAt(DateTime? calledAt) => this(calledAt: calledAt);

  @override
  Meeting heldCall(MeetingHeldCallEnum? heldCall) => this(heldCall: heldCall);

  @override
  Meeting firstCallFailedAt(DateTime? firstCallFailedAt) =>
      this(firstCallFailedAt: firstCallFailedAt);

  @override
  Meeting createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Meeting updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  Meeting version(int version) => this(version: version);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Meeting(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Meeting(...).copyWith(id: 12, name: "My name")
  /// ````
  Meeting call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? siteId = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
    Object? scope = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? scheduledAt = const $CopyWithPlaceholder(),
    Object? secondCallAt = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? eligibilitySnapshot = const $CopyWithPlaceholder(),
    Object? callLetterDocumentId = const $CopyWithPlaceholder(),
    Object? minutesDocumentId = const $CopyWithPlaceholder(),
    Object? calledAt = const $CopyWithPlaceholder(),
    Object? heldCall = const $CopyWithPlaceholder(),
    Object? firstCallFailedAt = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
  }) {
    return Meeting(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      orgId: orgId == const $CopyWithPlaceholder()
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String,
      siteId: siteId == const $CopyWithPlaceholder()
          ? _value.siteId
          // ignore: cast_nullable_to_non_nullable
          : siteId as String,
      kind: kind == const $CopyWithPlaceholder()
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as MeetingKindEnum,
      scope: scope == const $CopyWithPlaceholder()
          ? _value.scope
          // ignore: cast_nullable_to_non_nullable
          : scope as MeetingScopeEnum,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      scheduledAt: scheduledAt == const $CopyWithPlaceholder()
          ? _value.scheduledAt
          // ignore: cast_nullable_to_non_nullable
          : scheduledAt as DateTime,
      secondCallAt: secondCallAt == const $CopyWithPlaceholder()
          ? _value.secondCallAt
          // ignore: cast_nullable_to_non_nullable
          : secondCallAt as DateTime,
      location: location == const $CopyWithPlaceholder()
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as String,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as MeetingStatusEnum,
      eligibilitySnapshot: eligibilitySnapshot == const $CopyWithPlaceholder()
          ? _value.eligibilitySnapshot
          // ignore: cast_nullable_to_non_nullable
          : eligibilitySnapshot as EligibilitySnapshot?,
      callLetterDocumentId: callLetterDocumentId == const $CopyWithPlaceholder()
          ? _value.callLetterDocumentId
          // ignore: cast_nullable_to_non_nullable
          : callLetterDocumentId as String?,
      minutesDocumentId: minutesDocumentId == const $CopyWithPlaceholder()
          ? _value.minutesDocumentId
          // ignore: cast_nullable_to_non_nullable
          : minutesDocumentId as String?,
      calledAt: calledAt == const $CopyWithPlaceholder()
          ? _value.calledAt
          // ignore: cast_nullable_to_non_nullable
          : calledAt as DateTime?,
      heldCall: heldCall == const $CopyWithPlaceholder()
          ? _value.heldCall
          // ignore: cast_nullable_to_non_nullable
          : heldCall as MeetingHeldCallEnum?,
      firstCallFailedAt: firstCallFailedAt == const $CopyWithPlaceholder()
          ? _value.firstCallFailedAt
          // ignore: cast_nullable_to_non_nullable
          : firstCallFailedAt as DateTime?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
      version: version == const $CopyWithPlaceholder()
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as int,
    );
  }
}

extension $MeetingCopyWith on Meeting {
  /// Returns a callable class that can be used as follows: `instanceOfMeeting.copyWith(...)` or like so:`instanceOfMeeting.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MeetingCWProxy get copyWith => _$MeetingCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meeting _$MeetingFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Meeting',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'org_id',
        'site_id',
        'kind',
        'scope',
        'title',
        'scheduled_at',
        'second_call_at',
        'location',
        'status',
        'eligibility_snapshot',
        'call_letter_document_id',
        'minutes_document_id',
        'called_at',
        'held_call',
        'first_call_failed_at',
        'created_at',
        'updated_at',
        'version',
      ],
    );
    final val = Meeting(
      id: $checkedConvert('id', (v) => v as String),
      orgId: $checkedConvert('org_id', (v) => v as String),
      siteId: $checkedConvert('site_id', (v) => v as String),
      kind: $checkedConvert(
        'kind',
        (v) => $enumDecode(
          _$MeetingKindEnumEnumMap,
          v,
          unknownValue: MeetingKindEnum.unknownDefaultOpenApi,
        ),
      ),
      scope: $checkedConvert(
        'scope',
        (v) => $enumDecode(
          _$MeetingScopeEnumEnumMap,
          v,
          unknownValue: MeetingScopeEnum.unknownDefaultOpenApi,
        ),
      ),
      title: $checkedConvert('title', (v) => v as String?),
      scheduledAt: $checkedConvert(
        'scheduled_at',
        (v) => DateTime.parse(v as String),
      ),
      secondCallAt: $checkedConvert(
        'second_call_at',
        (v) => DateTime.parse(v as String),
      ),
      location: $checkedConvert('location', (v) => v as String),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(
          _$MeetingStatusEnumEnumMap,
          v,
          unknownValue: MeetingStatusEnum.unknownDefaultOpenApi,
        ),
      ),
      eligibilitySnapshot: $checkedConvert(
        'eligibility_snapshot',
        (v) => v == null
            ? null
            : EligibilitySnapshot.fromJson(v as Map<String, dynamic>),
      ),
      callLetterDocumentId: $checkedConvert(
        'call_letter_document_id',
        (v) => v as String?,
      ),
      minutesDocumentId: $checkedConvert(
        'minutes_document_id',
        (v) => v as String?,
      ),
      calledAt: $checkedConvert(
        'called_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      heldCall: $checkedConvert(
        'held_call',
        (v) => $enumDecodeNullable(
          _$MeetingHeldCallEnumEnumMap,
          v,
          unknownValue: MeetingHeldCallEnum.unknownDefaultOpenApi,
        ),
      ),
      firstCallFailedAt: $checkedConvert(
        'first_call_failed_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
      version: $checkedConvert('version', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'orgId': 'org_id',
    'siteId': 'site_id',
    'scheduledAt': 'scheduled_at',
    'secondCallAt': 'second_call_at',
    'eligibilitySnapshot': 'eligibility_snapshot',
    'callLetterDocumentId': 'call_letter_document_id',
    'minutesDocumentId': 'minutes_document_id',
    'calledAt': 'called_at',
    'heldCall': 'held_call',
    'firstCallFailedAt': 'first_call_failed_at',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$MeetingToJson(Meeting instance) => <String, dynamic>{
  'id': instance.id,
  'org_id': instance.orgId,
  'site_id': instance.siteId,
  'kind': _$MeetingKindEnumEnumMap[instance.kind]!,
  'scope': _$MeetingScopeEnumEnumMap[instance.scope]!,
  'title': instance.title,
  'scheduled_at': instance.scheduledAt.toIso8601String(),
  'second_call_at': instance.secondCallAt.toIso8601String(),
  'location': instance.location,
  'status': _$MeetingStatusEnumEnumMap[instance.status]!,
  'eligibility_snapshot': instance.eligibilitySnapshot?.toJson(),
  'call_letter_document_id': instance.callLetterDocumentId,
  'minutes_document_id': instance.minutesDocumentId,
  'called_at': instance.calledAt?.toIso8601String(),
  'held_call': _$MeetingHeldCallEnumEnumMap[instance.heldCall],
  'first_call_failed_at': instance.firstCallFailedAt?.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'version': instance.version,
};

const _$MeetingKindEnumEnumMap = {
  MeetingKindEnum.generalAssembly: 'general_assembly',
  MeetingKindEnum.extraordinary: 'extraordinary',
  MeetingKindEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};

const _$MeetingScopeEnumEnumMap = {
  MeetingScopeEnum.site: 'site',
  MeetingScopeEnum.block: 'block',
  MeetingScopeEnum.council: 'council',
  MeetingScopeEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};

const _$MeetingStatusEnumEnumMap = {
  MeetingStatusEnum.draft: 'draft',
  MeetingStatusEnum.called: 'called',
  MeetingStatusEnum.inSession: 'in_session',
  MeetingStatusEnum.closed: 'closed',
  MeetingStatusEnum.cancelled: 'cancelled',
  MeetingStatusEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};

const _$MeetingHeldCallEnumEnumMap = {
  MeetingHeldCallEnum.first: 'first',
  MeetingHeldCallEnum.second: 'second',
  MeetingHeldCallEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
