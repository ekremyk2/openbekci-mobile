// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'codes.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CodesCWProxy {
  Codes locale(String locale);

  Codes enums(Map<String, List<CodeLabel>> enums);

  Codes errors(List<CodeLabel> errors);

  Codes ticketStatuses(List<CodeLabel> ticketStatuses);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Codes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Codes(...).copyWith(id: 12, name: "My name")
  /// ````
  Codes call({
    String locale,
    Map<String, List<CodeLabel>> enums,
    List<CodeLabel> errors,
    List<CodeLabel> ticketStatuses,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCodes.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCodes.copyWith.fieldName(...)`
class _$CodesCWProxyImpl implements _$CodesCWProxy {
  const _$CodesCWProxyImpl(this._value);

  final Codes _value;

  @override
  Codes locale(String locale) => this(locale: locale);

  @override
  Codes enums(Map<String, List<CodeLabel>> enums) => this(enums: enums);

  @override
  Codes errors(List<CodeLabel> errors) => this(errors: errors);

  @override
  Codes ticketStatuses(List<CodeLabel> ticketStatuses) =>
      this(ticketStatuses: ticketStatuses);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Codes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Codes(...).copyWith(id: 12, name: "My name")
  /// ````
  Codes call({
    Object? locale = const $CopyWithPlaceholder(),
    Object? enums = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
    Object? ticketStatuses = const $CopyWithPlaceholder(),
  }) {
    return Codes(
      locale: locale == const $CopyWithPlaceholder()
          ? _value.locale
          // ignore: cast_nullable_to_non_nullable
          : locale as String,
      enums: enums == const $CopyWithPlaceholder()
          ? _value.enums
          // ignore: cast_nullable_to_non_nullable
          : enums as Map<String, List<CodeLabel>>,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as List<CodeLabel>,
      ticketStatuses: ticketStatuses == const $CopyWithPlaceholder()
          ? _value.ticketStatuses
          // ignore: cast_nullable_to_non_nullable
          : ticketStatuses as List<CodeLabel>,
    );
  }
}

extension $CodesCopyWith on Codes {
  /// Returns a callable class that can be used as follows: `instanceOfCodes.copyWith(...)` or like so:`instanceOfCodes.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CodesCWProxy get copyWith => _$CodesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Codes _$CodesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Codes', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['locale', 'enums', 'errors', 'ticket_statuses'],
      );
      final val = Codes(
        locale: $checkedConvert('locale', (v) => v as String),
        enums: $checkedConvert(
          'enums',
          (v) => (v as Map<String, dynamic>).map(
            (k, e) => MapEntry(
              k,
              (e as List<dynamic>)
                  .map((e) => CodeLabel.fromJson(e as Map<String, dynamic>))
                  .toList(),
            ),
          ),
        ),
        errors: $checkedConvert(
          'errors',
          (v) => (v as List<dynamic>)
              .map((e) => CodeLabel.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        ticketStatuses: $checkedConvert(
          'ticket_statuses',
          (v) => (v as List<dynamic>)
              .map((e) => CodeLabel.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'ticketStatuses': 'ticket_statuses'});

Map<String, dynamic> _$CodesToJson(Codes instance) => <String, dynamic>{
  'locale': instance.locale,
  'enums': instance.enums.map(
    (k, e) => MapEntry(k, e.map((e) => e.toJson()).toList()),
  ),
  'errors': instance.errors.map((e) => e.toJson()).toList(),
  'ticket_statuses': instance.ticketStatuses.map((e) => e.toJson()).toList(),
};
