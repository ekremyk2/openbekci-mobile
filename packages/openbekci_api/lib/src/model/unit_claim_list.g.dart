// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_claim_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UnitClaimListCWProxy {
  UnitClaimList items(List<UnitClaim> items);

  UnitClaimList nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UnitClaimList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UnitClaimList(...).copyWith(id: 12, name: "My name")
  /// ````
  UnitClaimList call({List<UnitClaim> items, String? nextCursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUnitClaimList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUnitClaimList.copyWith.fieldName(...)`
class _$UnitClaimListCWProxyImpl implements _$UnitClaimListCWProxy {
  const _$UnitClaimListCWProxyImpl(this._value);

  final UnitClaimList _value;

  @override
  UnitClaimList items(List<UnitClaim> items) => this(items: items);

  @override
  UnitClaimList nextCursor(String? nextCursor) => this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UnitClaimList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UnitClaimList(...).copyWith(id: 12, name: "My name")
  /// ````
  UnitClaimList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return UnitClaimList(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<UnitClaim>,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $UnitClaimListCopyWith on UnitClaimList {
  /// Returns a callable class that can be used as follows: `instanceOfUnitClaimList.copyWith(...)` or like so:`instanceOfUnitClaimList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UnitClaimListCWProxy get copyWith => _$UnitClaimListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitClaimList _$UnitClaimListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UnitClaimList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'next_cursor']);
      final val = UnitClaimList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => UnitClaim.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'nextCursor': 'next_cursor'});

Map<String, dynamic> _$UnitClaimListToJson(UnitClaimList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'next_cursor': instance.nextCursor,
    };
