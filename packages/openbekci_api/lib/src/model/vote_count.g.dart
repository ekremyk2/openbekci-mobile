// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_count.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VoteCountCWProxy {
  VoteCount agendaItemId(String agendaItemId);

  VoteCount yesCount(int yesCount);

  VoteCount noCount(int noCount);

  VoteCount abstainCount(int abstainCount);

  VoteCount yesShare(num? yesShare);

  VoteCount noShare(num? noShare);

  VoteCount abstainShare(num? abstainShare);

  VoteCount recordedBy(String? recordedBy);

  VoteCount recordedAt(DateTime? recordedAt);

  VoteCount outcomeHint(VoteCountOutcomeHintEnum outcomeHint);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VoteCount(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VoteCount(...).copyWith(id: 12, name: "My name")
  /// ````
  VoteCount call({
    String agendaItemId,
    int yesCount,
    int noCount,
    int abstainCount,
    num? yesShare,
    num? noShare,
    num? abstainShare,
    String? recordedBy,
    DateTime? recordedAt,
    VoteCountOutcomeHintEnum outcomeHint,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVoteCount.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVoteCount.copyWith.fieldName(...)`
class _$VoteCountCWProxyImpl implements _$VoteCountCWProxy {
  const _$VoteCountCWProxyImpl(this._value);

  final VoteCount _value;

  @override
  VoteCount agendaItemId(String agendaItemId) =>
      this(agendaItemId: agendaItemId);

  @override
  VoteCount yesCount(int yesCount) => this(yesCount: yesCount);

  @override
  VoteCount noCount(int noCount) => this(noCount: noCount);

  @override
  VoteCount abstainCount(int abstainCount) => this(abstainCount: abstainCount);

  @override
  VoteCount yesShare(num? yesShare) => this(yesShare: yesShare);

  @override
  VoteCount noShare(num? noShare) => this(noShare: noShare);

  @override
  VoteCount abstainShare(num? abstainShare) => this(abstainShare: abstainShare);

  @override
  VoteCount recordedBy(String? recordedBy) => this(recordedBy: recordedBy);

  @override
  VoteCount recordedAt(DateTime? recordedAt) => this(recordedAt: recordedAt);

  @override
  VoteCount outcomeHint(VoteCountOutcomeHintEnum outcomeHint) =>
      this(outcomeHint: outcomeHint);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VoteCount(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VoteCount(...).copyWith(id: 12, name: "My name")
  /// ````
  VoteCount call({
    Object? agendaItemId = const $CopyWithPlaceholder(),
    Object? yesCount = const $CopyWithPlaceholder(),
    Object? noCount = const $CopyWithPlaceholder(),
    Object? abstainCount = const $CopyWithPlaceholder(),
    Object? yesShare = const $CopyWithPlaceholder(),
    Object? noShare = const $CopyWithPlaceholder(),
    Object? abstainShare = const $CopyWithPlaceholder(),
    Object? recordedBy = const $CopyWithPlaceholder(),
    Object? recordedAt = const $CopyWithPlaceholder(),
    Object? outcomeHint = const $CopyWithPlaceholder(),
  }) {
    return VoteCount(
      agendaItemId: agendaItemId == const $CopyWithPlaceholder()
          ? _value.agendaItemId
          // ignore: cast_nullable_to_non_nullable
          : agendaItemId as String,
      yesCount: yesCount == const $CopyWithPlaceholder()
          ? _value.yesCount
          // ignore: cast_nullable_to_non_nullable
          : yesCount as int,
      noCount: noCount == const $CopyWithPlaceholder()
          ? _value.noCount
          // ignore: cast_nullable_to_non_nullable
          : noCount as int,
      abstainCount: abstainCount == const $CopyWithPlaceholder()
          ? _value.abstainCount
          // ignore: cast_nullable_to_non_nullable
          : abstainCount as int,
      yesShare: yesShare == const $CopyWithPlaceholder()
          ? _value.yesShare
          // ignore: cast_nullable_to_non_nullable
          : yesShare as num?,
      noShare: noShare == const $CopyWithPlaceholder()
          ? _value.noShare
          // ignore: cast_nullable_to_non_nullable
          : noShare as num?,
      abstainShare: abstainShare == const $CopyWithPlaceholder()
          ? _value.abstainShare
          // ignore: cast_nullable_to_non_nullable
          : abstainShare as num?,
      recordedBy: recordedBy == const $CopyWithPlaceholder()
          ? _value.recordedBy
          // ignore: cast_nullable_to_non_nullable
          : recordedBy as String?,
      recordedAt: recordedAt == const $CopyWithPlaceholder()
          ? _value.recordedAt
          // ignore: cast_nullable_to_non_nullable
          : recordedAt as DateTime?,
      outcomeHint: outcomeHint == const $CopyWithPlaceholder()
          ? _value.outcomeHint
          // ignore: cast_nullable_to_non_nullable
          : outcomeHint as VoteCountOutcomeHintEnum,
    );
  }
}

extension $VoteCountCopyWith on VoteCount {
  /// Returns a callable class that can be used as follows: `instanceOfVoteCount.copyWith(...)` or like so:`instanceOfVoteCount.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VoteCountCWProxy get copyWith => _$VoteCountCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoteCount _$VoteCountFromJson(Map<String, dynamic> json) => $checkedCreate(
  'VoteCount',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'agenda_item_id',
        'yes_count',
        'no_count',
        'abstain_count',
        'yes_share',
        'no_share',
        'abstain_share',
        'recorded_by',
        'recorded_at',
        'outcome_hint',
      ],
    );
    final val = VoteCount(
      agendaItemId: $checkedConvert('agenda_item_id', (v) => v as String),
      yesCount: $checkedConvert('yes_count', (v) => (v as num).toInt()),
      noCount: $checkedConvert('no_count', (v) => (v as num).toInt()),
      abstainCount: $checkedConvert('abstain_count', (v) => (v as num).toInt()),
      yesShare: $checkedConvert('yes_share', (v) => v as num?),
      noShare: $checkedConvert('no_share', (v) => v as num?),
      abstainShare: $checkedConvert('abstain_share', (v) => v as num?),
      recordedBy: $checkedConvert('recorded_by', (v) => v as String?),
      recordedAt: $checkedConvert(
        'recorded_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      outcomeHint: $checkedConvert(
        'outcome_hint',
        (v) => $enumDecode(
          _$VoteCountOutcomeHintEnumEnumMap,
          v,
          unknownValue: VoteCountOutcomeHintEnum.unknownDefaultOpenApi,
        ),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'agendaItemId': 'agenda_item_id',
    'yesCount': 'yes_count',
    'noCount': 'no_count',
    'abstainCount': 'abstain_count',
    'yesShare': 'yes_share',
    'noShare': 'no_share',
    'abstainShare': 'abstain_share',
    'recordedBy': 'recorded_by',
    'recordedAt': 'recorded_at',
    'outcomeHint': 'outcome_hint',
  },
);

Map<String, dynamic> _$VoteCountToJson(VoteCount instance) => <String, dynamic>{
  'agenda_item_id': instance.agendaItemId,
  'yes_count': instance.yesCount,
  'no_count': instance.noCount,
  'abstain_count': instance.abstainCount,
  'yes_share': instance.yesShare,
  'no_share': instance.noShare,
  'abstain_share': instance.abstainShare,
  'recorded_by': instance.recordedBy,
  'recorded_at': instance.recordedAt?.toIso8601String(),
  'outcome_hint': _$VoteCountOutcomeHintEnumEnumMap[instance.outcomeHint]!,
};

const _$VoteCountOutcomeHintEnumEnumMap = {
  VoteCountOutcomeHintEnum.accepted: 'accepted',
  VoteCountOutcomeHintEnum.rejected: 'rejected',
  VoteCountOutcomeHintEnum.undetermined: 'undetermined',
  VoteCountOutcomeHintEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
