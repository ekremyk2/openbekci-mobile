// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_rules.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FacilityRulesCWProxy {
  FacilityRules openingHours(List<OpeningHours> openingHours);

  FacilityRules maxDurationMinutes(int maxDurationMinutes);

  FacilityRules maxDaysAhead(int maxDaysAhead);

  FacilityRules minNoticeMinutes(int? minNoticeMinutes);

  FacilityRules quotaPerUnit(int? quotaPerUnit);

  FacilityRules quotaPeriod(FacilityRulesQuotaPeriodEnum? quotaPeriod);

  FacilityRules whoMayBook(List<FacilityRulesWhoMayBookEnum> whoMayBook);

  FacilityRules fee(Money? fee);

  FacilityRules cancelRefundCutoffHours(int? cancelRefundCutoffHours);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FacilityRules(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FacilityRules(...).copyWith(id: 12, name: "My name")
  /// ````
  FacilityRules call({
    List<OpeningHours> openingHours,
    int maxDurationMinutes,
    int maxDaysAhead,
    int? minNoticeMinutes,
    int? quotaPerUnit,
    FacilityRulesQuotaPeriodEnum? quotaPeriod,
    List<FacilityRulesWhoMayBookEnum> whoMayBook,
    Money? fee,
    int? cancelRefundCutoffHours,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFacilityRules.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFacilityRules.copyWith.fieldName(...)`
class _$FacilityRulesCWProxyImpl implements _$FacilityRulesCWProxy {
  const _$FacilityRulesCWProxyImpl(this._value);

  final FacilityRules _value;

  @override
  FacilityRules openingHours(List<OpeningHours> openingHours) =>
      this(openingHours: openingHours);

  @override
  FacilityRules maxDurationMinutes(int maxDurationMinutes) =>
      this(maxDurationMinutes: maxDurationMinutes);

  @override
  FacilityRules maxDaysAhead(int maxDaysAhead) =>
      this(maxDaysAhead: maxDaysAhead);

  @override
  FacilityRules minNoticeMinutes(int? minNoticeMinutes) =>
      this(minNoticeMinutes: minNoticeMinutes);

  @override
  FacilityRules quotaPerUnit(int? quotaPerUnit) =>
      this(quotaPerUnit: quotaPerUnit);

  @override
  FacilityRules quotaPeriod(FacilityRulesQuotaPeriodEnum? quotaPeriod) =>
      this(quotaPeriod: quotaPeriod);

  @override
  FacilityRules whoMayBook(List<FacilityRulesWhoMayBookEnum> whoMayBook) =>
      this(whoMayBook: whoMayBook);

  @override
  FacilityRules fee(Money? fee) => this(fee: fee);

  @override
  FacilityRules cancelRefundCutoffHours(int? cancelRefundCutoffHours) =>
      this(cancelRefundCutoffHours: cancelRefundCutoffHours);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FacilityRules(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FacilityRules(...).copyWith(id: 12, name: "My name")
  /// ````
  FacilityRules call({
    Object? openingHours = const $CopyWithPlaceholder(),
    Object? maxDurationMinutes = const $CopyWithPlaceholder(),
    Object? maxDaysAhead = const $CopyWithPlaceholder(),
    Object? minNoticeMinutes = const $CopyWithPlaceholder(),
    Object? quotaPerUnit = const $CopyWithPlaceholder(),
    Object? quotaPeriod = const $CopyWithPlaceholder(),
    Object? whoMayBook = const $CopyWithPlaceholder(),
    Object? fee = const $CopyWithPlaceholder(),
    Object? cancelRefundCutoffHours = const $CopyWithPlaceholder(),
  }) {
    return FacilityRules(
      openingHours: openingHours == const $CopyWithPlaceholder()
          ? _value.openingHours
          // ignore: cast_nullable_to_non_nullable
          : openingHours as List<OpeningHours>,
      maxDurationMinutes: maxDurationMinutes == const $CopyWithPlaceholder()
          ? _value.maxDurationMinutes
          // ignore: cast_nullable_to_non_nullable
          : maxDurationMinutes as int,
      maxDaysAhead: maxDaysAhead == const $CopyWithPlaceholder()
          ? _value.maxDaysAhead
          // ignore: cast_nullable_to_non_nullable
          : maxDaysAhead as int,
      minNoticeMinutes: minNoticeMinutes == const $CopyWithPlaceholder()
          ? _value.minNoticeMinutes
          // ignore: cast_nullable_to_non_nullable
          : minNoticeMinutes as int?,
      quotaPerUnit: quotaPerUnit == const $CopyWithPlaceholder()
          ? _value.quotaPerUnit
          // ignore: cast_nullable_to_non_nullable
          : quotaPerUnit as int?,
      quotaPeriod: quotaPeriod == const $CopyWithPlaceholder()
          ? _value.quotaPeriod
          // ignore: cast_nullable_to_non_nullable
          : quotaPeriod as FacilityRulesQuotaPeriodEnum?,
      whoMayBook: whoMayBook == const $CopyWithPlaceholder()
          ? _value.whoMayBook
          // ignore: cast_nullable_to_non_nullable
          : whoMayBook as List<FacilityRulesWhoMayBookEnum>,
      fee: fee == const $CopyWithPlaceholder()
          ? _value.fee
          // ignore: cast_nullable_to_non_nullable
          : fee as Money?,
      cancelRefundCutoffHours:
          cancelRefundCutoffHours == const $CopyWithPlaceholder()
          ? _value.cancelRefundCutoffHours
          // ignore: cast_nullable_to_non_nullable
          : cancelRefundCutoffHours as int?,
    );
  }
}

extension $FacilityRulesCopyWith on FacilityRules {
  /// Returns a callable class that can be used as follows: `instanceOfFacilityRules.copyWith(...)` or like so:`instanceOfFacilityRules.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FacilityRulesCWProxy get copyWith => _$FacilityRulesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityRules _$FacilityRulesFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'FacilityRules',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'opening_hours',
            'max_duration_minutes',
            'max_days_ahead',
            'min_notice_minutes',
            'quota_per_unit',
            'quota_period',
            'who_may_book',
            'fee',
            'cancel_refund_cutoff_hours',
          ],
        );
        final val = FacilityRules(
          openingHours: $checkedConvert(
            'opening_hours',
            (v) => (v as List<dynamic>)
                .map((e) => OpeningHours.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          maxDurationMinutes: $checkedConvert(
            'max_duration_minutes',
            (v) => (v as num).toInt(),
          ),
          maxDaysAhead: $checkedConvert(
            'max_days_ahead',
            (v) => (v as num).toInt(),
          ),
          minNoticeMinutes: $checkedConvert(
            'min_notice_minutes',
            (v) => (v as num?)?.toInt(),
          ),
          quotaPerUnit: $checkedConvert(
            'quota_per_unit',
            (v) => (v as num?)?.toInt(),
          ),
          quotaPeriod: $checkedConvert(
            'quota_period',
            (v) => $enumDecodeNullable(
              _$FacilityRulesQuotaPeriodEnumEnumMap,
              v,
              unknownValue: FacilityRulesQuotaPeriodEnum.unknownDefaultOpenApi,
            ),
          ),
          whoMayBook: $checkedConvert(
            'who_may_book',
            (v) => (v as List<dynamic>)
                .map(
                  (e) => $enumDecode(
                    _$FacilityRulesWhoMayBookEnumEnumMap,
                    e,
                    unknownValue:
                        FacilityRulesWhoMayBookEnum.unknownDefaultOpenApi,
                  ),
                )
                .toList(),
          ),
          fee: $checkedConvert(
            'fee',
            (v) => v == null ? null : Money.fromJson(v as Map<String, dynamic>),
          ),
          cancelRefundCutoffHours: $checkedConvert(
            'cancel_refund_cutoff_hours',
            (v) => (v as num?)?.toInt(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'openingHours': 'opening_hours',
        'maxDurationMinutes': 'max_duration_minutes',
        'maxDaysAhead': 'max_days_ahead',
        'minNoticeMinutes': 'min_notice_minutes',
        'quotaPerUnit': 'quota_per_unit',
        'quotaPeriod': 'quota_period',
        'whoMayBook': 'who_may_book',
        'cancelRefundCutoffHours': 'cancel_refund_cutoff_hours',
      },
    );

Map<String, dynamic> _$FacilityRulesToJson(
  FacilityRules instance,
) => <String, dynamic>{
  'opening_hours': instance.openingHours.map((e) => e.toJson()).toList(),
  'max_duration_minutes': instance.maxDurationMinutes,
  'max_days_ahead': instance.maxDaysAhead,
  'min_notice_minutes': instance.minNoticeMinutes,
  'quota_per_unit': instance.quotaPerUnit,
  'quota_period': _$FacilityRulesQuotaPeriodEnumEnumMap[instance.quotaPeriod],
  'who_may_book': instance.whoMayBook
      .map((e) => _$FacilityRulesWhoMayBookEnumEnumMap[e]!)
      .toList(),
  'fee': instance.fee?.toJson(),
  'cancel_refund_cutoff_hours': instance.cancelRefundCutoffHours,
};

const _$FacilityRulesQuotaPeriodEnumEnumMap = {
  FacilityRulesQuotaPeriodEnum.week: 'week',
  FacilityRulesQuotaPeriodEnum.month: 'month',
  FacilityRulesQuotaPeriodEnum.unknownDefaultOpenApi:
      'unknown_default_open_api',
};

const _$FacilityRulesWhoMayBookEnumEnumMap = {
  FacilityRulesWhoMayBookEnum.owner: 'owner',
  FacilityRulesWhoMayBookEnum.tenant: 'tenant',
  FacilityRulesWhoMayBookEnum.household: 'household',
  FacilityRulesWhoMayBookEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
