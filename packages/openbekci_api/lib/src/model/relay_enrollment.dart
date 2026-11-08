//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'relay_enrollment.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RelayEnrollment {
  /// Returns a new [RelayEnrollment] instance.
  RelayEnrollment({

    required  this.challenge,
  });

      /// Ephemeral challenge for push relay enrollment; null when not enrolling.
  @JsonKey(
    
    name: r'challenge',
    required: true,
    includeIfNull: true,
  )


  final String? challenge;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RelayEnrollment &&
      other.challenge == challenge;

    @override
    int get hashCode =>
        (challenge == null ? 0 : challenge.hashCode);

  factory RelayEnrollment.fromJson(Map<String, dynamic> json) => _$RelayEnrollmentFromJson(json);

  Map<String, dynamic> toJson() => _$RelayEnrollmentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

