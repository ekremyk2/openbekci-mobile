// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dissent.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DissentCWProxy {
  Dissent personId(String personId);

  Dissent displayName(String? displayName);

  Dissent text(String text);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Dissent(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Dissent(...).copyWith(id: 12, name: "My name")
  /// ````
  Dissent call({String personId, String? displayName, String text});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDissent.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDissent.copyWith.fieldName(...)`
class _$DissentCWProxyImpl implements _$DissentCWProxy {
  const _$DissentCWProxyImpl(this._value);

  final Dissent _value;

  @override
  Dissent personId(String personId) => this(personId: personId);

  @override
  Dissent displayName(String? displayName) => this(displayName: displayName);

  @override
  Dissent text(String text) => this(text: text);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Dissent(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Dissent(...).copyWith(id: 12, name: "My name")
  /// ````
  Dissent call({
    Object? personId = const $CopyWithPlaceholder(),
    Object? displayName = const $CopyWithPlaceholder(),
    Object? text = const $CopyWithPlaceholder(),
  }) {
    return Dissent(
      personId: personId == const $CopyWithPlaceholder()
          ? _value.personId
          // ignore: cast_nullable_to_non_nullable
          : personId as String,
      displayName: displayName == const $CopyWithPlaceholder()
          ? _value.displayName
          // ignore: cast_nullable_to_non_nullable
          : displayName as String?,
      text: text == const $CopyWithPlaceholder()
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as String,
    );
  }
}

extension $DissentCopyWith on Dissent {
  /// Returns a callable class that can be used as follows: `instanceOfDissent.copyWith(...)` or like so:`instanceOfDissent.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DissentCWProxy get copyWith => _$DissentCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dissent _$DissentFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Dissent',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['person_id', 'display_name', 'text']);
    final val = Dissent(
      personId: $checkedConvert('person_id', (v) => v as String),
      displayName: $checkedConvert('display_name', (v) => v as String?),
      text: $checkedConvert('text', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {'personId': 'person_id', 'displayName': 'display_name'},
);

Map<String, dynamic> _$DissentToJson(Dissent instance) => <String, dynamic>{
  'person_id': instance.personId,
  'display_name': instance.displayName,
  'text': instance.text,
};
