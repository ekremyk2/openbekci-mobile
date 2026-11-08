// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_preview.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InvitationPreviewCWProxy {
  InvitationPreview kind(InvitationPreviewKindEnum kind);

  InvitationPreview orgName(String orgName);

  InvitationPreview siteName(String siteName);

  InvitationPreview unitDoorNumber(String? unitDoorNumber);

  InvitationPreview personDisplayName(String? personDisplayName);

  InvitationPreview channel(InvitationPreviewChannelEnum channel);

  InvitationPreview expiresAt(DateTime expiresAt);

  InvitationPreview existingAccount(bool existingAccount);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InvitationPreview(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InvitationPreview(...).copyWith(id: 12, name: "My name")
  /// ````
  InvitationPreview call({
    InvitationPreviewKindEnum kind,
    String orgName,
    String siteName,
    String? unitDoorNumber,
    String? personDisplayName,
    InvitationPreviewChannelEnum channel,
    DateTime expiresAt,
    bool existingAccount,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInvitationPreview.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInvitationPreview.copyWith.fieldName(...)`
class _$InvitationPreviewCWProxyImpl implements _$InvitationPreviewCWProxy {
  const _$InvitationPreviewCWProxyImpl(this._value);

  final InvitationPreview _value;

  @override
  InvitationPreview kind(InvitationPreviewKindEnum kind) => this(kind: kind);

  @override
  InvitationPreview orgName(String orgName) => this(orgName: orgName);

  @override
  InvitationPreview siteName(String siteName) => this(siteName: siteName);

  @override
  InvitationPreview unitDoorNumber(String? unitDoorNumber) =>
      this(unitDoorNumber: unitDoorNumber);

  @override
  InvitationPreview personDisplayName(String? personDisplayName) =>
      this(personDisplayName: personDisplayName);

  @override
  InvitationPreview channel(InvitationPreviewChannelEnum channel) =>
      this(channel: channel);

  @override
  InvitationPreview expiresAt(DateTime expiresAt) => this(expiresAt: expiresAt);

  @override
  InvitationPreview existingAccount(bool existingAccount) =>
      this(existingAccount: existingAccount);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InvitationPreview(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InvitationPreview(...).copyWith(id: 12, name: "My name")
  /// ````
  InvitationPreview call({
    Object? kind = const $CopyWithPlaceholder(),
    Object? orgName = const $CopyWithPlaceholder(),
    Object? siteName = const $CopyWithPlaceholder(),
    Object? unitDoorNumber = const $CopyWithPlaceholder(),
    Object? personDisplayName = const $CopyWithPlaceholder(),
    Object? channel = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
    Object? existingAccount = const $CopyWithPlaceholder(),
  }) {
    return InvitationPreview(
      kind: kind == const $CopyWithPlaceholder()
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as InvitationPreviewKindEnum,
      orgName: orgName == const $CopyWithPlaceholder()
          ? _value.orgName
          // ignore: cast_nullable_to_non_nullable
          : orgName as String,
      siteName: siteName == const $CopyWithPlaceholder()
          ? _value.siteName
          // ignore: cast_nullable_to_non_nullable
          : siteName as String,
      unitDoorNumber: unitDoorNumber == const $CopyWithPlaceholder()
          ? _value.unitDoorNumber
          // ignore: cast_nullable_to_non_nullable
          : unitDoorNumber as String?,
      personDisplayName: personDisplayName == const $CopyWithPlaceholder()
          ? _value.personDisplayName
          // ignore: cast_nullable_to_non_nullable
          : personDisplayName as String?,
      channel: channel == const $CopyWithPlaceholder()
          ? _value.channel
          // ignore: cast_nullable_to_non_nullable
          : channel as InvitationPreviewChannelEnum,
      expiresAt: expiresAt == const $CopyWithPlaceholder()
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as DateTime,
      existingAccount: existingAccount == const $CopyWithPlaceholder()
          ? _value.existingAccount
          // ignore: cast_nullable_to_non_nullable
          : existingAccount as bool,
    );
  }
}

extension $InvitationPreviewCopyWith on InvitationPreview {
  /// Returns a callable class that can be used as follows: `instanceOfInvitationPreview.copyWith(...)` or like so:`instanceOfInvitationPreview.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InvitationPreviewCWProxy get copyWith =>
      _$InvitationPreviewCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvitationPreview _$InvitationPreviewFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'InvitationPreview',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'kind',
        'org_name',
        'site_name',
        'unit_door_number',
        'person_display_name',
        'channel',
        'expires_at',
        'existing_account',
      ],
    );
    final val = InvitationPreview(
      kind: $checkedConvert(
        'kind',
        (v) => $enumDecode(
          _$InvitationPreviewKindEnumEnumMap,
          v,
          unknownValue: InvitationPreviewKindEnum.unknownDefaultOpenApi,
        ),
      ),
      orgName: $checkedConvert('org_name', (v) => v as String),
      siteName: $checkedConvert('site_name', (v) => v as String),
      unitDoorNumber: $checkedConvert('unit_door_number', (v) => v as String?),
      personDisplayName: $checkedConvert(
        'person_display_name',
        (v) => v as String?,
      ),
      channel: $checkedConvert(
        'channel',
        (v) => $enumDecode(
          _$InvitationPreviewChannelEnumEnumMap,
          v,
          unknownValue: InvitationPreviewChannelEnum.unknownDefaultOpenApi,
        ),
      ),
      expiresAt: $checkedConvert(
        'expires_at',
        (v) => DateTime.parse(v as String),
      ),
      existingAccount: $checkedConvert('existing_account', (v) => v as bool),
    );
    return val;
  },
  fieldKeyMap: const {
    'orgName': 'org_name',
    'siteName': 'site_name',
    'unitDoorNumber': 'unit_door_number',
    'personDisplayName': 'person_display_name',
    'expiresAt': 'expires_at',
    'existingAccount': 'existing_account',
  },
);

Map<String, dynamic> _$InvitationPreviewToJson(InvitationPreview instance) =>
    <String, dynamic>{
      'kind': _$InvitationPreviewKindEnumEnumMap[instance.kind]!,
      'org_name': instance.orgName,
      'site_name': instance.siteName,
      'unit_door_number': instance.unitDoorNumber,
      'person_display_name': instance.personDisplayName,
      'channel': _$InvitationPreviewChannelEnumEnumMap[instance.channel]!,
      'expires_at': instance.expiresAt.toIso8601String(),
      'existing_account': instance.existingAccount,
    };

const _$InvitationPreviewKindEnumEnumMap = {
  InvitationPreviewKindEnum.manager: 'manager',
  InvitationPreviewKindEnum.siteCode: 'site_code',
  InvitationPreviewKindEnum.household: 'household',
  InvitationPreviewKindEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};

const _$InvitationPreviewChannelEnumEnumMap = {
  InvitationPreviewChannelEnum.sms: 'sms',
  InvitationPreviewChannelEnum.email: 'email',
  InvitationPreviewChannelEnum.unknownDefaultOpenApi:
      'unknown_default_open_api',
};
