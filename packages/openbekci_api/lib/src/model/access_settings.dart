//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'access_settings.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AccessSettings {
  /// Returns a new [AccessSettings] instance.
  AccessSettings({

    required  this.offlineGraceHours,

    required  this.agentSilentMinutes,

    required  this.plateMatch,

    required  this.maintenanceHour,
  });

      /// Hours an offline agent keeps deciding locally before it stops (1 to 336, default 72). Sent to the agent as `update_config.settings.offline_grace_hours`.
          // minimum: 1
          // maximum: 336
  @JsonKey(
    
    name: r'offline_grace_hours',
    required: true,
    includeIfNull: false,
  )


  final int offlineGraceHours;



      /// Silence before the agent_silent notification (default 5).
  @JsonKey(
    
    name: r'agent_silent_minutes',
    required: true,
    includeIfNull: false,
  )


  final int agentSilentMinutes;



      /// Open enum.
  @JsonKey(
    
    name: r'plate_match',
    required: true,
    includeIfNull: false,
  unknownEnumValue: AccessSettingsPlateMatchEnum.unknownDefaultOpenApi,
  )


  final AccessSettingsPlateMatchEnum plateMatch;



      /// Local hour for agent updates.
  @JsonKey(
    
    name: r'maintenance_hour',
    required: true,
    includeIfNull: true,
  )


  final int? maintenanceHour;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AccessSettings &&
      other.offlineGraceHours == offlineGraceHours &&
      other.agentSilentMinutes == agentSilentMinutes &&
      other.plateMatch == plateMatch &&
      other.maintenanceHour == maintenanceHour;

    @override
    int get hashCode =>
        offlineGraceHours.hashCode +
        agentSilentMinutes.hashCode +
        plateMatch.hashCode +
        (maintenanceHour == null ? 0 : maintenanceHour.hashCode);

  factory AccessSettings.fromJson(Map<String, dynamic> json) => _$AccessSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AccessSettingsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum AccessSettingsPlateMatchEnum {
@JsonValue(r'exact')
exact(r'exact'),
@JsonValue(r'tolerant')
tolerant(r'tolerant'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const AccessSettingsPlateMatchEnum(this.value);

final String value;

@override
String toString() => value;
}


