// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_visibility.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DocumentVisibilityCWProxy {
  DocumentVisibility level(DocumentVisibilityLevelEnum level);

  DocumentVisibility unitIds(List<String>? unitIds);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DocumentVisibility(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DocumentVisibility(...).copyWith(id: 12, name: "My name")
  /// ````
  DocumentVisibility call({
    DocumentVisibilityLevelEnum level,
    List<String>? unitIds,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDocumentVisibility.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDocumentVisibility.copyWith.fieldName(...)`
class _$DocumentVisibilityCWProxyImpl implements _$DocumentVisibilityCWProxy {
  const _$DocumentVisibilityCWProxyImpl(this._value);

  final DocumentVisibility _value;

  @override
  DocumentVisibility level(DocumentVisibilityLevelEnum level) =>
      this(level: level);

  @override
  DocumentVisibility unitIds(List<String>? unitIds) => this(unitIds: unitIds);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DocumentVisibility(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DocumentVisibility(...).copyWith(id: 12, name: "My name")
  /// ````
  DocumentVisibility call({
    Object? level = const $CopyWithPlaceholder(),
    Object? unitIds = const $CopyWithPlaceholder(),
  }) {
    return DocumentVisibility(
      level: level == const $CopyWithPlaceholder()
          ? _value.level
          // ignore: cast_nullable_to_non_nullable
          : level as DocumentVisibilityLevelEnum,
      unitIds: unitIds == const $CopyWithPlaceholder()
          ? _value.unitIds
          // ignore: cast_nullable_to_non_nullable
          : unitIds as List<String>?,
    );
  }
}

extension $DocumentVisibilityCopyWith on DocumentVisibility {
  /// Returns a callable class that can be used as follows: `instanceOfDocumentVisibility.copyWith(...)` or like so:`instanceOfDocumentVisibility.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DocumentVisibilityCWProxy get copyWith =>
      _$DocumentVisibilityCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentVisibility _$DocumentVisibilityFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DocumentVisibility', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['level']);
      final val = DocumentVisibility(
        level: $checkedConvert(
          'level',
          (v) => $enumDecode(
            _$DocumentVisibilityLevelEnumEnumMap,
            v,
            unknownValue: DocumentVisibilityLevelEnum.unknownDefaultOpenApi,
          ),
        ),
        unitIds: $checkedConvert(
          'unit_ids',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'unitIds': 'unit_ids'});

Map<String, dynamic> _$DocumentVisibilityToJson(DocumentVisibility instance) =>
    <String, dynamic>{
      'level': _$DocumentVisibilityLevelEnumEnumMap[instance.level]!,
      'unit_ids': ?instance.unitIds,
    };

const _$DocumentVisibilityLevelEnumEnumMap = {
  DocumentVisibilityLevelEnum.board: 'board',
  DocumentVisibilityLevelEnum.owners: 'owners',
  DocumentVisibilityLevelEnum.everyone: 'everyone',
  DocumentVisibilityLevelEnum.units: 'units',
  DocumentVisibilityLevelEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
