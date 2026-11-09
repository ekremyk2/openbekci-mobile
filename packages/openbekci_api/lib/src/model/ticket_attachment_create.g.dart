// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_attachment_create.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketAttachmentCreateCWProxy {
  TicketAttachmentCreate fileId(String fileId);

  TicketAttachmentCreate commentId(String? commentId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketAttachmentCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketAttachmentCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketAttachmentCreate call({String fileId, String? commentId});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketAttachmentCreate.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketAttachmentCreate.copyWith.fieldName(...)`
class _$TicketAttachmentCreateCWProxyImpl
    implements _$TicketAttachmentCreateCWProxy {
  const _$TicketAttachmentCreateCWProxyImpl(this._value);

  final TicketAttachmentCreate _value;

  @override
  TicketAttachmentCreate fileId(String fileId) => this(fileId: fileId);

  @override
  TicketAttachmentCreate commentId(String? commentId) =>
      this(commentId: commentId);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketAttachmentCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketAttachmentCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketAttachmentCreate call({
    Object? fileId = const $CopyWithPlaceholder(),
    Object? commentId = const $CopyWithPlaceholder(),
  }) {
    return TicketAttachmentCreate(
      fileId: fileId == const $CopyWithPlaceholder()
          ? _value.fileId
          // ignore: cast_nullable_to_non_nullable
          : fileId as String,
      commentId: commentId == const $CopyWithPlaceholder()
          ? _value.commentId
          // ignore: cast_nullable_to_non_nullable
          : commentId as String?,
    );
  }
}

extension $TicketAttachmentCreateCopyWith on TicketAttachmentCreate {
  /// Returns a callable class that can be used as follows: `instanceOfTicketAttachmentCreate.copyWith(...)` or like so:`instanceOfTicketAttachmentCreate.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketAttachmentCreateCWProxy get copyWith =>
      _$TicketAttachmentCreateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketAttachmentCreate _$TicketAttachmentCreateFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'TicketAttachmentCreate',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['file_id']);
    final val = TicketAttachmentCreate(
      fileId: $checkedConvert('file_id', (v) => v as String),
      commentId: $checkedConvert('comment_id', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'fileId': 'file_id', 'commentId': 'comment_id'},
);

Map<String, dynamic> _$TicketAttachmentCreateToJson(
  TicketAttachmentCreate instance,
) => <String, dynamic>{
  'file_id': instance.fileId,
  'comment_id': ?instance.commentId,
};
