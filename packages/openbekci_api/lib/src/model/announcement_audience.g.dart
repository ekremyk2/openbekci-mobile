// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_audience.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AnnouncementAudienceCWProxy {
  AnnouncementAudience kind(AnnouncementAudienceKindEnum kind);

  AnnouncementAudience blockId(String? blockId);

  AnnouncementAudience unitIds(List<String>? unitIds);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnnouncementAudience(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnnouncementAudience(...).copyWith(id: 12, name: "My name")
  /// ````
  AnnouncementAudience call({
    AnnouncementAudienceKindEnum kind,
    String? blockId,
    List<String>? unitIds,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAnnouncementAudience.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAnnouncementAudience.copyWith.fieldName(...)`
class _$AnnouncementAudienceCWProxyImpl
    implements _$AnnouncementAudienceCWProxy {
  const _$AnnouncementAudienceCWProxyImpl(this._value);

  final AnnouncementAudience _value;

  @override
  AnnouncementAudience kind(AnnouncementAudienceKindEnum kind) =>
      this(kind: kind);

  @override
  AnnouncementAudience blockId(String? blockId) => this(blockId: blockId);

  @override
  AnnouncementAudience unitIds(List<String>? unitIds) => this(unitIds: unitIds);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnnouncementAudience(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnnouncementAudience(...).copyWith(id: 12, name: "My name")
  /// ````
  AnnouncementAudience call({
    Object? kind = const $CopyWithPlaceholder(),
    Object? blockId = const $CopyWithPlaceholder(),
    Object? unitIds = const $CopyWithPlaceholder(),
  }) {
    return AnnouncementAudience(
      kind: kind == const $CopyWithPlaceholder()
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as AnnouncementAudienceKindEnum,
      blockId: blockId == const $CopyWithPlaceholder()
          ? _value.blockId
          // ignore: cast_nullable_to_non_nullable
          : blockId as String?,
      unitIds: unitIds == const $CopyWithPlaceholder()
          ? _value.unitIds
          // ignore: cast_nullable_to_non_nullable
          : unitIds as List<String>?,
    );
  }
}

extension $AnnouncementAudienceCopyWith on AnnouncementAudience {
  /// Returns a callable class that can be used as follows: `instanceOfAnnouncementAudience.copyWith(...)` or like so:`instanceOfAnnouncementAudience.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AnnouncementAudienceCWProxy get copyWith =>
      _$AnnouncementAudienceCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementAudience _$AnnouncementAudienceFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'AnnouncementAudience',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['kind']);
    final val = AnnouncementAudience(
      kind: $checkedConvert(
        'kind',
        (v) => $enumDecode(
          _$AnnouncementAudienceKindEnumEnumMap,
          v,
          unknownValue: AnnouncementAudienceKindEnum.unknownDefaultOpenApi,
        ),
      ),
      blockId: $checkedConvert('block_id', (v) => v as String?),
      unitIds: $checkedConvert(
        'unit_ids',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'blockId': 'block_id', 'unitIds': 'unit_ids'},
);

Map<String, dynamic> _$AnnouncementAudienceToJson(
  AnnouncementAudience instance,
) => <String, dynamic>{
  'kind': _$AnnouncementAudienceKindEnumEnumMap[instance.kind]!,
  'block_id': ?instance.blockId,
  'unit_ids': ?instance.unitIds,
};

const _$AnnouncementAudienceKindEnumEnumMap = {
  AnnouncementAudienceKindEnum.site: 'site',
  AnnouncementAudienceKindEnum.block: 'block',
  AnnouncementAudienceKindEnum.owners: 'owners',
  AnnouncementAudienceKindEnum.tenants: 'tenants',
  AnnouncementAudienceKindEnum.units: 'units',
  AnnouncementAudienceKindEnum.unknownDefaultOpenApi:
      'unknown_default_open_api',
};
