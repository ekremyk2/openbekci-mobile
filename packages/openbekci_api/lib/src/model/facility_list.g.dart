// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FacilityListCWProxy {
  FacilityList items(List<Facility> items);

  FacilityList nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FacilityList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FacilityList(...).copyWith(id: 12, name: "My name")
  /// ````
  FacilityList call({List<Facility> items, String? nextCursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFacilityList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFacilityList.copyWith.fieldName(...)`
class _$FacilityListCWProxyImpl implements _$FacilityListCWProxy {
  const _$FacilityListCWProxyImpl(this._value);

  final FacilityList _value;

  @override
  FacilityList items(List<Facility> items) => this(items: items);

  @override
  FacilityList nextCursor(String? nextCursor) => this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FacilityList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FacilityList(...).copyWith(id: 12, name: "My name")
  /// ````
  FacilityList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return FacilityList(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<Facility>,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $FacilityListCopyWith on FacilityList {
  /// Returns a callable class that can be used as follows: `instanceOfFacilityList.copyWith(...)` or like so:`instanceOfFacilityList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FacilityListCWProxy get copyWith => _$FacilityListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilityList _$FacilityListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FacilityList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'next_cursor']);
      final val = FacilityList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => Facility.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'nextCursor': 'next_cursor'});

Map<String, dynamic> _$FacilityListToJson(FacilityList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'next_cursor': instance.nextCursor,
    };
