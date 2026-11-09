//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notifications_read_all.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class NotificationsReadAll {
  /// Returns a new [NotificationsReadAll] instance.
  NotificationsReadAll({

     this.siteId,
  });

  @JsonKey(
    
    name: r'site_id',
    required: false,
    includeIfNull: false,
  )


  final String? siteId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is NotificationsReadAll &&
      other.siteId == siteId;

    @override
    int get hashCode =>
        siteId.hashCode;

  factory NotificationsReadAll.fromJson(Map<String, dynamic> json) => _$NotificationsReadAllFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsReadAllToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

