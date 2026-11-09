// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decision_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DecisionListCWProxy {
  DecisionList items(List<Decision> items);

  DecisionList nextCursor(String? nextCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DecisionList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DecisionList(...).copyWith(id: 12, name: "My name")
  /// ````
  DecisionList call({List<Decision> items, String? nextCursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDecisionList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDecisionList.copyWith.fieldName(...)`
class _$DecisionListCWProxyImpl implements _$DecisionListCWProxy {
  const _$DecisionListCWProxyImpl(this._value);

  final DecisionList _value;

  @override
  DecisionList items(List<Decision> items) => this(items: items);

  @override
  DecisionList nextCursor(String? nextCursor) => this(nextCursor: nextCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DecisionList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DecisionList(...).copyWith(id: 12, name: "My name")
  /// ````
  DecisionList call({
    Object? items = const $CopyWithPlaceholder(),
    Object? nextCursor = const $CopyWithPlaceholder(),
  }) {
    return DecisionList(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<Decision>,
      nextCursor: nextCursor == const $CopyWithPlaceholder()
          ? _value.nextCursor
          // ignore: cast_nullable_to_non_nullable
          : nextCursor as String?,
    );
  }
}

extension $DecisionListCopyWith on DecisionList {
  /// Returns a callable class that can be used as follows: `instanceOfDecisionList.copyWith(...)` or like so:`instanceOfDecisionList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DecisionListCWProxy get copyWith => _$DecisionListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DecisionList _$DecisionListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DecisionList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['items', 'next_cursor']);
      final val = DecisionList(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map((e) => Decision.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'nextCursor': 'next_cursor'});

Map<String, dynamic> _$DecisionListToJson(DecisionList instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'next_cursor': instance.nextCursor,
    };
