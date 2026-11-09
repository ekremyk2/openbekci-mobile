// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_login_link.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WebLoginLinkCWProxy {
  WebLoginLink token(String token);

  WebLoginLink url(String url);

  WebLoginLink expiresAt(DateTime expiresAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WebLoginLink(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WebLoginLink(...).copyWith(id: 12, name: "My name")
  /// ````
  WebLoginLink call({String token, String url, DateTime expiresAt});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWebLoginLink.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWebLoginLink.copyWith.fieldName(...)`
class _$WebLoginLinkCWProxyImpl implements _$WebLoginLinkCWProxy {
  const _$WebLoginLinkCWProxyImpl(this._value);

  final WebLoginLink _value;

  @override
  WebLoginLink token(String token) => this(token: token);

  @override
  WebLoginLink url(String url) => this(url: url);

  @override
  WebLoginLink expiresAt(DateTime expiresAt) => this(expiresAt: expiresAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WebLoginLink(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WebLoginLink(...).copyWith(id: 12, name: "My name")
  /// ````
  WebLoginLink call({
    Object? token = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
  }) {
    return WebLoginLink(
      token: token == const $CopyWithPlaceholder()
          ? _value.token
          // ignore: cast_nullable_to_non_nullable
          : token as String,
      url: url == const $CopyWithPlaceholder()
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String,
      expiresAt: expiresAt == const $CopyWithPlaceholder()
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as DateTime,
    );
  }
}

extension $WebLoginLinkCopyWith on WebLoginLink {
  /// Returns a callable class that can be used as follows: `instanceOfWebLoginLink.copyWith(...)` or like so:`instanceOfWebLoginLink.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WebLoginLinkCWProxy get copyWith => _$WebLoginLinkCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebLoginLink _$WebLoginLinkFromJson(Map<String, dynamic> json) =>
    $checkedCreate('WebLoginLink', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['token', 'url', 'expires_at']);
      final val = WebLoginLink(
        token: $checkedConvert('token', (v) => v as String),
        url: $checkedConvert('url', (v) => v as String),
        expiresAt: $checkedConvert(
          'expires_at',
          (v) => DateTime.parse(v as String),
        ),
      );
      return val;
    }, fieldKeyMap: const {'expiresAt': 'expires_at'});

Map<String, dynamic> _$WebLoginLinkToJson(WebLoginLink instance) =>
    <String, dynamic>{
      'token': instance.token,
      'url': instance.url,
      'expires_at': instance.expiresAt.toIso8601String(),
    };
