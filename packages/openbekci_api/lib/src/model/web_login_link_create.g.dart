// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_login_link_create.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WebLoginLinkCreateCWProxy {
  WebLoginLinkCreate next(String? next);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WebLoginLinkCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WebLoginLinkCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  WebLoginLinkCreate call({String? next});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWebLoginLinkCreate.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWebLoginLinkCreate.copyWith.fieldName(...)`
class _$WebLoginLinkCreateCWProxyImpl implements _$WebLoginLinkCreateCWProxy {
  const _$WebLoginLinkCreateCWProxyImpl(this._value);

  final WebLoginLinkCreate _value;

  @override
  WebLoginLinkCreate next(String? next) => this(next: next);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WebLoginLinkCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WebLoginLinkCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  WebLoginLinkCreate call({Object? next = const $CopyWithPlaceholder()}) {
    return WebLoginLinkCreate(
      next: next == const $CopyWithPlaceholder()
          ? _value.next
          // ignore: cast_nullable_to_non_nullable
          : next as String?,
    );
  }
}

extension $WebLoginLinkCreateCopyWith on WebLoginLinkCreate {
  /// Returns a callable class that can be used as follows: `instanceOfWebLoginLinkCreate.copyWith(...)` or like so:`instanceOfWebLoginLinkCreate.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WebLoginLinkCreateCWProxy get copyWith =>
      _$WebLoginLinkCreateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebLoginLinkCreate _$WebLoginLinkCreateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('WebLoginLinkCreate', json, ($checkedConvert) {
      final val = WebLoginLinkCreate(
        next: $checkedConvert('next', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$WebLoginLinkCreateToJson(WebLoginLinkCreate instance) =>
    <String, dynamic>{'next': ?instance.next};
