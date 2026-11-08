// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relay_enrollment.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RelayEnrollmentCWProxy {
  RelayEnrollment challenge(String? challenge);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RelayEnrollment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RelayEnrollment(...).copyWith(id: 12, name: "My name")
  /// ````
  RelayEnrollment call({String? challenge});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRelayEnrollment.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRelayEnrollment.copyWith.fieldName(...)`
class _$RelayEnrollmentCWProxyImpl implements _$RelayEnrollmentCWProxy {
  const _$RelayEnrollmentCWProxyImpl(this._value);

  final RelayEnrollment _value;

  @override
  RelayEnrollment challenge(String? challenge) => this(challenge: challenge);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RelayEnrollment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RelayEnrollment(...).copyWith(id: 12, name: "My name")
  /// ````
  RelayEnrollment call({Object? challenge = const $CopyWithPlaceholder()}) {
    return RelayEnrollment(
      challenge: challenge == const $CopyWithPlaceholder()
          ? _value.challenge
          // ignore: cast_nullable_to_non_nullable
          : challenge as String?,
    );
  }
}

extension $RelayEnrollmentCopyWith on RelayEnrollment {
  /// Returns a callable class that can be used as follows: `instanceOfRelayEnrollment.copyWith(...)` or like so:`instanceOfRelayEnrollment.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RelayEnrollmentCWProxy get copyWith => _$RelayEnrollmentCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelayEnrollment _$RelayEnrollmentFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RelayEnrollment', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['challenge']);
      final val = RelayEnrollment(
        challenge: $checkedConvert('challenge', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$RelayEnrollmentToJson(RelayEnrollment instance) =>
    <String, dynamic>{'challenge': instance.challenge};
