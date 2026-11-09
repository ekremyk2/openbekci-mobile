// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_status_change.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketStatusChangeCWProxy {
  TicketStatusChange id(String id);

  TicketStatusChange orgId(String orgId);

  TicketStatusChange ticketId(String ticketId);

  TicketStatusChange fromStatusId(String? fromStatusId);

  TicketStatusChange fromStatusName(String? fromStatusName);

  TicketStatusChange toStatusId(String toStatusId);

  TicketStatusChange toStatusName(String toStatusName);

  TicketStatusChange changedBy(TicketStatusChangeChangedBy? changedBy);

  TicketStatusChange comment(String? comment);

  TicketStatusChange at(DateTime at);

  TicketStatusChange createdAt(DateTime createdAt);

  TicketStatusChange updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketStatusChange(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketStatusChange(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketStatusChange call({
    String id,
    String orgId,
    String ticketId,
    String? fromStatusId,
    String? fromStatusName,
    String toStatusId,
    String toStatusName,
    TicketStatusChangeChangedBy? changedBy,
    String? comment,
    DateTime at,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketStatusChange.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketStatusChange.copyWith.fieldName(...)`
class _$TicketStatusChangeCWProxyImpl implements _$TicketStatusChangeCWProxy {
  const _$TicketStatusChangeCWProxyImpl(this._value);

  final TicketStatusChange _value;

  @override
  TicketStatusChange id(String id) => this(id: id);

  @override
  TicketStatusChange orgId(String orgId) => this(orgId: orgId);

  @override
  TicketStatusChange ticketId(String ticketId) => this(ticketId: ticketId);

  @override
  TicketStatusChange fromStatusId(String? fromStatusId) =>
      this(fromStatusId: fromStatusId);

  @override
  TicketStatusChange fromStatusName(String? fromStatusName) =>
      this(fromStatusName: fromStatusName);

  @override
  TicketStatusChange toStatusId(String toStatusId) =>
      this(toStatusId: toStatusId);

  @override
  TicketStatusChange toStatusName(String toStatusName) =>
      this(toStatusName: toStatusName);

  @override
  TicketStatusChange changedBy(TicketStatusChangeChangedBy? changedBy) =>
      this(changedBy: changedBy);

  @override
  TicketStatusChange comment(String? comment) => this(comment: comment);

  @override
  TicketStatusChange at(DateTime at) => this(at: at);

  @override
  TicketStatusChange createdAt(DateTime createdAt) =>
      this(createdAt: createdAt);

  @override
  TicketStatusChange updatedAt(DateTime updatedAt) =>
      this(updatedAt: updatedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketStatusChange(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketStatusChange(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketStatusChange call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? ticketId = const $CopyWithPlaceholder(),
    Object? fromStatusId = const $CopyWithPlaceholder(),
    Object? fromStatusName = const $CopyWithPlaceholder(),
    Object? toStatusId = const $CopyWithPlaceholder(),
    Object? toStatusName = const $CopyWithPlaceholder(),
    Object? changedBy = const $CopyWithPlaceholder(),
    Object? comment = const $CopyWithPlaceholder(),
    Object? at = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return TicketStatusChange(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      orgId: orgId == const $CopyWithPlaceholder()
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String,
      ticketId: ticketId == const $CopyWithPlaceholder()
          ? _value.ticketId
          // ignore: cast_nullable_to_non_nullable
          : ticketId as String,
      fromStatusId: fromStatusId == const $CopyWithPlaceholder()
          ? _value.fromStatusId
          // ignore: cast_nullable_to_non_nullable
          : fromStatusId as String?,
      fromStatusName: fromStatusName == const $CopyWithPlaceholder()
          ? _value.fromStatusName
          // ignore: cast_nullable_to_non_nullable
          : fromStatusName as String?,
      toStatusId: toStatusId == const $CopyWithPlaceholder()
          ? _value.toStatusId
          // ignore: cast_nullable_to_non_nullable
          : toStatusId as String,
      toStatusName: toStatusName == const $CopyWithPlaceholder()
          ? _value.toStatusName
          // ignore: cast_nullable_to_non_nullable
          : toStatusName as String,
      changedBy: changedBy == const $CopyWithPlaceholder()
          ? _value.changedBy
          // ignore: cast_nullable_to_non_nullable
          : changedBy as TicketStatusChangeChangedBy?,
      comment: comment == const $CopyWithPlaceholder()
          ? _value.comment
          // ignore: cast_nullable_to_non_nullable
          : comment as String?,
      at: at == const $CopyWithPlaceholder()
          ? _value.at
          // ignore: cast_nullable_to_non_nullable
          : at as DateTime,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
    );
  }
}

extension $TicketStatusChangeCopyWith on TicketStatusChange {
  /// Returns a callable class that can be used as follows: `instanceOfTicketStatusChange.copyWith(...)` or like so:`instanceOfTicketStatusChange.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketStatusChangeCWProxy get copyWith =>
      _$TicketStatusChangeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketStatusChange _$TicketStatusChangeFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'TicketStatusChange',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'org_id',
        'ticket_id',
        'from_status_id',
        'from_status_name',
        'to_status_id',
        'to_status_name',
        'changed_by',
        'comment',
        'at',
        'created_at',
        'updated_at',
      ],
    );
    final val = TicketStatusChange(
      id: $checkedConvert('id', (v) => v as String),
      orgId: $checkedConvert('org_id', (v) => v as String),
      ticketId: $checkedConvert('ticket_id', (v) => v as String),
      fromStatusId: $checkedConvert('from_status_id', (v) => v as String?),
      fromStatusName: $checkedConvert('from_status_name', (v) => v as String?),
      toStatusId: $checkedConvert('to_status_id', (v) => v as String),
      toStatusName: $checkedConvert('to_status_name', (v) => v as String),
      changedBy: $checkedConvert(
        'changed_by',
        (v) => v == null
            ? null
            : TicketStatusChangeChangedBy.fromJson(v as Map<String, dynamic>),
      ),
      comment: $checkedConvert('comment', (v) => v as String?),
      at: $checkedConvert('at', (v) => DateTime.parse(v as String)),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'orgId': 'org_id',
    'ticketId': 'ticket_id',
    'fromStatusId': 'from_status_id',
    'fromStatusName': 'from_status_name',
    'toStatusId': 'to_status_id',
    'toStatusName': 'to_status_name',
    'changedBy': 'changed_by',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$TicketStatusChangeToJson(TicketStatusChange instance) =>
    <String, dynamic>{
      'id': instance.id,
      'org_id': instance.orgId,
      'ticket_id': instance.ticketId,
      'from_status_id': instance.fromStatusId,
      'from_status_name': instance.fromStatusName,
      'to_status_id': instance.toStatusId,
      'to_status_name': instance.toStatusName,
      'changed_by': instance.changedBy?.toJson(),
      'comment': instance.comment,
      'at': instance.at.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
