//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_mutes_set.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class NotificationMutesSet {
  /// Returns a new [NotificationMutesSet] instance.
  NotificationMutesSet({

    required  this.mutedTypes,
  });

  @JsonKey(
    
    name: r'muted_types',
    required: true,
    includeIfNull: false,
  )


  final List<String> mutedTypes;





    @override
    bool operator ==(Object other) => identical(this, other) || other is NotificationMutesSet &&
      other.mutedTypes == mutedTypes;

    @override
    int get hashCode =>
        mutedTypes.hashCode;

  factory NotificationMutesSet.fromJson(Map<String, dynamic> json) => _$NotificationMutesSetFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationMutesSetToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

