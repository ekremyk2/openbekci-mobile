// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InvitationCWProxy {
  Invitation id(String id);

  Invitation orgId(String orgId);

  Invitation kind(InvitationKindEnum kind);

  Invitation siteId(String siteId);

  Invitation personId(String? personId);

  Invitation unitId(String? unitId);

  Invitation channel(InvitationChannelEnum channel);

  Invitation destination(String destination);

  Invitation status(InvitationStatusEnum status);

  Invitation expiresAt(DateTime expiresAt);

  Invitation acceptedAt(DateTime? acceptedAt);

  Invitation invitedBy(String? invitedBy);

  Invitation createdAt(DateTime createdAt);

  Invitation updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Invitation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Invitation(...).copyWith(id: 12, name: "My name")
  /// ````
  Invitation call({
    String id,
    String orgId,
    InvitationKindEnum kind,
    String siteId,
    String? personId,
    String? unitId,
    InvitationChannelEnum channel,
    String destination,
    InvitationStatusEnum status,
    DateTime expiresAt,
    DateTime? acceptedAt,
    String? invitedBy,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInvitation.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInvitation.copyWith.fieldName(...)`
class _$InvitationCWProxyImpl implements _$InvitationCWProxy {
  const _$InvitationCWProxyImpl(this._value);

  final Invitation _value;

  @override
  Invitation id(String id) => this(id: id);

  @override
  Invitation orgId(String orgId) => this(orgId: orgId);

  @override
  Invitation kind(InvitationKindEnum kind) => this(kind: kind);

  @override
  Invitation siteId(String siteId) => this(siteId: siteId);

  @override
  Invitation personId(String? personId) => this(personId: personId);

  @override
  Invitation unitId(String? unitId) => this(unitId: unitId);

  @override
  Invitation channel(InvitationChannelEnum channel) => this(channel: channel);

  @override
  Invitation destination(String destination) => this(destination: destination);

  @override
  Invitation status(InvitationStatusEnum status) => this(status: status);

  @override
  Invitation expiresAt(DateTime expiresAt) => this(expiresAt: expiresAt);

  @override
  Invitation acceptedAt(DateTime? acceptedAt) => this(acceptedAt: acceptedAt);

  @override
  Invitation invitedBy(String? invitedBy) => this(invitedBy: invitedBy);

  @override
  Invitation createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Invitation updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Invitation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Invitation(...).copyWith(id: 12, name: "My name")
  /// ````
  Invitation call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
    Object? siteId = const $CopyWithPlaceholder(),
    Object? personId = const $CopyWithPlaceholder(),
    Object? unitId = const $CopyWithPlaceholder(),
    Object? channel = const $CopyWithPlaceholder(),
    Object? destination = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
    Object? acceptedAt = const $CopyWithPlaceholder(),
    Object? invitedBy = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return Invitation(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      orgId: orgId == const $CopyWithPlaceholder()
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String,
      kind: kind == const $CopyWithPlaceholder()
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as InvitationKindEnum,
      siteId: siteId == const $CopyWithPlaceholder()
          ? _value.siteId
          // ignore: cast_nullable_to_non_nullable
          : siteId as String,
      personId: personId == const $CopyWithPlaceholder()
          ? _value.personId
          // ignore: cast_nullable_to_non_nullable
          : personId as String?,
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as String?,
      channel: channel == const $CopyWithPlaceholder()
          ? _value.channel
          // ignore: cast_nullable_to_non_nullable
          : channel as InvitationChannelEnum,
      destination: destination == const $CopyWithPlaceholder()
          ? _value.destination
          // ignore: cast_nullable_to_non_nullable
          : destination as String,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as InvitationStatusEnum,
      expiresAt: expiresAt == const $CopyWithPlaceholder()
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as DateTime,
      acceptedAt: acceptedAt == const $CopyWithPlaceholder()
          ? _value.acceptedAt
          // ignore: cast_nullable_to_non_nullable
          : acceptedAt as DateTime?,
      invitedBy: invitedBy == const $CopyWithPlaceholder()
          ? _value.invitedBy
          // ignore: cast_nullable_to_non_nullable
          : invitedBy as String?,
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

extension $InvitationCopyWith on Invitation {
  /// Returns a callable class that can be used as follows: `instanceOfInvitation.copyWith(...)` or like so:`instanceOfInvitation.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InvitationCWProxy get copyWith => _$InvitationCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invitation _$InvitationFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Invitation',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'org_id',
        'kind',
        'site_id',
        'person_id',
        'unit_id',
        'channel',
        'destination',
        'status',
        'expires_at',
        'accepted_at',
        'invited_by',
        'created_at',
        'updated_at',
      ],
    );
    final val = Invitation(
      id: $checkedConvert('id', (v) => v as String),
      orgId: $checkedConvert('org_id', (v) => v as String),
      kind: $checkedConvert(
        'kind',
        (v) => $enumDecode(
          _$InvitationKindEnumEnumMap,
          v,
          unknownValue: InvitationKindEnum.unknownDefaultOpenApi,
        ),
      ),
      siteId: $checkedConvert('site_id', (v) => v as String),
      personId: $checkedConvert('person_id', (v) => v as String?),
      unitId: $checkedConvert('unit_id', (v) => v as String?),
      channel: $checkedConvert(
        'channel',
        (v) => $enumDecode(
          _$InvitationChannelEnumEnumMap,
          v,
          unknownValue: InvitationChannelEnum.unknownDefaultOpenApi,
        ),
      ),
      destination: $checkedConvert('destination', (v) => v as String),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(
          _$InvitationStatusEnumEnumMap,
          v,
          unknownValue: InvitationStatusEnum.unknownDefaultOpenApi,
        ),
      ),
      expiresAt: $checkedConvert(
        'expires_at',
        (v) => DateTime.parse(v as String),
      ),
      acceptedAt: $checkedConvert(
        'accepted_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      invitedBy: $checkedConvert('invited_by', (v) => v as String?),
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
    'siteId': 'site_id',
    'personId': 'person_id',
    'unitId': 'unit_id',
    'expiresAt': 'expires_at',
    'acceptedAt': 'accepted_at',
    'invitedBy': 'invited_by',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$InvitationToJson(Invitation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'org_id': instance.orgId,
      'kind': _$InvitationKindEnumEnumMap[instance.kind]!,
      'site_id': instance.siteId,
      'person_id': instance.personId,
      'unit_id': instance.unitId,
      'channel': _$InvitationChannelEnumEnumMap[instance.channel]!,
      'destination': instance.destination,
      'status': _$InvitationStatusEnumEnumMap[instance.status]!,
      'expires_at': instance.expiresAt.toIso8601String(),
      'accepted_at': instance.acceptedAt?.toIso8601String(),
      'invited_by': instance.invitedBy,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$InvitationKindEnumEnumMap = {
  InvitationKindEnum.manager: 'manager',
  InvitationKindEnum.siteCode: 'site_code',
  InvitationKindEnum.household: 'household',
  InvitationKindEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};

const _$InvitationChannelEnumEnumMap = {
  InvitationChannelEnum.sms: 'sms',
  InvitationChannelEnum.email: 'email',
  InvitationChannelEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};

const _$InvitationStatusEnumEnumMap = {
  InvitationStatusEnum.pending: 'pending',
  InvitationStatusEnum.accepted: 'accepted',
  InvitationStatusEnum.expired: 'expired',
  InvitationStatusEnum.revoked: 'revoked',
  InvitationStatusEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
