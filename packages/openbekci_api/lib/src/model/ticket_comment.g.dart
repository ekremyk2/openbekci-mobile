// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_comment.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketCommentCWProxy {
  TicketComment id(String id);

  TicketComment orgId(String orgId);

  TicketComment ticketId(String ticketId);

  TicketComment authorPersonId(String authorPersonId);

  TicketComment authorDisplayName(String authorDisplayName);

  TicketComment body(String body);

  TicketComment visibility(TicketCommentVisibilityEnum visibility);

  TicketComment attachments(List<TicketAttachment> attachments);

  TicketComment createdAt(DateTime createdAt);

  TicketComment updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketComment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketComment(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketComment call({
    String id,
    String orgId,
    String ticketId,
    String authorPersonId,
    String authorDisplayName,
    String body,
    TicketCommentVisibilityEnum visibility,
    List<TicketAttachment> attachments,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketComment.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketComment.copyWith.fieldName(...)`
class _$TicketCommentCWProxyImpl implements _$TicketCommentCWProxy {
  const _$TicketCommentCWProxyImpl(this._value);

  final TicketComment _value;

  @override
  TicketComment id(String id) => this(id: id);

  @override
  TicketComment orgId(String orgId) => this(orgId: orgId);

  @override
  TicketComment ticketId(String ticketId) => this(ticketId: ticketId);

  @override
  TicketComment authorPersonId(String authorPersonId) =>
      this(authorPersonId: authorPersonId);

  @override
  TicketComment authorDisplayName(String authorDisplayName) =>
      this(authorDisplayName: authorDisplayName);

  @override
  TicketComment body(String body) => this(body: body);

  @override
  TicketComment visibility(TicketCommentVisibilityEnum visibility) =>
      this(visibility: visibility);

  @override
  TicketComment attachments(List<TicketAttachment> attachments) =>
      this(attachments: attachments);

  @override
  TicketComment createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  TicketComment updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketComment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketComment(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketComment call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? ticketId = const $CopyWithPlaceholder(),
    Object? authorPersonId = const $CopyWithPlaceholder(),
    Object? authorDisplayName = const $CopyWithPlaceholder(),
    Object? body = const $CopyWithPlaceholder(),
    Object? visibility = const $CopyWithPlaceholder(),
    Object? attachments = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return TicketComment(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      orgId: orgId == const $CopyWithPlaceholder()
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String,
      ticketId: ticketId == const $CopyWithPlaceholder()
          ? _value.ticketId
          // ignore: cast_nullable_to_non_nullable
          : ticketId as String,
      authorPersonId: authorPersonId == const $CopyWithPlaceholder()
          ? _value.authorPersonId
          // ignore: cast_nullable_to_non_nullable
          : authorPersonId as String,
      authorDisplayName: authorDisplayName == const $CopyWithPlaceholder()
          ? _value.authorDisplayName
          // ignore: cast_nullable_to_non_nullable
          : authorDisplayName as String,
      body: body == const $CopyWithPlaceholder()
          ? _value.body
          // ignore: cast_nullable_to_non_nullable
          : body as String,
      visibility: visibility == const $CopyWithPlaceholder()
          ? _value.visibility
          // ignore: cast_nullable_to_non_nullable
          : visibility as TicketCommentVisibilityEnum,
      attachments: attachments == const $CopyWithPlaceholder()
          ? _value.attachments
          // ignore: cast_nullable_to_non_nullable
          : attachments as List<TicketAttachment>,
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

extension $TicketCommentCopyWith on TicketComment {
  /// Returns a callable class that can be used as follows: `instanceOfTicketComment.copyWith(...)` or like so:`instanceOfTicketComment.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketCommentCWProxy get copyWith => _$TicketCommentCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketComment _$TicketCommentFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'TicketComment',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'org_id',
        'ticket_id',
        'author_person_id',
        'author_display_name',
        'body',
        'visibility',
        'attachments',
        'created_at',
        'updated_at',
      ],
    );
    final val = TicketComment(
      id: $checkedConvert('id', (v) => v as String),
      orgId: $checkedConvert('org_id', (v) => v as String),
      ticketId: $checkedConvert('ticket_id', (v) => v as String),
      authorPersonId: $checkedConvert('author_person_id', (v) => v as String),
      authorDisplayName: $checkedConvert(
        'author_display_name',
        (v) => v as String,
      ),
      body: $checkedConvert('body', (v) => v as String),
      visibility: $checkedConvert(
        'visibility',
        (v) => $enumDecode(
          _$TicketCommentVisibilityEnumEnumMap,
          v,
          unknownValue: TicketCommentVisibilityEnum.unknownDefaultOpenApi,
        ),
      ),
      attachments: $checkedConvert(
        'attachments',
        (v) => (v as List<dynamic>)
            .map((e) => TicketAttachment.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
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
    'ticketId': 'ticket_id',
    'authorPersonId': 'author_person_id',
    'authorDisplayName': 'author_display_name',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$TicketCommentToJson(TicketComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'org_id': instance.orgId,
      'ticket_id': instance.ticketId,
      'author_person_id': instance.authorPersonId,
      'author_display_name': instance.authorDisplayName,
      'body': instance.body,
      'visibility': _$TicketCommentVisibilityEnumEnumMap[instance.visibility]!,
      'attachments': instance.attachments.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$TicketCommentVisibilityEnumEnumMap = {
  TicketCommentVisibilityEnum.public: 'public',
  TicketCommentVisibilityEnum.internal: 'internal',
  TicketCommentVisibilityEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
