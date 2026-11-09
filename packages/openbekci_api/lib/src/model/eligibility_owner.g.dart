// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eligibility_owner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EligibilityOwnerCWProxy {
  EligibilityOwner personId(String personId);

  EligibilityOwner displayName(String displayName);

  EligibilityOwner unitIds(List<String> unitIds);

  EligibilityOwner unitLabels(List<String> unitLabels);

  EligibilityOwner share(String share);

  EligibilityOwner voteWeight(int voteWeight);

  EligibilityOwner representativeOfUnitIds(
    List<String> representativeOfUnitIds,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EligibilityOwner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EligibilityOwner(...).copyWith(id: 12, name: "My name")
  /// ````
  EligibilityOwner call({
    String personId,
    String displayName,
    List<String> unitIds,
    List<String> unitLabels,
    String share,
    int voteWeight,
    List<String> representativeOfUnitIds,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEligibilityOwner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEligibilityOwner.copyWith.fieldName(...)`
class _$EligibilityOwnerCWProxyImpl implements _$EligibilityOwnerCWProxy {
  const _$EligibilityOwnerCWProxyImpl(this._value);

  final EligibilityOwner _value;

  @override
  EligibilityOwner personId(String personId) => this(personId: personId);

  @override
  EligibilityOwner displayName(String displayName) =>
      this(displayName: displayName);

  @override
  EligibilityOwner unitIds(List<String> unitIds) => this(unitIds: unitIds);

  @override
  EligibilityOwner unitLabels(List<String> unitLabels) =>
      this(unitLabels: unitLabels);

  @override
  EligibilityOwner share(String share) => this(share: share);

  @override
  EligibilityOwner voteWeight(int voteWeight) => this(voteWeight: voteWeight);

  @override
  EligibilityOwner representativeOfUnitIds(
    List<String> representativeOfUnitIds,
  ) => this(representativeOfUnitIds: representativeOfUnitIds);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EligibilityOwner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EligibilityOwner(...).copyWith(id: 12, name: "My name")
  /// ````
  EligibilityOwner call({
    Object? personId = const $CopyWithPlaceholder(),
    Object? displayName = const $CopyWithPlaceholder(),
    Object? unitIds = const $CopyWithPlaceholder(),
    Object? unitLabels = const $CopyWithPlaceholder(),
    Object? share = const $CopyWithPlaceholder(),
    Object? voteWeight = const $CopyWithPlaceholder(),
    Object? representativeOfUnitIds = const $CopyWithPlaceholder(),
  }) {
    return EligibilityOwner(
      personId: personId == const $CopyWithPlaceholder()
          ? _value.personId
          // ignore: cast_nullable_to_non_nullable
          : personId as String,
      displayName: displayName == const $CopyWithPlaceholder()
          ? _value.displayName
          // ignore: cast_nullable_to_non_nullable
          : displayName as String,
      unitIds: unitIds == const $CopyWithPlaceholder()
          ? _value.unitIds
          // ignore: cast_nullable_to_non_nullable
          : unitIds as List<String>,
      unitLabels: unitLabels == const $CopyWithPlaceholder()
          ? _value.unitLabels
          // ignore: cast_nullable_to_non_nullable
          : unitLabels as List<String>,
      share: share == const $CopyWithPlaceholder()
          ? _value.share
          // ignore: cast_nullable_to_non_nullable
          : share as String,
      voteWeight: voteWeight == const $CopyWithPlaceholder()
          ? _value.voteWeight
          // ignore: cast_nullable_to_non_nullable
          : voteWeight as int,
      representativeOfUnitIds:
          representativeOfUnitIds == const $CopyWithPlaceholder()
          ? _value.representativeOfUnitIds
          // ignore: cast_nullable_to_non_nullable
          : representativeOfUnitIds as List<String>,
    );
  }
}

extension $EligibilityOwnerCopyWith on EligibilityOwner {
  /// Returns a callable class that can be used as follows: `instanceOfEligibilityOwner.copyWith(...)` or like so:`instanceOfEligibilityOwner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EligibilityOwnerCWProxy get copyWith => _$EligibilityOwnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EligibilityOwner _$EligibilityOwnerFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'EligibilityOwner',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'person_id',
            'display_name',
            'unit_ids',
            'unit_labels',
            'share',
            'vote_weight',
            'representative_of_unit_ids',
          ],
        );
        final val = EligibilityOwner(
          personId: $checkedConvert('person_id', (v) => v as String),
          displayName: $checkedConvert('display_name', (v) => v as String),
          unitIds: $checkedConvert(
            'unit_ids',
            (v) => (v as List<dynamic>).map((e) => e as String).toList(),
          ),
          unitLabels: $checkedConvert(
            'unit_labels',
            (v) => (v as List<dynamic>).map((e) => e as String).toList(),
          ),
          share: $checkedConvert('share', (v) => v as String),
          voteWeight: $checkedConvert('vote_weight', (v) => (v as num).toInt()),
          representativeOfUnitIds: $checkedConvert(
            'representative_of_unit_ids',
            (v) => (v as List<dynamic>).map((e) => e as String).toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'personId': 'person_id',
        'displayName': 'display_name',
        'unitIds': 'unit_ids',
        'unitLabels': 'unit_labels',
        'voteWeight': 'vote_weight',
        'representativeOfUnitIds': 'representative_of_unit_ids',
      },
    );

Map<String, dynamic> _$EligibilityOwnerToJson(EligibilityOwner instance) =>
    <String, dynamic>{
      'person_id': instance.personId,
      'display_name': instance.displayName,
      'unit_ids': instance.unitIds,
      'unit_labels': instance.unitLabels,
      'share': instance.share,
      'vote_weight': instance.voteWeight,
      'representative_of_unit_ids': instance.representativeOfUnitIds,
    };
