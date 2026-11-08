// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_method.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthMethodCWProxy {
  AuthMethod id(String id);

  AuthMethod labelKey(String? labelKey);

  AuthMethod icon(String? icon);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthMethod(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthMethod(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthMethod call({String id, String? labelKey, String? icon});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthMethod.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthMethod.copyWith.fieldName(...)`
class _$AuthMethodCWProxyImpl implements _$AuthMethodCWProxy {
  const _$AuthMethodCWProxyImpl(this._value);

  final AuthMethod _value;

  @override
  AuthMethod id(String id) => this(id: id);

  @override
  AuthMethod labelKey(String? labelKey) => this(labelKey: labelKey);

  @override
  AuthMethod icon(String? icon) => this(icon: icon);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthMethod(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthMethod(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthMethod call({
    Object? id = const $CopyWithPlaceholder(),
    Object? labelKey = const $CopyWithPlaceholder(),
    Object? icon = const $CopyWithPlaceholder(),
  }) {
    return AuthMethod(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      labelKey: labelKey == const $CopyWithPlaceholder()
          ? _value.labelKey
          // ignore: cast_nullable_to_non_nullable
          : labelKey as String?,
      icon: icon == const $CopyWithPlaceholder()
          ? _value.icon
          // ignore: cast_nullable_to_non_nullable
          : icon as String?,
    );
  }
}

extension $AuthMethodCopyWith on AuthMethod {
  /// Returns a callable class that can be used as follows: `instanceOfAuthMethod.copyWith(...)` or like so:`instanceOfAuthMethod.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthMethodCWProxy get copyWith => _$AuthMethodCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthMethod _$AuthMethodFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AuthMethod', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['id']);
      final val = AuthMethod(
        id: $checkedConvert('id', (v) => v as String),
        labelKey: $checkedConvert('label_key', (v) => v as String?),
        icon: $checkedConvert('icon', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'labelKey': 'label_key'});

Map<String, dynamic> _$AuthMethodToJson(AuthMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label_key': ?instance.labelKey,
      'icon': ?instance.icon,
    };
