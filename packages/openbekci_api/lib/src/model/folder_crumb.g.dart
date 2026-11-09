// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_crumb.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FolderCrumbCWProxy {
  FolderCrumb id(String id);

  FolderCrumb name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FolderCrumb(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FolderCrumb(...).copyWith(id: 12, name: "My name")
  /// ````
  FolderCrumb call({String id, String name});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFolderCrumb.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFolderCrumb.copyWith.fieldName(...)`
class _$FolderCrumbCWProxyImpl implements _$FolderCrumbCWProxy {
  const _$FolderCrumbCWProxyImpl(this._value);

  final FolderCrumb _value;

  @override
  FolderCrumb id(String id) => this(id: id);

  @override
  FolderCrumb name(String name) => this(name: name);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FolderCrumb(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FolderCrumb(...).copyWith(id: 12, name: "My name")
  /// ````
  FolderCrumb call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return FolderCrumb(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $FolderCrumbCopyWith on FolderCrumb {
  /// Returns a callable class that can be used as follows: `instanceOfFolderCrumb.copyWith(...)` or like so:`instanceOfFolderCrumb.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FolderCrumbCWProxy get copyWith => _$FolderCrumbCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FolderCrumb _$FolderCrumbFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FolderCrumb', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['id', 'name']);
      final val = FolderCrumb(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$FolderCrumbToJson(FolderCrumb instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
