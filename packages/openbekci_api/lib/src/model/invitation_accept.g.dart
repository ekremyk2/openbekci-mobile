// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_accept.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InvitationAcceptCWProxy {
  InvitationAccept password(String? password);

  InvitationAccept displayName(String? displayName);

  InvitationAccept locale(String? locale);

  InvitationAccept client(InvitationAcceptClientEnum? client);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InvitationAccept(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InvitationAccept(...).copyWith(id: 12, name: "My name")
  /// ````
  InvitationAccept call({
    String? password,
    String? displayName,
    String? locale,
    InvitationAcceptClientEnum? client,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInvitationAccept.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInvitationAccept.copyWith.fieldName(...)`
class _$InvitationAcceptCWProxyImpl implements _$InvitationAcceptCWProxy {
  const _$InvitationAcceptCWProxyImpl(this._value);

  final InvitationAccept _value;

  @override
  InvitationAccept password(String? password) => this(password: password);

  @override
  InvitationAccept displayName(String? displayName) =>
      this(displayName: displayName);

  @override
  InvitationAccept locale(String? locale) => this(locale: locale);

  @override
  InvitationAccept client(InvitationAcceptClientEnum? client) =>
      this(client: client);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InvitationAccept(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InvitationAccept(...).copyWith(id: 12, name: "My name")
  /// ````
  InvitationAccept call({
    Object? password = const $CopyWithPlaceholder(),
    Object? displayName = const $CopyWithPlaceholder(),
    Object? locale = const $CopyWithPlaceholder(),
    Object? client = const $CopyWithPlaceholder(),
  }) {
    return InvitationAccept(
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
      displayName: displayName == const $CopyWithPlaceholder()
          ? _value.displayName
          // ignore: cast_nullable_to_non_nullable
          : displayName as String?,
      locale: locale == const $CopyWithPlaceholder()
          ? _value.locale
          // ignore: cast_nullable_to_non_nullable
          : locale as String?,
      client: client == const $CopyWithPlaceholder()
          ? _value.client
          // ignore: cast_nullable_to_non_nullable
          : client as InvitationAcceptClientEnum?,
    );
  }
}

extension $InvitationAcceptCopyWith on InvitationAccept {
  /// Returns a callable class that can be used as follows: `instanceOfInvitationAccept.copyWith(...)` or like so:`instanceOfInvitationAccept.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InvitationAcceptCWProxy get copyWith => _$InvitationAcceptCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvitationAccept _$InvitationAcceptFromJson(Map<String, dynamic> json) =>
    $checkedCreate('InvitationAccept', json, ($checkedConvert) {
      final val = InvitationAccept(
        password: $checkedConvert('password', (v) => v as String?),
        displayName: $checkedConvert('display_name', (v) => v as String?),
        locale: $checkedConvert('locale', (v) => v as String?),
        client: $checkedConvert(
          'client',
          (v) => $enumDecodeNullable(
            _$InvitationAcceptClientEnumEnumMap,
            v,
            unknownValue: InvitationAcceptClientEnum.unknownDefaultOpenApi,
          ),
        ),
      );
      return val;
    }, fieldKeyMap: const {'displayName': 'display_name'});

Map<String, dynamic> _$InvitationAcceptToJson(InvitationAccept instance) =>
    <String, dynamic>{
      'password': ?instance.password,
      'display_name': ?instance.displayName,
      'locale': ?instance.locale,
      'client': ?_$InvitationAcceptClientEnumEnumMap[instance.client],
    };

const _$InvitationAcceptClientEnumEnumMap = {
  InvitationAcceptClientEnum.web: 'web',
  InvitationAcceptClientEnum.mobile: 'mobile',
  InvitationAcceptClientEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
