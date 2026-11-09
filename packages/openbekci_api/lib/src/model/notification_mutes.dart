//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_mutes.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class NotificationMutes {
  /// Returns a new [NotificationMutes] instance.
  NotificationMutes({

    required  this.mutedTypes,

    required  this.unmutableTypes,

    required  this.availableTypes,
  });

  @JsonKey(
    
    name: r'muted_types',
    required: true,
    includeIfNull: false,
  )


  final List<String> mutedTypes;



      /// Sign-in codes and invitations.
  @JsonKey(
    
    name: r'unmutable_types',
    required: true,
    includeIfNull: false,
  )


  final List<String> unmutableTypes;



      /// The types the caller can mute (every type except the unmutable ones), in display order; clients need no list of their own.
  @JsonKey(
    
    name: r'available_types',
    required: true,
    includeIfNull: false,
  )


  final List<String> availableTypes;





    @override
    bool operator ==(Object other) => identical(this, other) || other is NotificationMutes &&
      other.mutedTypes == mutedTypes &&
      other.unmutableTypes == unmutableTypes &&
      other.availableTypes == availableTypes;

    @override
    int get hashCode =>
        mutedTypes.hashCode +
        unmutableTypes.hashCode +
        availableTypes.hashCode;

  factory NotificationMutes.fromJson(Map<String, dynamic> json) => _$NotificationMutesFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationMutesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

