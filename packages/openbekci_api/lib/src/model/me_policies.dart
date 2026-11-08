//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'me_policies.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MePolicies {
  /// Returns a new [MePolicies] instance.
  MePolicies({

    required  this.appLockRequired,

    required  this.reauthWindowMinutes,
  });

      /// The mobile app must be protected by a device lock (biometrics or passcode) before it shows money or personal data.
  @JsonKey(
    
    name: r'app_lock_required',
    required: true,
    includeIfNull: false,
  )


  final bool appLockRequired;



      /// How long a re-authentication (`POST /v1/auth/reauth`) stays valid for sensitive operations (default 10).
  @JsonKey(
    
    name: r'reauth_window_minutes',
    required: true,
    includeIfNull: false,
  )


  final int reauthWindowMinutes;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MePolicies &&
      other.appLockRequired == appLockRequired &&
      other.reauthWindowMinutes == reauthWindowMinutes;

    @override
    int get hashCode =>
        appLockRequired.hashCode +
        reauthWindowMinutes.hashCode;

  factory MePolicies.fromJson(Map<String, dynamic> json) => _$MePoliciesFromJson(json);

  Map<String, dynamic> toJson() => _$MePoliciesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

