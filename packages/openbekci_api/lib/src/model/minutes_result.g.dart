// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minutes_result.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MinutesResultCWProxy {
  MinutesResult meetingId(String meetingId);

  MinutesResult documentId(String documentId);

  MinutesResult fileId(String fileId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MinutesResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MinutesResult(...).copyWith(id: 12, name: "My name")
  /// ````
  MinutesResult call({String meetingId, String documentId, String fileId});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMinutesResult.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMinutesResult.copyWith.fieldName(...)`
class _$MinutesResultCWProxyImpl implements _$MinutesResultCWProxy {
  const _$MinutesResultCWProxyImpl(this._value);

  final MinutesResult _value;

  @override
  MinutesResult meetingId(String meetingId) => this(meetingId: meetingId);

  @override
  MinutesResult documentId(String documentId) => this(documentId: documentId);

  @override
  MinutesResult fileId(String fileId) => this(fileId: fileId);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MinutesResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MinutesResult(...).copyWith(id: 12, name: "My name")
  /// ````
  MinutesResult call({
    Object? meetingId = const $CopyWithPlaceholder(),
    Object? documentId = const $CopyWithPlaceholder(),
    Object? fileId = const $CopyWithPlaceholder(),
  }) {
    return MinutesResult(
      meetingId: meetingId == const $CopyWithPlaceholder()
          ? _value.meetingId
          // ignore: cast_nullable_to_non_nullable
          : meetingId as String,
      documentId: documentId == const $CopyWithPlaceholder()
          ? _value.documentId
          // ignore: cast_nullable_to_non_nullable
          : documentId as String,
      fileId: fileId == const $CopyWithPlaceholder()
          ? _value.fileId
          // ignore: cast_nullable_to_non_nullable
          : fileId as String,
    );
  }
}

extension $MinutesResultCopyWith on MinutesResult {
  /// Returns a callable class that can be used as follows: `instanceOfMinutesResult.copyWith(...)` or like so:`instanceOfMinutesResult.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MinutesResultCWProxy get copyWith => _$MinutesResultCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MinutesResult _$MinutesResultFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MinutesResult',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['meeting_id', 'document_id', 'file_id'],
        );
        final val = MinutesResult(
          meetingId: $checkedConvert('meeting_id', (v) => v as String),
          documentId: $checkedConvert('document_id', (v) => v as String),
          fileId: $checkedConvert('file_id', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'meetingId': 'meeting_id',
        'documentId': 'document_id',
        'fileId': 'file_id',
      },
    );

Map<String, dynamic> _$MinutesResultToJson(MinutesResult instance) =>
    <String, dynamic>{
      'meeting_id': instance.meetingId,
      'document_id': instance.documentId,
      'file_id': instance.fileId,
    };
