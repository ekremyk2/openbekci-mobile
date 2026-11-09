// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FolderListCWProxy {
  FolderList items(List<Folder> items);

  FolderList nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FolderList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FolderList(...).copyWith(id: 12, name: "My name")
  /// ````
  FolderList call({List<Folder> items, String? nextCursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFolderList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFolderList.copyWith.fieldName(...)`
class _$FolderListCWProxyImpl implements _$FolderListCWProxy {
  const _$FolderListCWProxyImpl(this._value);

  final FolderList _value;

  @override
  FolderList items(List<Folder> items) => this(items: items);

  @override
  FolderList nextCursor(String? nextCursor) => this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FolderList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FolderList(...).copyWith(id: 12, name: "My name")
  /// ````
  FolderList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return FolderList(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<Folder>,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $FolderListCopyWith on FolderList {
  /// Returns a callable class that can be used as follows: `instanceOfFolderList.copyWith(...)` or like so:`instanceOfFolderList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FolderListCWProxy get copyWith => _$FolderListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FolderList _$FolderListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FolderList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'next_cursor']);
      final val = FolderList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => Folder.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'nextCursor': 'next_cursor'});

Map<String, dynamic> _$FolderListToJson(FolderList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'next_cursor': instance.nextCursor,
    };
