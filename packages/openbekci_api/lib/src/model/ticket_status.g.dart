// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_status.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketStatusCWProxy {
  TicketStatus id(String id);

  TicketStatus name(String name);

  TicketStatus semantic(TicketStatusSemanticEnum semantic);

  TicketStatus position(int position);

  TicketStatus key(String? key);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketStatus(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketStatus(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketStatus call({
    String id,
    String name,
    TicketStatusSemanticEnum semantic,
    int position,
    String? key,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketStatus.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketStatus.copyWith.fieldName(...)`
class _$TicketStatusCWProxyImpl implements _$TicketStatusCWProxy {
  const _$TicketStatusCWProxyImpl(this._value);

  final TicketStatus _value;

  @override
  TicketStatus id(String id) => this(id: id);

  @override
  TicketStatus name(String name) => this(name: name);

  @override
  TicketStatus semantic(TicketStatusSemanticEnum semantic) =>
      this(semantic: semantic);

  @override
  TicketStatus position(int position) => this(position: position);

  @override
  TicketStatus key(String? key) => this(key: key);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketStatus(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketStatus(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketStatus call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? semantic = const $CopyWithPlaceholder(),
    Object? position = const $CopyWithPlaceholder(),
    Object? key = const $CopyWithPlaceholder(),
  }) {
    return TicketStatus(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      semantic: semantic == const $CopyWithPlaceholder()
          ? _value.semantic
          // ignore: cast_nullable_to_non_nullable
          : semantic as TicketStatusSemanticEnum,
      position: position == const $CopyWithPlaceholder()
          ? _value.position
          // ignore: cast_nullable_to_non_nullable
          : position as int,
      key: key == const $CopyWithPlaceholder()
          ? _value.key
          // ignore: cast_nullable_to_non_nullable
          : key as String?,
    );
  }
}

extension $TicketStatusCopyWith on TicketStatus {
  /// Returns a callable class that can be used as follows: `instanceOfTicketStatus.copyWith(...)` or like so:`instanceOfTicketStatus.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketStatusCWProxy get copyWith => _$TicketStatusCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketStatus _$TicketStatusFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TicketStatus', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['id', 'name', 'semantic', 'position', 'key'],
      );
      final val = TicketStatus(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        semantic: $checkedConvert(
          'semantic',
          (v) => $enumDecode(
            _$TicketStatusSemanticEnumEnumMap,
            v,
            unknownValue: TicketStatusSemanticEnum.unknownDefaultOpenApi,
          ),
        ),
        position: $checkedConvert('position', (v) => (v as num).toInt()),
        key: $checkedConvert('key', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$TicketStatusToJson(TicketStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'semantic': _$TicketStatusSemanticEnumEnumMap[instance.semantic]!,
      'position': instance.position,
      'key': instance.key,
    };

const _$TicketStatusSemanticEnumEnumMap = {
  TicketStatusSemanticEnum.openLike: 'open_like',
  TicketStatusSemanticEnum.closedLike: 'closed_like',
  TicketStatusSemanticEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
