// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketCWProxy {
  Ticket id(String id);

  Ticket orgId(String orgId);

  Ticket siteId(String siteId);

  Ticket unitId(String? unitId);

  Ticket unitDoorNumber(String? unitDoorNumber);

  Ticket reporterPersonId(String reporterPersonId);

  Ticket reporterDisplayName(String reporterDisplayName);

  Ticket categoryId(String categoryId);

  Ticket title(String title);

  Ticket description(String description);

  Ticket statusId(String statusId);

  Ticket statusName(String statusName);

  Ticket statusSemantic(TicketSemantic statusSemantic);

  Ticket visibility(TicketVisibilityEnum visibility);

  Ticket assignee(TicketAssignee? assignee);

  Ticket voteCount(int voteCount);

  Ticket votedByMe(bool votedByMe);

  Ticket mergedIntoId(String? mergedIntoId);

  Ticket commentCount(int commentCount);

  Ticket attachments(List<TicketAttachment> attachments);

  Ticket closedAt(DateTime? closedAt);

  Ticket createdAt(DateTime createdAt);

  Ticket updatedAt(DateTime updatedAt);

  Ticket version(int version);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Ticket(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Ticket(...).copyWith(id: 12, name: "My name")
  /// ````
  Ticket call({
    String id,
    String orgId,
    String siteId,
    String? unitId,
    String? unitDoorNumber,
    String reporterPersonId,
    String reporterDisplayName,
    String categoryId,
    String title,
    String description,
    String statusId,
    String statusName,
    TicketSemantic statusSemantic,
    TicketVisibilityEnum visibility,
    TicketAssignee? assignee,
    int voteCount,
    bool votedByMe,
    String? mergedIntoId,
    int commentCount,
    List<TicketAttachment> attachments,
    DateTime? closedAt,
    DateTime createdAt,
    DateTime updatedAt,
    int version,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicket.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicket.copyWith.fieldName(...)`
class _$TicketCWProxyImpl implements _$TicketCWProxy {
  const _$TicketCWProxyImpl(this._value);

  final Ticket _value;

  @override
  Ticket id(String id) => this(id: id);

  @override
  Ticket orgId(String orgId) => this(orgId: orgId);

  @override
  Ticket siteId(String siteId) => this(siteId: siteId);

  @override
  Ticket unitId(String? unitId) => this(unitId: unitId);

  @override
  Ticket unitDoorNumber(String? unitDoorNumber) =>
      this(unitDoorNumber: unitDoorNumber);

  @override
  Ticket reporterPersonId(String reporterPersonId) =>
      this(reporterPersonId: reporterPersonId);

  @override
  Ticket reporterDisplayName(String reporterDisplayName) =>
      this(reporterDisplayName: reporterDisplayName);

  @override
  Ticket categoryId(String categoryId) => this(categoryId: categoryId);

  @override
  Ticket title(String title) => this(title: title);

  @override
  Ticket description(String description) => this(description: description);

  @override
  Ticket statusId(String statusId) => this(statusId: statusId);

  @override
  Ticket statusName(String statusName) => this(statusName: statusName);

  @override
  Ticket statusSemantic(TicketSemantic statusSemantic) =>
      this(statusSemantic: statusSemantic);

  @override
  Ticket visibility(TicketVisibilityEnum visibility) =>
      this(visibility: visibility);

  @override
  Ticket assignee(TicketAssignee? assignee) => this(assignee: assignee);

  @override
  Ticket voteCount(int voteCount) => this(voteCount: voteCount);

  @override
  Ticket votedByMe(bool votedByMe) => this(votedByMe: votedByMe);

  @override
  Ticket mergedIntoId(String? mergedIntoId) => this(mergedIntoId: mergedIntoId);

  @override
  Ticket commentCount(int commentCount) => this(commentCount: commentCount);

  @override
  Ticket attachments(List<TicketAttachment> attachments) =>
      this(attachments: attachments);

  @override
  Ticket closedAt(DateTime? closedAt) => this(closedAt: closedAt);

  @override
  Ticket createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Ticket updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  Ticket version(int version) => this(version: version);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Ticket(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Ticket(...).copyWith(id: 12, name: "My name")
  /// ````
  Ticket call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? siteId = const $CopyWithPlaceholder(),
    Object? unitId = const $CopyWithPlaceholder(),
    Object? unitDoorNumber = const $CopyWithPlaceholder(),
    Object? reporterPersonId = const $CopyWithPlaceholder(),
    Object? reporterDisplayName = const $CopyWithPlaceholder(),
    Object? categoryId = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? statusId = const $CopyWithPlaceholder(),
    Object? statusName = const $CopyWithPlaceholder(),
    Object? statusSemantic = const $CopyWithPlaceholder(),
    Object? visibility = const $CopyWithPlaceholder(),
    Object? assignee = const $CopyWithPlaceholder(),
    Object? voteCount = const $CopyWithPlaceholder(),
    Object? votedByMe = const $CopyWithPlaceholder(),
    Object? mergedIntoId = const $CopyWithPlaceholder(),
    Object? commentCount = const $CopyWithPlaceholder(),
    Object? attachments = const $CopyWithPlaceholder(),
    Object? closedAt = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
  }) {
    return Ticket(
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
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as String?,
      unitDoorNumber: unitDoorNumber == const $CopyWithPlaceholder()
          ? _value.unitDoorNumber
          // ignore: cast_nullable_to_non_nullable
          : unitDoorNumber as String?,
      reporterPersonId: reporterPersonId == const $CopyWithPlaceholder()
          ? _value.reporterPersonId
          // ignore: cast_nullable_to_non_nullable
          : reporterPersonId as String,
      reporterDisplayName: reporterDisplayName == const $CopyWithPlaceholder()
          ? _value.reporterDisplayName
          // ignore: cast_nullable_to_non_nullable
          : reporterDisplayName as String,
      categoryId: categoryId == const $CopyWithPlaceholder()
          ? _value.categoryId
          // ignore: cast_nullable_to_non_nullable
          : categoryId as String,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String,
      statusId: statusId == const $CopyWithPlaceholder()
          ? _value.statusId
          // ignore: cast_nullable_to_non_nullable
          : statusId as String,
      statusName: statusName == const $CopyWithPlaceholder()
          ? _value.statusName
          // ignore: cast_nullable_to_non_nullable
          : statusName as String,
      statusSemantic: statusSemantic == const $CopyWithPlaceholder()
          ? _value.statusSemantic
          // ignore: cast_nullable_to_non_nullable
          : statusSemantic as TicketSemantic,
      visibility: visibility == const $CopyWithPlaceholder()
          ? _value.visibility
          // ignore: cast_nullable_to_non_nullable
          : visibility as TicketVisibilityEnum,
      assignee: assignee == const $CopyWithPlaceholder()
          ? _value.assignee
          // ignore: cast_nullable_to_non_nullable
          : assignee as TicketAssignee?,
      voteCount: voteCount == const $CopyWithPlaceholder()
          ? _value.voteCount
          // ignore: cast_nullable_to_non_nullable
          : voteCount as int,
      votedByMe: votedByMe == const $CopyWithPlaceholder()
          ? _value.votedByMe
          // ignore: cast_nullable_to_non_nullable
          : votedByMe as bool,
      mergedIntoId: mergedIntoId == const $CopyWithPlaceholder()
          ? _value.mergedIntoId
          // ignore: cast_nullable_to_non_nullable
          : mergedIntoId as String?,
      commentCount: commentCount == const $CopyWithPlaceholder()
          ? _value.commentCount
          // ignore: cast_nullable_to_non_nullable
          : commentCount as int,
      attachments: attachments == const $CopyWithPlaceholder()
          ? _value.attachments
          // ignore: cast_nullable_to_non_nullable
          : attachments as List<TicketAttachment>,
      closedAt: closedAt == const $CopyWithPlaceholder()
          ? _value.closedAt
          // ignore: cast_nullable_to_non_nullable
          : closedAt as DateTime?,
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

extension $TicketCopyWith on Ticket {
  /// Returns a callable class that can be used as follows: `instanceOfTicket.copyWith(...)` or like so:`instanceOfTicket.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketCWProxy get copyWith => _$TicketCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Ticket',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'org_id',
        'site_id',
        'unit_id',
        'unit_door_number',
        'reporter_person_id',
        'reporter_display_name',
        'category_id',
        'title',
        'description',
        'status_id',
        'status_name',
        'status_semantic',
        'visibility',
        'assignee',
        'vote_count',
        'voted_by_me',
        'merged_into_id',
        'comment_count',
        'attachments',
        'closed_at',
        'created_at',
        'updated_at',
        'version',
      ],
    );
    final val = Ticket(
      id: $checkedConvert('id', (v) => v as String),
      orgId: $checkedConvert('org_id', (v) => v as String),
      siteId: $checkedConvert('site_id', (v) => v as String),
      unitId: $checkedConvert('unit_id', (v) => v as String?),
      unitDoorNumber: $checkedConvert('unit_door_number', (v) => v as String?),
      reporterPersonId: $checkedConvert(
        'reporter_person_id',
        (v) => v as String,
      ),
      reporterDisplayName: $checkedConvert(
        'reporter_display_name',
        (v) => v as String,
      ),
      categoryId: $checkedConvert('category_id', (v) => v as String),
      title: $checkedConvert('title', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String),
      statusId: $checkedConvert('status_id', (v) => v as String),
      statusName: $checkedConvert('status_name', (v) => v as String),
      statusSemantic: $checkedConvert(
        'status_semantic',
        (v) => $enumDecode(
          _$TicketSemanticEnumMap,
          v,
          unknownValue: TicketSemantic.unknownDefaultOpenApi,
        ),
      ),
      visibility: $checkedConvert(
        'visibility',
        (v) => $enumDecode(
          _$TicketVisibilityEnumEnumMap,
          v,
          unknownValue: TicketVisibilityEnum.unknownDefaultOpenApi,
        ),
      ),
      assignee: $checkedConvert(
        'assignee',
        (v) => v == null
            ? null
            : TicketAssignee.fromJson(v as Map<String, dynamic>),
      ),
      voteCount: $checkedConvert('vote_count', (v) => (v as num).toInt()),
      votedByMe: $checkedConvert('voted_by_me', (v) => v as bool),
      mergedIntoId: $checkedConvert('merged_into_id', (v) => v as String?),
      commentCount: $checkedConvert('comment_count', (v) => (v as num).toInt()),
      attachments: $checkedConvert(
        'attachments',
        (v) => (v as List<dynamic>)
            .map((e) => TicketAttachment.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      closedAt: $checkedConvert(
        'closed_at',
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
    'unitId': 'unit_id',
    'unitDoorNumber': 'unit_door_number',
    'reporterPersonId': 'reporter_person_id',
    'reporterDisplayName': 'reporter_display_name',
    'categoryId': 'category_id',
    'statusId': 'status_id',
    'statusName': 'status_name',
    'statusSemantic': 'status_semantic',
    'voteCount': 'vote_count',
    'votedByMe': 'voted_by_me',
    'mergedIntoId': 'merged_into_id',
    'commentCount': 'comment_count',
    'closedAt': 'closed_at',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
  'id': instance.id,
  'org_id': instance.orgId,
  'site_id': instance.siteId,
  'unit_id': instance.unitId,
  'unit_door_number': instance.unitDoorNumber,
  'reporter_person_id': instance.reporterPersonId,
  'reporter_display_name': instance.reporterDisplayName,
  'category_id': instance.categoryId,
  'title': instance.title,
  'description': instance.description,
  'status_id': instance.statusId,
  'status_name': instance.statusName,
  'status_semantic': _$TicketSemanticEnumMap[instance.statusSemantic]!,
  'visibility': _$TicketVisibilityEnumEnumMap[instance.visibility]!,
  'assignee': instance.assignee?.toJson(),
  'vote_count': instance.voteCount,
  'voted_by_me': instance.votedByMe,
  'merged_into_id': instance.mergedIntoId,
  'comment_count': instance.commentCount,
  'attachments': instance.attachments.map((e) => e.toJson()).toList(),
  'closed_at': instance.closedAt?.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'version': instance.version,
};

const _$TicketSemanticEnumMap = {
  TicketSemantic.openLike: 'open_like',
  TicketSemantic.closedLike: 'closed_like',
  TicketSemantic.unknownDefaultOpenApi: 'unknown_default_open_api',
};

const _$TicketVisibilityEnumEnumMap = {
  TicketVisibilityEnum.private: 'private',
  TicketVisibilityEnum.common: 'common',
  TicketVisibilityEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
