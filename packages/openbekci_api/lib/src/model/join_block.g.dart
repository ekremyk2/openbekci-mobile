// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_block.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$JoinBlockCWProxy {
  JoinBlock id(String id);

  JoinBlock name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JoinBlock(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JoinBlock(...).copyWith(id: 12, name: "My name")
  /// ````
  JoinBlock call({String id, String name});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfJoinBlock.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfJoinBlock.copyWith.fieldName(...)`
class _$JoinBlockCWProxyImpl implements _$JoinBlockCWProxy {
  const _$JoinBlockCWProxyImpl(this._value);

  final JoinBlock _value;

  @override
  JoinBlock id(String id) => this(id: id);

  @override
  JoinBlock name(String name) => this(name: name);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JoinBlock(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JoinBlock(...).copyWith(id: 12, name: "My name")
  /// ````
  JoinBlock call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return JoinBlock(
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

extension $JoinBlockCopyWith on JoinBlock {
  /// Returns a callable class that can be used as follows: `instanceOfJoinBlock.copyWith(...)` or like so:`instanceOfJoinBlock.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$JoinBlockCWProxy get copyWith => _$JoinBlockCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinBlock _$JoinBlockFromJson(Map<String, dynamic> json) =>
    $checkedCreate('JoinBlock', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['id', 'name']);
      final val = JoinBlock(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$JoinBlockToJson(JoinBlock instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};
