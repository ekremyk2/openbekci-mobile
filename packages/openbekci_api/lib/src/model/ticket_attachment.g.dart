// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_attachment.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketAttachmentCWProxy {
  TicketAttachment id(String id);

  TicketAttachment orgId(String orgId);

  TicketAttachment ticketId(String ticketId);

  TicketAttachment commentId(String? commentId);

  TicketAttachment fileId(String fileId);

  TicketAttachment mime(String mime);

  TicketAttachment size(int size);

  TicketAttachment createdAt(DateTime createdAt);

  TicketAttachment updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketAttachment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketAttachment(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketAttachment call({
    String id,
    String orgId,
    String ticketId,
    String? commentId,
    String fileId,
    String mime,
    int size,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketAttachment.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketAttachment.copyWith.fieldName(...)`
class _$TicketAttachmentCWProxyImpl implements _$TicketAttachmentCWProxy {
  const _$TicketAttachmentCWProxyImpl(this._value);

  final TicketAttachment _value;

  @override
  TicketAttachment id(String id) => this(id: id);

  @override
  TicketAttachment orgId(String orgId) => this(orgId: orgId);

  @override
  TicketAttachment ticketId(String ticketId) => this(ticketId: ticketId);

  @override
  TicketAttachment commentId(String? commentId) => this(commentId: commentId);

  @override
  TicketAttachment fileId(String fileId) => this(fileId: fileId);

  @override
  TicketAttachment mime(String mime) => this(mime: mime);

  @override
  TicketAttachment size(int size) => this(size: size);

  @override
  TicketAttachment createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  TicketAttachment updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketAttachment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketAttachment(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketAttachment call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? ticketId = const $CopyWithPlaceholder(),
    Object? commentId = const $CopyWithPlaceholder(),
    Object? fileId = const $CopyWithPlaceholder(),
    Object? mime = const $CopyWithPlaceholder(),
    Object? size = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return TicketAttachment(
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
      commentId: commentId == const $CopyWithPlaceholder()
          ? _value.commentId
          // ignore: cast_nullable_to_non_nullable
          : commentId as String?,
      fileId: fileId == const $CopyWithPlaceholder()
          ? _value.fileId
          // ignore: cast_nullable_to_non_nullable
          : fileId as String,
      mime: mime == const $CopyWithPlaceholder()
          ? _value.mime
          // ignore: cast_nullable_to_non_nullable
          : mime as String,
      size: size == const $CopyWithPlaceholder()
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as int,
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

extension $TicketAttachmentCopyWith on TicketAttachment {
  /// Returns a callable class that can be used as follows: `instanceOfTicketAttachment.copyWith(...)` or like so:`instanceOfTicketAttachment.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketAttachmentCWProxy get copyWith => _$TicketAttachmentCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketAttachment _$TicketAttachmentFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TicketAttachment',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'org_id',
            'ticket_id',
            'comment_id',
            'file_id',
            'mime',
            'size',
            'created_at',
            'updated_at',
          ],
        );
        final val = TicketAttachment(
          id: $checkedConvert('id', (v) => v as String),
          orgId: $checkedConvert('org_id', (v) => v as String),
          ticketId: $checkedConvert('ticket_id', (v) => v as String),
          commentId: $checkedConvert('comment_id', (v) => v as String?),
          fileId: $checkedConvert('file_id', (v) => v as String),
          mime: $checkedConvert('mime', (v) => v as String),
          size: $checkedConvert('size', (v) => (v as num).toInt()),
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
        'commentId': 'comment_id',
        'fileId': 'file_id',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$TicketAttachmentToJson(TicketAttachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'org_id': instance.orgId,
      'ticket_id': instance.ticketId,
      'comment_id': instance.commentId,
      'file_id': instance.fileId,
      'mime': instance.mime,
      'size': instance.size,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
