// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reauth_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReauthResponseCWProxy {
  ReauthResponse reauthUntil(DateTime reauthUntil);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReauthResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReauthResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  ReauthResponse call({DateTime reauthUntil});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReauthResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReauthResponse.copyWith.fieldName(...)`
class _$ReauthResponseCWProxyImpl implements _$ReauthResponseCWProxy {
  const _$ReauthResponseCWProxyImpl(this._value);

  final ReauthResponse _value;

  @override
  ReauthResponse reauthUntil(DateTime reauthUntil) =>
      this(reauthUntil: reauthUntil);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReauthResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReauthResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  ReauthResponse call({Object? reauthUntil = const $CopyWithPlaceholder()}) {
    return ReauthResponse(
      reauthUntil: reauthUntil == const $CopyWithPlaceholder()
          ? _value.reauthUntil
          // ignore: cast_nullable_to_non_nullable
          : reauthUntil as DateTime,
    );
  }
}

extension $ReauthResponseCopyWith on ReauthResponse {
  /// Returns a callable class that can be used as follows: `instanceOfReauthResponse.copyWith(...)` or like so:`instanceOfReauthResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReauthResponseCWProxy get copyWith => _$ReauthResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReauthResponse _$ReauthResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ReauthResponse', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['reauth_until']);
      final val = ReauthResponse(
        reauthUntil: $checkedConvert(
          'reauth_until',
          (v) => DateTime.parse(v as String),
        ),
      );
      return val;
    }, fieldKeyMap: const {'reauthUntil': 'reauth_until'});

Map<String, dynamic> _$ReauthResponseToJson(ReauthResponse instance) =>
    <String, dynamic>{'reauth_until': instance.reauthUntil.toIso8601String()};
