// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_details.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BankDetailsCWProxy {
  BankDetails version(int version);

  BankDetails iban(String iban);

  BankDetails holder(String holder);

  BankDetails bankName(String? bankName);

  BankDetails referenceHint(String? referenceHint);

  BankDetails suggestedReference(String? suggestedReference);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BankDetails(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BankDetails(...).copyWith(id: 12, name: "My name")
  /// ````
  BankDetails call({
    int version,
    String iban,
    String holder,
    String? bankName,
    String? referenceHint,
    String? suggestedReference,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBankDetails.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBankDetails.copyWith.fieldName(...)`
class _$BankDetailsCWProxyImpl implements _$BankDetailsCWProxy {
  const _$BankDetailsCWProxyImpl(this._value);

  final BankDetails _value;

  @override
  BankDetails version(int version) => this(version: version);

  @override
  BankDetails iban(String iban) => this(iban: iban);

  @override
  BankDetails holder(String holder) => this(holder: holder);

  @override
  BankDetails bankName(String? bankName) => this(bankName: bankName);

  @override
  BankDetails referenceHint(String? referenceHint) =>
      this(referenceHint: referenceHint);

  @override
  BankDetails suggestedReference(String? suggestedReference) =>
      this(suggestedReference: suggestedReference);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BankDetails(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BankDetails(...).copyWith(id: 12, name: "My name")
  /// ````
  BankDetails call({
    Object? version = const $CopyWithPlaceholder(),
    Object? iban = const $CopyWithPlaceholder(),
    Object? holder = const $CopyWithPlaceholder(),
    Object? bankName = const $CopyWithPlaceholder(),
    Object? referenceHint = const $CopyWithPlaceholder(),
    Object? suggestedReference = const $CopyWithPlaceholder(),
  }) {
    return BankDetails(
      version: version == const $CopyWithPlaceholder()
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as int,
      iban: iban == const $CopyWithPlaceholder()
          ? _value.iban
          // ignore: cast_nullable_to_non_nullable
          : iban as String,
      holder: holder == const $CopyWithPlaceholder()
          ? _value.holder
          // ignore: cast_nullable_to_non_nullable
          : holder as String,
      bankName: bankName == const $CopyWithPlaceholder()
          ? _value.bankName
          // ignore: cast_nullable_to_non_nullable
          : bankName as String?,
      referenceHint: referenceHint == const $CopyWithPlaceholder()
          ? _value.referenceHint
          // ignore: cast_nullable_to_non_nullable
          : referenceHint as String?,
      suggestedReference: suggestedReference == const $CopyWithPlaceholder()
          ? _value.suggestedReference
          // ignore: cast_nullable_to_non_nullable
          : suggestedReference as String?,
    );
  }
}

extension $BankDetailsCopyWith on BankDetails {
  /// Returns a callable class that can be used as follows: `instanceOfBankDetails.copyWith(...)` or like so:`instanceOfBankDetails.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BankDetailsCWProxy get copyWith => _$BankDetailsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankDetails _$BankDetailsFromJson(Map<String, dynamic> json) => $checkedCreate(
  'BankDetails',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'version',
        'iban',
        'holder',
        'bank_name',
        'reference_hint',
        'suggested_reference',
      ],
    );
    final val = BankDetails(
      version: $checkedConvert('version', (v) => (v as num).toInt()),
      iban: $checkedConvert('iban', (v) => v as String),
      holder: $checkedConvert('holder', (v) => v as String),
      bankName: $checkedConvert('bank_name', (v) => v as String?),
      referenceHint: $checkedConvert('reference_hint', (v) => v as String?),
      suggestedReference: $checkedConvert(
        'suggested_reference',
        (v) => v as String?,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'bankName': 'bank_name',
    'referenceHint': 'reference_hint',
    'suggestedReference': 'suggested_reference',
  },
);

Map<String, dynamic> _$BankDetailsToJson(BankDetails instance) =>
    <String, dynamic>{
      'version': instance.version,
      'iban': instance.iban,
      'holder': instance.holder,
      'bank_name': instance.bankName,
      'reference_hint': instance.referenceHint,
      'suggested_reference': instance.suggestedReference,
    };
