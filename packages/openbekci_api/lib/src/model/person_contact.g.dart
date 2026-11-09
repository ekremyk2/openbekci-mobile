// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_contact.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PersonContactCWProxy {
  PersonContact email(String? email);

  PersonContact phone(String? phone);

  PersonContact preferredChannel(
    PersonContactPreferredChannelEnum? preferredChannel,
  );

  PersonContact address(Address? address);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PersonContact(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PersonContact(...).copyWith(id: 12, name: "My name")
  /// ````
  PersonContact call({
    String? email,
    String? phone,
    PersonContactPreferredChannelEnum? preferredChannel,
    Address? address,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPersonContact.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPersonContact.copyWith.fieldName(...)`
class _$PersonContactCWProxyImpl implements _$PersonContactCWProxy {
  const _$PersonContactCWProxyImpl(this._value);

  final PersonContact _value;

  @override
  PersonContact email(String? email) => this(email: email);

  @override
  PersonContact phone(String? phone) => this(phone: phone);

  @override
  PersonContact preferredChannel(
    PersonContactPreferredChannelEnum? preferredChannel,
  ) => this(preferredChannel: preferredChannel);

  @override
  PersonContact address(Address? address) => this(address: address);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PersonContact(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PersonContact(...).copyWith(id: 12, name: "My name")
  /// ````
  PersonContact call({
    Object? email = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? preferredChannel = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
  }) {
    return PersonContact(
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      phone: phone == const $CopyWithPlaceholder()
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String?,
      preferredChannel: preferredChannel == const $CopyWithPlaceholder()
          ? _value.preferredChannel
          // ignore: cast_nullable_to_non_nullable
          : preferredChannel as PersonContactPreferredChannelEnum?,
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as Address?,
    );
  }
}

extension $PersonContactCopyWith on PersonContact {
  /// Returns a callable class that can be used as follows: `instanceOfPersonContact.copyWith(...)` or like so:`instanceOfPersonContact.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PersonContactCWProxy get copyWith => _$PersonContactCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonContact _$PersonContactFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PersonContact', json, ($checkedConvert) {
      final val = PersonContact(
        email: $checkedConvert('email', (v) => v as String?),
        phone: $checkedConvert('phone', (v) => v as String?),
        preferredChannel: $checkedConvert(
          'preferred_channel',
          (v) => $enumDecodeNullable(
            _$PersonContactPreferredChannelEnumEnumMap,
            v,
            unknownValue:
                PersonContactPreferredChannelEnum.unknownDefaultOpenApi,
          ),
        ),
        address: $checkedConvert(
          'address',
          (v) => v == null ? null : Address.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'preferredChannel': 'preferred_channel'});

Map<String, dynamic> _$PersonContactToJson(
  PersonContact instance,
) => <String, dynamic>{
  'email': ?instance.email,
  'phone': ?instance.phone,
  'preferred_channel':
      ?_$PersonContactPreferredChannelEnumEnumMap[instance.preferredChannel],
  'address': ?instance.address?.toJson(),
};

const _$PersonContactPreferredChannelEnumEnumMap = {
  PersonContactPreferredChannelEnum.sms: 'sms',
  PersonContactPreferredChannelEnum.email: 'email',
  PersonContactPreferredChannelEnum.unknownDefaultOpenApi:
      'unknown_default_open_api',
};
