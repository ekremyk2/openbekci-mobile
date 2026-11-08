//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reauth_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReauthResponse {
  /// Returns a new [ReauthResponse] instance.
  ReauthResponse({

    required  this.reauthUntil,
  });

      /// End of the re-authentication window of this session (10 minutes).
  @JsonKey(
    
    name: r'reauth_until',
    required: true,
    includeIfNull: false,
  )


  final DateTime reauthUntil;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ReauthResponse &&
      other.reauthUntil == reauthUntil;

    @override
    int get hashCode =>
        reauthUntil.hashCode;

  factory ReauthResponse.fromJson(Map<String, dynamic> json) => _$ReauthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReauthResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

