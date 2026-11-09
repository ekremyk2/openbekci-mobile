// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decision_effect.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DecisionEffectCWProxy {
  DecisionEffect kind(DecisionEffectKindEnum kind);

  DecisionEffect recordType(String recordType);

  DecisionEffect recordId(String recordId);

  DecisionEffect appliedAt(DateTime appliedAt);

  DecisionEffect appliedBy(String appliedBy);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DecisionEffect(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DecisionEffect(...).copyWith(id: 12, name: "My name")
  /// ````
  DecisionEffect call({
    DecisionEffectKindEnum kind,
    String recordType,
    String recordId,
    DateTime appliedAt,
    String appliedBy,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDecisionEffect.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDecisionEffect.copyWith.fieldName(...)`
class _$DecisionEffectCWProxyImpl implements _$DecisionEffectCWProxy {
  const _$DecisionEffectCWProxyImpl(this._value);

  final DecisionEffect _value;

  @override
  DecisionEffect kind(DecisionEffectKindEnum kind) => this(kind: kind);

  @override
  DecisionEffect recordType(String recordType) => this(recordType: recordType);

  @override
  DecisionEffect recordId(String recordId) => this(recordId: recordId);

  @override
  DecisionEffect appliedAt(DateTime appliedAt) => this(appliedAt: appliedAt);

  @override
  DecisionEffect appliedBy(String appliedBy) => this(appliedBy: appliedBy);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DecisionEffect(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DecisionEffect(...).copyWith(id: 12, name: "My name")
  /// ````
  DecisionEffect call({
    Object? kind = const $CopyWithPlaceholder(),
    Object? recordType = const $CopyWithPlaceholder(),
    Object? recordId = const $CopyWithPlaceholder(),
    Object? appliedAt = const $CopyWithPlaceholder(),
    Object? appliedBy = const $CopyWithPlaceholder(),
  }) {
    return DecisionEffect(
      kind: kind == const $CopyWithPlaceholder()
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as DecisionEffectKindEnum,
      recordType: recordType == const $CopyWithPlaceholder()
          ? _value.recordType
          // ignore: cast_nullable_to_non_nullable
          : recordType as String,
      recordId: recordId == const $CopyWithPlaceholder()
          ? _value.recordId
          // ignore: cast_nullable_to_non_nullable
          : recordId as String,
      appliedAt: appliedAt == const $CopyWithPlaceholder()
          ? _value.appliedAt
          // ignore: cast_nullable_to_non_nullable
          : appliedAt as DateTime,
      appliedBy: appliedBy == const $CopyWithPlaceholder()
          ? _value.appliedBy
          // ignore: cast_nullable_to_non_nullable
          : appliedBy as String,
    );
  }
}

extension $DecisionEffectCopyWith on DecisionEffect {
  /// Returns a callable class that can be used as follows: `instanceOfDecisionEffect.copyWith(...)` or like so:`instanceOfDecisionEffect.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DecisionEffectCWProxy get copyWith => _$DecisionEffectCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DecisionEffect _$DecisionEffectFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DecisionEffect',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'kind',
            'record_type',
            'record_id',
            'applied_at',
            'applied_by',
          ],
        );
        final val = DecisionEffect(
          kind: $checkedConvert(
            'kind',
            (v) => $enumDecode(
              _$DecisionEffectKindEnumEnumMap,
              v,
              unknownValue: DecisionEffectKindEnum.unknownDefaultOpenApi,
            ),
          ),
          recordType: $checkedConvert('record_type', (v) => v as String),
          recordId: $checkedConvert('record_id', (v) => v as String),
          appliedAt: $checkedConvert(
            'applied_at',
            (v) => DateTime.parse(v as String),
          ),
          appliedBy: $checkedConvert('applied_by', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'recordType': 'record_type',
        'recordId': 'record_id',
        'appliedAt': 'applied_at',
        'appliedBy': 'applied_by',
      },
    );

Map<String, dynamic> _$DecisionEffectToJson(DecisionEffect instance) =>
    <String, dynamic>{
      'kind': _$DecisionEffectKindEnumEnumMap[instance.kind]!,
      'record_type': instance.recordType,
      'record_id': instance.recordId,
      'applied_at': instance.appliedAt.toIso8601String(),
      'applied_by': instance.appliedBy,
    };

const _$DecisionEffectKindEnumEnumMap = {
  DecisionEffectKindEnum.duesRate: 'dues_rate',
  DecisionEffectKindEnum.membership: 'membership',
  DecisionEffectKindEnum.budgetFinal: 'budget_final',
  DecisionEffectKindEnum.specialAssessment: 'special_assessment',
  DecisionEffectKindEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
