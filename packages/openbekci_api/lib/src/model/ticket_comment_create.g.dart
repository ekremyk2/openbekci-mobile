// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_comment_create.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketCommentCreateCWProxy {
  TicketCommentCreate body(String body);

  TicketCommentCreate visibility(TicketCommentCreateVisibilityEnum? visibility);

  TicketCommentCreate attachmentFileIds(List<String>? attachmentFileIds);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketCommentCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketCommentCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketCommentCreate call({
    String body,
    TicketCommentCreateVisibilityEnum? visibility,
    List<String>? attachmentFileIds,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketCommentCreate.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketCommentCreate.copyWith.fieldName(...)`
class _$TicketCommentCreateCWProxyImpl implements _$TicketCommentCreateCWProxy {
  const _$TicketCommentCreateCWProxyImpl(this._value);

  final TicketCommentCreate _value;

  @override
  TicketCommentCreate body(String body) => this(body: body);

  @override
  TicketCommentCreate visibility(
    TicketCommentCreateVisibilityEnum? visibility,
  ) => this(visibility: visibility);

  @override
  TicketCommentCreate attachmentFileIds(List<String>? attachmentFileIds) =>
      this(attachmentFileIds: attachmentFileIds);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketCommentCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketCommentCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketCommentCreate call({
    Object? body = const $CopyWithPlaceholder(),
    Object? visibility = const $CopyWithPlaceholder(),
    Object? attachmentFileIds = const $CopyWithPlaceholder(),
  }) {
    return TicketCommentCreate(
      body: body == const $CopyWithPlaceholder()
          ? _value.body
          // ignore: cast_nullable_to_non_nullable
          : body as String,
      visibility: visibility == const $CopyWithPlaceholder()
          ? _value.visibility
          // ignore: cast_nullable_to_non_nullable
          : visibility as TicketCommentCreateVisibilityEnum?,
      attachmentFileIds: attachmentFileIds == const $CopyWithPlaceholder()
          ? _value.attachmentFileIds
          // ignore: cast_nullable_to_non_nullable
          : attachmentFileIds as List<String>?,
    );
  }
}

extension $TicketCommentCreateCopyWith on TicketCommentCreate {
  /// Returns a callable class that can be used as follows: `instanceOfTicketCommentCreate.copyWith(...)` or like so:`instanceOfTicketCommentCreate.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketCommentCreateCWProxy get copyWith =>
      _$TicketCommentCreateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketCommentCreate _$TicketCommentCreateFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TicketCommentCreate',
      json,
      ($checkedConvert) {
        $checkKeys(json, requiredKeys: const ['body']);
        final val = TicketCommentCreate(
          body: $checkedConvert('body', (v) => v as String),
          visibility: $checkedConvert(
            'visibility',
            (v) => $enumDecodeNullable(
              _$TicketCommentCreateVisibilityEnumEnumMap,
              v,
              unknownValue:
                  TicketCommentCreateVisibilityEnum.unknownDefaultOpenApi,
            ),
          ),
          attachmentFileIds: $checkedConvert(
            'attachment_file_ids',
            (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {'attachmentFileIds': 'attachment_file_ids'},
    );

Map<String, dynamic> _$TicketCommentCreateToJson(
  TicketCommentCreate instance,
) => <String, dynamic>{
  'body': instance.body,
  'visibility':
      ?_$TicketCommentCreateVisibilityEnumEnumMap[instance.visibility],
  'attachment_file_ids': ?instance.attachmentFileIds,
};

const _$TicketCommentCreateVisibilityEnumEnumMap = {
  TicketCommentCreateVisibilityEnum.public: 'public',
  TicketCommentCreateVisibilityEnum.internal: 'internal',
  TicketCommentCreateVisibilityEnum.unknownDefaultOpenApi:
      'unknown_default_open_api',
};
