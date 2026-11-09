// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_person_update.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MyPersonUpdateCWProxy {
  MyPersonUpdate displayName(String? displayName);

  MyPersonUpdate contact(PersonContact? contact);

  MyPersonUpdate gateContactPhone(String? gateContactPhone);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MyPersonUpdate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MyPersonUpdate(...).copyWith(id: 12, name: "My name")
  /// ````
  MyPersonUpdate call({
    String? displayName,
    PersonContact? contact,
    String? gateContactPhone,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMyPersonUpdate.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMyPersonUpdate.copyWith.fieldName(...)`
class _$MyPersonUpdateCWProxyImpl implements _$MyPersonUpdateCWProxy {
  const _$MyPersonUpdateCWProxyImpl(this._value);

  final MyPersonUpdate _value;

  @override
  MyPersonUpdate displayName(String? displayName) =>
      this(displayName: displayName);

  @override
  MyPersonUpdate contact(PersonContact? contact) => this(contact: contact);

  @override
  MyPersonUpdate gateContactPhone(String? gateContactPhone) =>
      this(gateContactPhone: gateContactPhone);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MyPersonUpdate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MyPersonUpdate(...).copyWith(id: 12, name: "My name")
  /// ````
  MyPersonUpdate call({
    Object? displayName = const $CopyWithPlaceholder(),
    Object? contact = const $CopyWithPlaceholder(),
    Object? gateContactPhone = const $CopyWithPlaceholder(),
  }) {
    return MyPersonUpdate(
      displayName: displayName == const $CopyWithPlaceholder()
          ? _value.displayName
          // ignore: cast_nullable_to_non_nullable
          : displayName as String?,
      contact: contact == const $CopyWithPlaceholder()
          ? _value.contact
          // ignore: cast_nullable_to_non_nullable
          : contact as PersonContact?,
      gateContactPhone: gateContactPhone == const $CopyWithPlaceholder()
          ? _value.gateContactPhone
          // ignore: cast_nullable_to_non_nullable
          : gateContactPhone as String?,
    );
  }
}

extension $MyPersonUpdateCopyWith on MyPersonUpdate {
  /// Returns a callable class that can be used as follows: `instanceOfMyPersonUpdate.copyWith(...)` or like so:`instanceOfMyPersonUpdate.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MyPersonUpdateCWProxy get copyWith => _$MyPersonUpdateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPersonUpdate _$MyPersonUpdateFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MyPersonUpdate',
      json,
      ($checkedConvert) {
        final val = MyPersonUpdate(
          displayName: $checkedConvert('display_name', (v) => v as String?),
          contact: $checkedConvert(
            'contact',
            (v) => v == null
                ? null
                : PersonContact.fromJson(v as Map<String, dynamic>),
          ),
          gateContactPhone: $checkedConvert(
            'gate_contact_phone',
            (v) => v as String?,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'displayName': 'display_name',
        'gateContactPhone': 'gate_contact_phone',
      },
    );

Map<String, dynamic> _$MyPersonUpdateToJson(MyPersonUpdate instance) =>
    <String, dynamic>{
      'display_name': ?instance.displayName,
      'contact': ?instance.contact?.toJson(),
      'gate_contact_phone': ?instance.gateContactPhone,
    };
