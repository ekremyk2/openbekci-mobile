// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AccessSettingsCWProxy {
  AccessSettings offlineGraceHours(int offlineGraceHours);

  AccessSettings agentSilentMinutes(int agentSilentMinutes);

  AccessSettings plateMatch(AccessSettingsPlateMatchEnum plateMatch);

  AccessSettings maintenanceHour(int? maintenanceHour);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccessSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccessSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  AccessSettings call({
    int offlineGraceHours,
    int agentSilentMinutes,
    AccessSettingsPlateMatchEnum plateMatch,
    int? maintenanceHour,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAccessSettings.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAccessSettings.copyWith.fieldName(...)`
class _$AccessSettingsCWProxyImpl implements _$AccessSettingsCWProxy {
  const _$AccessSettingsCWProxyImpl(this._value);

  final AccessSettings _value;

  @override
  AccessSettings offlineGraceHours(int offlineGraceHours) =>
      this(offlineGraceHours: offlineGraceHours);

  @override
  AccessSettings agentSilentMinutes(int agentSilentMinutes) =>
      this(agentSilentMinutes: agentSilentMinutes);

  @override
  AccessSettings plateMatch(AccessSettingsPlateMatchEnum plateMatch) =>
      this(plateMatch: plateMatch);

  @override
  AccessSettings maintenanceHour(int? maintenanceHour) =>
      this(maintenanceHour: maintenanceHour);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccessSettings(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccessSettings(...).copyWith(id: 12, name: "My name")
  /// ````
  AccessSettings call({
    Object? offlineGraceHours = const $CopyWithPlaceholder(),
    Object? agentSilentMinutes = const $CopyWithPlaceholder(),
    Object? plateMatch = const $CopyWithPlaceholder(),
    Object? maintenanceHour = const $CopyWithPlaceholder(),
  }) {
    return AccessSettings(
      offlineGraceHours: offlineGraceHours == const $CopyWithPlaceholder()
          ? _value.offlineGraceHours
          // ignore: cast_nullable_to_non_nullable
          : offlineGraceHours as int,
      agentSilentMinutes: agentSilentMinutes == const $CopyWithPlaceholder()
          ? _value.agentSilentMinutes
          // ignore: cast_nullable_to_non_nullable
          : agentSilentMinutes as int,
      plateMatch: plateMatch == const $CopyWithPlaceholder()
          ? _value.plateMatch
          // ignore: cast_nullable_to_non_nullable
          : plateMatch as AccessSettingsPlateMatchEnum,
      maintenanceHour: maintenanceHour == const $CopyWithPlaceholder()
          ? _value.maintenanceHour
          // ignore: cast_nullable_to_non_nullable
          : maintenanceHour as int?,
    );
  }
}

extension $AccessSettingsCopyWith on AccessSettings {
  /// Returns a callable class that can be used as follows: `instanceOfAccessSettings.copyWith(...)` or like so:`instanceOfAccessSettings.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AccessSettingsCWProxy get copyWith => _$AccessSettingsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessSettings _$AccessSettingsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AccessSettings',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'offline_grace_hours',
            'agent_silent_minutes',
            'plate_match',
            'maintenance_hour',
          ],
        );
        final val = AccessSettings(
          offlineGraceHours: $checkedConvert(
            'offline_grace_hours',
            (v) => (v as num).toInt(),
          ),
          agentSilentMinutes: $checkedConvert(
            'agent_silent_minutes',
            (v) => (v as num).toInt(),
          ),
          plateMatch: $checkedConvert(
            'plate_match',
            (v) => $enumDecode(
              _$AccessSettingsPlateMatchEnumEnumMap,
              v,
              unknownValue: AccessSettingsPlateMatchEnum.unknownDefaultOpenApi,
            ),
          ),
          maintenanceHour: $checkedConvert(
            'maintenance_hour',
            (v) => (v as num?)?.toInt(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'offlineGraceHours': 'offline_grace_hours',
        'agentSilentMinutes': 'agent_silent_minutes',
        'plateMatch': 'plate_match',
        'maintenanceHour': 'maintenance_hour',
      },
    );

Map<String, dynamic> _$AccessSettingsToJson(
  AccessSettings instance,
) => <String, dynamic>{
  'offline_grace_hours': instance.offlineGraceHours,
  'agent_silent_minutes': instance.agentSilentMinutes,
  'plate_match': _$AccessSettingsPlateMatchEnumEnumMap[instance.plateMatch]!,
  'maintenance_hour': instance.maintenanceHour,
};

const _$AccessSettingsPlateMatchEnumEnumMap = {
  AccessSettingsPlateMatchEnum.exact: 'exact',
  AccessSettingsPlateMatchEnum.tolerant: 'tolerant',
  AccessSettingsPlateMatchEnum.unknownDefaultOpenApi:
      'unknown_default_open_api',
};
