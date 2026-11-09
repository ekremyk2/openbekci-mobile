// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eligibility_snapshot.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EligibilitySnapshotCWProxy {
  EligibilitySnapshot takenAt(DateTime takenAt);

  EligibilitySnapshot asOf(DateTime asOf);

  EligibilitySnapshot voteWeight(EligibilitySnapshotVoteWeightEnum voteWeight);

  EligibilitySnapshot shareBasis(String shareBasis);

  EligibilitySnapshot unitCount(int unitCount);

  EligibilitySnapshot totalVotes(int totalVotes);

  EligibilitySnapshot totalShare(num totalShare);

  EligibilitySnapshot owners(List<EligibilityOwner> owners);

  EligibilitySnapshot unrepresentedUnits(List<String> unrepresentedUnits);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EligibilitySnapshot(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EligibilitySnapshot(...).copyWith(id: 12, name: "My name")
  /// ````
  EligibilitySnapshot call({
    DateTime takenAt,
    DateTime asOf,
    EligibilitySnapshotVoteWeightEnum voteWeight,
    String shareBasis,
    int unitCount,
    int totalVotes,
    num totalShare,
    List<EligibilityOwner> owners,
    List<String> unrepresentedUnits,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEligibilitySnapshot.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEligibilitySnapshot.copyWith.fieldName(...)`
class _$EligibilitySnapshotCWProxyImpl implements _$EligibilitySnapshotCWProxy {
  const _$EligibilitySnapshotCWProxyImpl(this._value);

  final EligibilitySnapshot _value;

  @override
  EligibilitySnapshot takenAt(DateTime takenAt) => this(takenAt: takenAt);

  @override
  EligibilitySnapshot asOf(DateTime asOf) => this(asOf: asOf);

  @override
  EligibilitySnapshot voteWeight(
    EligibilitySnapshotVoteWeightEnum voteWeight,
  ) => this(voteWeight: voteWeight);

  @override
  EligibilitySnapshot shareBasis(String shareBasis) =>
      this(shareBasis: shareBasis);

  @override
  EligibilitySnapshot unitCount(int unitCount) => this(unitCount: unitCount);

  @override
  EligibilitySnapshot totalVotes(int totalVotes) =>
      this(totalVotes: totalVotes);

  @override
  EligibilitySnapshot totalShare(num totalShare) =>
      this(totalShare: totalShare);

  @override
  EligibilitySnapshot owners(List<EligibilityOwner> owners) =>
      this(owners: owners);

  @override
  EligibilitySnapshot unrepresentedUnits(List<String> unrepresentedUnits) =>
      this(unrepresentedUnits: unrepresentedUnits);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EligibilitySnapshot(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EligibilitySnapshot(...).copyWith(id: 12, name: "My name")
  /// ````
  EligibilitySnapshot call({
    Object? takenAt = const $CopyWithPlaceholder(),
    Object? asOf = const $CopyWithPlaceholder(),
    Object? voteWeight = const $CopyWithPlaceholder(),
    Object? shareBasis = const $CopyWithPlaceholder(),
    Object? unitCount = const $CopyWithPlaceholder(),
    Object? totalVotes = const $CopyWithPlaceholder(),
    Object? totalShare = const $CopyWithPlaceholder(),
    Object? owners = const $CopyWithPlaceholder(),
    Object? unrepresentedUnits = const $CopyWithPlaceholder(),
  }) {
    return EligibilitySnapshot(
      takenAt: takenAt == const $CopyWithPlaceholder()
          ? _value.takenAt
          // ignore: cast_nullable_to_non_nullable
          : takenAt as DateTime,
      asOf: asOf == const $CopyWithPlaceholder()
          ? _value.asOf
          // ignore: cast_nullable_to_non_nullable
          : asOf as DateTime,
      voteWeight: voteWeight == const $CopyWithPlaceholder()
          ? _value.voteWeight
          // ignore: cast_nullable_to_non_nullable
          : voteWeight as EligibilitySnapshotVoteWeightEnum,
      shareBasis: shareBasis == const $CopyWithPlaceholder()
          ? _value.shareBasis
          // ignore: cast_nullable_to_non_nullable
          : shareBasis as String,
      unitCount: unitCount == const $CopyWithPlaceholder()
          ? _value.unitCount
          // ignore: cast_nullable_to_non_nullable
          : unitCount as int,
      totalVotes: totalVotes == const $CopyWithPlaceholder()
          ? _value.totalVotes
          // ignore: cast_nullable_to_non_nullable
          : totalVotes as int,
      totalShare: totalShare == const $CopyWithPlaceholder()
          ? _value.totalShare
          // ignore: cast_nullable_to_non_nullable
          : totalShare as num,
      owners: owners == const $CopyWithPlaceholder()
          ? _value.owners
          // ignore: cast_nullable_to_non_nullable
          : owners as List<EligibilityOwner>,
      unrepresentedUnits: unrepresentedUnits == const $CopyWithPlaceholder()
          ? _value.unrepresentedUnits
          // ignore: cast_nullable_to_non_nullable
          : unrepresentedUnits as List<String>,
    );
  }
}

extension $EligibilitySnapshotCopyWith on EligibilitySnapshot {
  /// Returns a callable class that can be used as follows: `instanceOfEligibilitySnapshot.copyWith(...)` or like so:`instanceOfEligibilitySnapshot.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EligibilitySnapshotCWProxy get copyWith =>
      _$EligibilitySnapshotCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EligibilitySnapshot _$EligibilitySnapshotFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'EligibilitySnapshot',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'taken_at',
        'as_of',
        'vote_weight',
        'share_basis',
        'unit_count',
        'total_votes',
        'total_share',
        'owners',
        'unrepresented_units',
      ],
    );
    final val = EligibilitySnapshot(
      takenAt: $checkedConvert('taken_at', (v) => DateTime.parse(v as String)),
      asOf: $checkedConvert('as_of', (v) => DateTime.parse(v as String)),
      voteWeight: $checkedConvert(
        'vote_weight',
        (v) => $enumDecode(
          _$EligibilitySnapshotVoteWeightEnumEnumMap,
          v,
          unknownValue: EligibilitySnapshotVoteWeightEnum.unknownDefaultOpenApi,
        ),
      ),
      shareBasis: $checkedConvert('share_basis', (v) => v as String),
      unitCount: $checkedConvert('unit_count', (v) => (v as num).toInt()),
      totalVotes: $checkedConvert('total_votes', (v) => (v as num).toInt()),
      totalShare: $checkedConvert('total_share', (v) => v as num),
      owners: $checkedConvert(
        'owners',
        (v) => (v as List<dynamic>)
            .map((e) => EligibilityOwner.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      unrepresentedUnits: $checkedConvert(
        'unrepresented_units',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'takenAt': 'taken_at',
    'asOf': 'as_of',
    'voteWeight': 'vote_weight',
    'shareBasis': 'share_basis',
    'unitCount': 'unit_count',
    'totalVotes': 'total_votes',
    'totalShare': 'total_share',
    'unrepresentedUnits': 'unrepresented_units',
  },
);

Map<String, dynamic> _$EligibilitySnapshotToJson(
  EligibilitySnapshot instance,
) => <String, dynamic>{
  'taken_at': instance.takenAt.toIso8601String(),
  'as_of': instance.asOf.toIso8601String(),
  'vote_weight':
      _$EligibilitySnapshotVoteWeightEnumEnumMap[instance.voteWeight]!,
  'share_basis': instance.shareBasis,
  'unit_count': instance.unitCount,
  'total_votes': instance.totalVotes,
  'total_share': instance.totalShare,
  'owners': instance.owners.map((e) => e.toJson()).toList(),
  'unrepresented_units': instance.unrepresentedUnits,
};

const _$EligibilitySnapshotVoteWeightEnumEnumMap = {
  EligibilitySnapshotVoteWeightEnum.perUnit: 'per_unit',
  EligibilitySnapshotVoteWeightEnum.perOwner: 'per_owner',
  EligibilitySnapshotVoteWeightEnum.unknownDefaultOpenApi:
      'unknown_default_open_api',
};
