// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directory_consent.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DirectoryConsentCWProxy {
  DirectoryConsent siteId(String siteId);

  DirectoryConsent consent(bool consent);

  DirectoryConsent showPhone(bool showPhone);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DirectoryConsent(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DirectoryConsent(...).copyWith(id: 12, name: "My name")
  /// ````
  DirectoryConsent call({String siteId, bool consent, bool showPhone});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDirectoryConsent.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDirectoryConsent.copyWith.fieldName(...)`
class _$DirectoryConsentCWProxyImpl implements _$DirectoryConsentCWProxy {
  const _$DirectoryConsentCWProxyImpl(this._value);

  final DirectoryConsent _value;

  @override
  DirectoryConsent siteId(String siteId) => this(siteId: siteId);

  @override
  DirectoryConsent consent(bool consent) => this(consent: consent);

  @override
  DirectoryConsent showPhone(bool showPhone) => this(showPhone: showPhone);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DirectoryConsent(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DirectoryConsent(...).copyWith(id: 12, name: "My name")
  /// ````
  DirectoryConsent call({
    Object? siteId = const $CopyWithPlaceholder(),
    Object? consent = const $CopyWithPlaceholder(),
    Object? showPhone = const $CopyWithPlaceholder(),
  }) {
    return DirectoryConsent(
      siteId: siteId == const $CopyWithPlaceholder()
          ? _value.siteId
          // ignore: cast_nullable_to_non_nullable
          : siteId as String,
      consent: consent == const $CopyWithPlaceholder()
          ? _value.consent
          // ignore: cast_nullable_to_non_nullable
          : consent as bool,
      showPhone: showPhone == const $CopyWithPlaceholder()
          ? _value.showPhone
          // ignore: cast_nullable_to_non_nullable
          : showPhone as bool,
    );
  }
}

extension $DirectoryConsentCopyWith on DirectoryConsent {
  /// Returns a callable class that can be used as follows: `instanceOfDirectoryConsent.copyWith(...)` or like so:`instanceOfDirectoryConsent.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DirectoryConsentCWProxy get copyWith => _$DirectoryConsentCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectoryConsent _$DirectoryConsentFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DirectoryConsent',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['site_id', 'consent', 'show_phone'],
        );
        final val = DirectoryConsent(
          siteId: $checkedConvert('site_id', (v) => v as String),
          consent: $checkedConvert('consent', (v) => v as bool),
          showPhone: $checkedConvert('show_phone', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'siteId': 'site_id', 'showPhone': 'show_phone'},
    );

Map<String, dynamic> _$DirectoryConsentToJson(DirectoryConsent instance) =>
    <String, dynamic>{
      'site_id': instance.siteId,
      'consent': instance.consent,
      'show_phone': instance.showPhone,
    };
