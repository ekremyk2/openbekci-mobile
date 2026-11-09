// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_assignee.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketAssigneeCWProxy {
  TicketAssignee kind(TicketAssigneeKindEnum kind);

  TicketAssignee personId(String? personId);

  TicketAssignee vendorId(String? vendorId);

  TicketAssignee displayName(String displayName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketAssignee(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketAssignee(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketAssignee call({
    TicketAssigneeKindEnum kind,
    String? personId,
    String? vendorId,
    String displayName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketAssignee.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketAssignee.copyWith.fieldName(...)`
class _$TicketAssigneeCWProxyImpl implements _$TicketAssigneeCWProxy {
  const _$TicketAssigneeCWProxyImpl(this._value);

  final TicketAssignee _value;

  @override
  TicketAssignee kind(TicketAssigneeKindEnum kind) => this(kind: kind);

  @override
  TicketAssignee personId(String? personId) => this(personId: personId);

  @override
  TicketAssignee vendorId(String? vendorId) => this(vendorId: vendorId);

  @override
  TicketAssignee displayName(String displayName) =>
      this(displayName: displayName);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketAssignee(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketAssignee(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketAssignee call({
    Object? kind = const $CopyWithPlaceholder(),
    Object? personId = const $CopyWithPlaceholder(),
    Object? vendorId = const $CopyWithPlaceholder(),
    Object? displayName = const $CopyWithPlaceholder(),
  }) {
    return TicketAssignee(
      kind: kind == const $CopyWithPlaceholder()
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as TicketAssigneeKindEnum,
      personId: personId == const $CopyWithPlaceholder()
          ? _value.personId
          // ignore: cast_nullable_to_non_nullable
          : personId as String?,
      vendorId: vendorId == const $CopyWithPlaceholder()
          ? _value.vendorId
          // ignore: cast_nullable_to_non_nullable
          : vendorId as String?,
      displayName: displayName == const $CopyWithPlaceholder()
          ? _value.displayName
          // ignore: cast_nullable_to_non_nullable
          : displayName as String,
    );
  }
}

extension $TicketAssigneeCopyWith on TicketAssignee {
  /// Returns a callable class that can be used as follows: `instanceOfTicketAssignee.copyWith(...)` or like so:`instanceOfTicketAssignee.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketAssigneeCWProxy get copyWith => _$TicketAssigneeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketAssignee _$TicketAssigneeFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TicketAssignee',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'kind',
            'person_id',
            'vendor_id',
            'display_name',
          ],
        );
        final val = TicketAssignee(
          kind: $checkedConvert(
            'kind',
            (v) => $enumDecode(
              _$TicketAssigneeKindEnumEnumMap,
              v,
              unknownValue: TicketAssigneeKindEnum.unknownDefaultOpenApi,
            ),
          ),
          personId: $checkedConvert('person_id', (v) => v as String?),
          vendorId: $checkedConvert('vendor_id', (v) => v as String?),
          displayName: $checkedConvert('display_name', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'personId': 'person_id',
        'vendorId': 'vendor_id',
        'displayName': 'display_name',
      },
    );

Map<String, dynamic> _$TicketAssigneeToJson(TicketAssignee instance) =>
    <String, dynamic>{
      'kind': _$TicketAssigneeKindEnumEnumMap[instance.kind]!,
      'person_id': instance.personId,
      'vendor_id': instance.vendorId,
      'display_name': instance.displayName,
    };

const _$TicketAssigneeKindEnumEnumMap = {
  TicketAssigneeKindEnum.person: 'person',
  TicketAssigneeKindEnum.vendor: 'vendor',
  TicketAssigneeKindEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
