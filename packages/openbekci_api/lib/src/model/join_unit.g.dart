// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_unit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$JoinUnitCWProxy {
  JoinUnit id(String id);

  JoinUnit doorNumber(String doorNumber);

  JoinUnit blockName(String blockName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JoinUnit(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JoinUnit(...).copyWith(id: 12, name: "My name")
  /// ````
  JoinUnit call({String id, String doorNumber, String blockName});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfJoinUnit.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfJoinUnit.copyWith.fieldName(...)`
class _$JoinUnitCWProxyImpl implements _$JoinUnitCWProxy {
  const _$JoinUnitCWProxyImpl(this._value);

  final JoinUnit _value;

  @override
  JoinUnit id(String id) => this(id: id);

  @override
  JoinUnit doorNumber(String doorNumber) => this(doorNumber: doorNumber);

  @override
  JoinUnit blockName(String blockName) => this(blockName: blockName);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JoinUnit(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JoinUnit(...).copyWith(id: 12, name: "My name")
  /// ````
  JoinUnit call({
    Object? id = const $CopyWithPlaceholder(),
    Object? doorNumber = const $CopyWithPlaceholder(),
    Object? blockName = const $CopyWithPlaceholder(),
  }) {
    return JoinUnit(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      doorNumber: doorNumber == const $CopyWithPlaceholder()
          ? _value.doorNumber
          // ignore: cast_nullable_to_non_nullable
          : doorNumber as String,
      blockName: blockName == const $CopyWithPlaceholder()
          ? _value.blockName
          // ignore: cast_nullable_to_non_nullable
          : blockName as String,
    );
  }
}

extension $JoinUnitCopyWith on JoinUnit {
  /// Returns a callable class that can be used as follows: `instanceOfJoinUnit.copyWith(...)` or like so:`instanceOfJoinUnit.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$JoinUnitCWProxy get copyWith => _$JoinUnitCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinUnit _$JoinUnitFromJson(Map<String, dynamic> json) => $checkedCreate(
  'JoinUnit',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['id', 'door_number', 'block_name']);
    final val = JoinUnit(
      id: $checkedConvert('id', (v) => v as String),
      doorNumber: $checkedConvert('door_number', (v) => v as String),
      blockName: $checkedConvert('block_name', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {'doorNumber': 'door_number', 'blockName': 'block_name'},
);

Map<String, dynamic> _$JoinUnitToJson(JoinUnit instance) => <String, dynamic>{
  'id': instance.id,
  'door_number': instance.doorNumber,
  'block_name': instance.blockName,
};
