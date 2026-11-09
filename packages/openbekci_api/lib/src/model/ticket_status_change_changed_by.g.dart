// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_status_change_changed_by.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketStatusChangeChangedByCWProxy {
  TicketStatusChangeChangedBy id(String id);

  TicketStatusChangeChangedBy displayName(String displayName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketStatusChangeChangedBy(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketStatusChangeChangedBy(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketStatusChangeChangedBy call({String id, String displayName});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketStatusChangeChangedBy.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketStatusChangeChangedBy.copyWith.fieldName(...)`
class _$TicketStatusChangeChangedByCWProxyImpl
    implements _$TicketStatusChangeChangedByCWProxy {
  const _$TicketStatusChangeChangedByCWProxyImpl(this._value);

  final TicketStatusChangeChangedBy _value;

  @override
  TicketStatusChangeChangedBy id(String id) => this(id: id);

  @override
  TicketStatusChangeChangedBy displayName(String displayName) =>
      this(displayName: displayName);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketStatusChangeChangedBy(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketStatusChangeChangedBy(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketStatusChangeChangedBy call({
    Object? id = const $CopyWithPlaceholder(),
    Object? displayName = const $CopyWithPlaceholder(),
  }) {
    return TicketStatusChangeChangedBy(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      displayName: displayName == const $CopyWithPlaceholder()
          ? _value.displayName
          // ignore: cast_nullable_to_non_nullable
          : displayName as String,
    );
  }
}

extension $TicketStatusChangeChangedByCopyWith on TicketStatusChangeChangedBy {
  /// Returns a callable class that can be used as follows: `instanceOfTicketStatusChangeChangedBy.copyWith(...)` or like so:`instanceOfTicketStatusChangeChangedBy.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketStatusChangeChangedByCWProxy get copyWith =>
      _$TicketStatusChangeChangedByCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketStatusChangeChangedBy _$TicketStatusChangeChangedByFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'TicketStatusChangeChangedBy',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['id', 'display_name']);
    final val = TicketStatusChangeChangedBy(
      id: $checkedConvert('id', (v) => v as String),
      displayName: $checkedConvert('display_name', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {'displayName': 'display_name'},
);

Map<String, dynamic> _$TicketStatusChangeChangedByToJson(
  TicketStatusChangeChangedBy instance,
) => <String, dynamic>{'id': instance.id, 'display_name': instance.displayName};
