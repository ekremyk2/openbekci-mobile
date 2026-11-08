// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_policies.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MePoliciesCWProxy {
  MePolicies appLockRequired(bool appLockRequired);

  MePolicies reauthWindowMinutes(int reauthWindowMinutes);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MePolicies(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MePolicies(...).copyWith(id: 12, name: "My name")
  /// ````
  MePolicies call({bool appLockRequired, int reauthWindowMinutes});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMePolicies.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMePolicies.copyWith.fieldName(...)`
class _$MePoliciesCWProxyImpl implements _$MePoliciesCWProxy {
  const _$MePoliciesCWProxyImpl(this._value);

  final MePolicies _value;

  @override
  MePolicies appLockRequired(bool appLockRequired) =>
      this(appLockRequired: appLockRequired);

  @override
  MePolicies reauthWindowMinutes(int reauthWindowMinutes) =>
      this(reauthWindowMinutes: reauthWindowMinutes);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MePolicies(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MePolicies(...).copyWith(id: 12, name: "My name")
  /// ````
  MePolicies call({
    Object? appLockRequired = const $CopyWithPlaceholder(),
    Object? reauthWindowMinutes = const $CopyWithPlaceholder(),
  }) {
    return MePolicies(
      appLockRequired: appLockRequired == const $CopyWithPlaceholder()
          ? _value.appLockRequired
          // ignore: cast_nullable_to_non_nullable
          : appLockRequired as bool,
      reauthWindowMinutes: reauthWindowMinutes == const $CopyWithPlaceholder()
          ? _value.reauthWindowMinutes
          // ignore: cast_nullable_to_non_nullable
          : reauthWindowMinutes as int,
    );
  }
}

extension $MePoliciesCopyWith on MePolicies {
  /// Returns a callable class that can be used as follows: `instanceOfMePolicies.copyWith(...)` or like so:`instanceOfMePolicies.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MePoliciesCWProxy get copyWith => _$MePoliciesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MePolicies _$MePoliciesFromJson(Map<String, dynamic> json) => $checkedCreate(
  'MePolicies',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['app_lock_required', 'reauth_window_minutes'],
    );
    final val = MePolicies(
      appLockRequired: $checkedConvert('app_lock_required', (v) => v as bool),
      reauthWindowMinutes: $checkedConvert(
        'reauth_window_minutes',
        (v) => (v as num).toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'appLockRequired': 'app_lock_required',
    'reauthWindowMinutes': 'reauth_window_minutes',
  },
);

Map<String, dynamic> _$MePoliciesToJson(MePolicies instance) =>
    <String, dynamic>{
      'app_lock_required': instance.appLockRequired,
      'reauth_window_minutes': instance.reauthWindowMinutes,
    };
