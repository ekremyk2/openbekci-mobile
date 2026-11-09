// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DocumentListCWProxy {
  DocumentList items(List<Document> items);

  DocumentList nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DocumentList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DocumentList(...).copyWith(id: 12, name: "My name")
  /// ````
  DocumentList call({List<Document> items, String? nextCursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDocumentList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDocumentList.copyWith.fieldName(...)`
class _$DocumentListCWProxyImpl implements _$DocumentListCWProxy {
  const _$DocumentListCWProxyImpl(this._value);

  final DocumentList _value;

  @override
  DocumentList items(List<Document> items) => this(items: items);

  @override
  DocumentList nextCursor(String? nextCursor) => this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DocumentList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DocumentList(...).copyWith(id: 12, name: "My name")
  /// ````
  DocumentList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return DocumentList(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<Document>,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $DocumentListCopyWith on DocumentList {
  /// Returns a callable class that can be used as follows: `instanceOfDocumentList.copyWith(...)` or like so:`instanceOfDocumentList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DocumentListCWProxy get copyWith => _$DocumentListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentList _$DocumentListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DocumentList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'next_cursor']);
      final val = DocumentList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => Document.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'nextCursor': 'next_cursor'});

Map<String, dynamic> _$DocumentListToJson(DocumentList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'next_cursor': instance.nextCursor,
    };
