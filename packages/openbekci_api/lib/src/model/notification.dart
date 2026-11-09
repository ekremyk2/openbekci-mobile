//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Notification {
  /// Returns a new [Notification] instance.
  Notification({

    required  this.id,

    required  this.siteId,

    required  this.type,

    required  this.payload,

    required  this.readAt,

    required  this.link,

    required  this.createdAt,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'site_id',
    required: true,
    includeIfNull: true,
  )


  final String? siteId;



      /// Notification type vocabulary (backend section 12), shared by push titles and Android channels. Open: clients tolerate unknown values.
  @JsonKey(
    
    name: r'type',
    required: true,
    includeIfNull: false,
  )


  final String type;



  @JsonKey(
    
    name: r'payload',
    required: true,
    includeIfNull: false,
  )


  final Map<String, Object> payload;



  @JsonKey(
    
    name: r'read_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? readAt;



  @JsonKey(
    
    name: r'link',
    required: true,
    includeIfNull: true,
  )


  final String? link;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Notification &&
      other.id == id &&
      other.siteId == siteId &&
      other.type == type &&
      other.payload == payload &&
      other.readAt == readAt &&
      other.link == link &&
      other.createdAt == createdAt;

    @override
    int get hashCode =>
        id.hashCode +
        (siteId == null ? 0 : siteId.hashCode) +
        type.hashCode +
        payload.hashCode +
        (readAt == null ? 0 : readAt.hashCode) +
        (link == null ? 0 : link.hashCode) +
        createdAt.hashCode;

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

