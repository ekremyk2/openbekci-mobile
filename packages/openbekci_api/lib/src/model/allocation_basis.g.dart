// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allocation_basis.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AllocationBasisCWProxy {
  AllocationBasis keyCode(String keyCode);

  AllocationBasis weight(num weight);

  AllocationBasis totalWeight(num totalWeight);

  AllocationBasis remainderAdjusted(bool remainderAdjusted);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AllocationBasis(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AllocationBasis(...).copyWith(id: 12, name: "My name")
  /// ````
  AllocationBasis call({
    String keyCode,
    num weight,
    num totalWeight,
    bool remainderAdjusted,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAllocationBasis.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAllocationBasis.copyWith.fieldName(...)`
class _$AllocationBasisCWProxyImpl implements _$AllocationBasisCWProxy {
  const _$AllocationBasisCWProxyImpl(this._value);

  final AllocationBasis _value;

  @override
  AllocationBasis keyCode(String keyCode) => this(keyCode: keyCode);

  @override
  AllocationBasis weight(num weight) => this(weight: weight);

  @override
  AllocationBasis totalWeight(num totalWeight) =>
      this(totalWeight: totalWeight);

  @override
  AllocationBasis remainderAdjusted(bool remainderAdjusted) =>
      this(remainderAdjusted: remainderAdjusted);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AllocationBasis(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AllocationBasis(...).copyWith(id: 12, name: "My name")
  /// ````
  AllocationBasis call({
    Object? keyCode = const $CopyWithPlaceholder(),
    Object? weight = const $CopyWithPlaceholder(),
    Object? totalWeight = const $CopyWithPlaceholder(),
    Object? remainderAdjusted = const $CopyWithPlaceholder(),
  }) {
    return AllocationBasis(
      keyCode: keyCode == const $CopyWithPlaceholder()
          ? _value.keyCode
          // ignore: cast_nullable_to_non_nullable
          : keyCode as String,
      weight: weight == const $CopyWithPlaceholder()
          ? _value.weight
          // ignore: cast_nullable_to_non_nullable
          : weight as num,
      totalWeight: totalWeight == const $CopyWithPlaceholder()
          ? _value.totalWeight
          // ignore: cast_nullable_to_non_nullable
          : totalWeight as num,
      remainderAdjusted: remainderAdjusted == const $CopyWithPlaceholder()
          ? _value.remainderAdjusted
          // ignore: cast_nullable_to_non_nullable
          : remainderAdjusted as bool,
    );
  }
}

extension $AllocationBasisCopyWith on AllocationBasis {
  /// Returns a callable class that can be used as follows: `instanceOfAllocationBasis.copyWith(...)` or like so:`instanceOfAllocationBasis.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AllocationBasisCWProxy get copyWith => _$AllocationBasisCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllocationBasis _$AllocationBasisFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AllocationBasis',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'key_code',
            'weight',
            'total_weight',
            'remainder_adjusted',
          ],
        );
        final val = AllocationBasis(
          keyCode: $checkedConvert('key_code', (v) => v as String),
          weight: $checkedConvert('weight', (v) => v as num),
          totalWeight: $checkedConvert('total_weight', (v) => v as num),
          remainderAdjusted: $checkedConvert(
            'remainder_adjusted',
            (v) => v as bool,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'keyCode': 'key_code',
        'totalWeight': 'total_weight',
        'remainderAdjusted': 'remainder_adjusted',
      },
    );

Map<String, dynamic> _$AllocationBasisToJson(AllocationBasis instance) =>
    <String, dynamic>{
      'key_code': instance.keyCode,
      'weight': instance.weight,
      'total_weight': instance.totalWeight,
      'remainder_adjusted': instance.remainderAdjusted,
    };
