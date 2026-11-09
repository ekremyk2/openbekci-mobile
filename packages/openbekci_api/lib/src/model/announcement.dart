//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/announcement_attachment.dart';
import 'package:openbekci_api/src/model/announcement_audience.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'announcement.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Announcement {
  /// Returns a new [Announcement] instance.
  Announcement({

    required  this.id,

    required  this.orgId,

    required  this.siteId,

    required  this.title,

    required  this.bodyMd,

    required  this.status,

    required  this.audience,

    required  this.publishAt,

    required  this.expiresAt,

    required  this.pinned,

    required  this.channels,

    required  this.recipientCount,

    required  this.smsCount,

     this.smsSegments,

    required  this.readCount,

    required  this.readAt,

    required  this.attachments,

    required  this.publishedAt,

    required  this.createdBy,

    required  this.createdAt,

    required  this.updatedAt,

    required  this.version,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'org_id',
    required: true,
    includeIfNull: false,
  )


  final String orgId;



  @JsonKey(
    
    name: r'site_id',
    required: true,
    includeIfNull: false,
  )


  final String siteId;



  @JsonKey(
    
    name: r'title',
    required: true,
    includeIfNull: false,
  )


  final String title;



  @JsonKey(
    
    name: r'body_md',
    required: true,
    includeIfNull: false,
  )


  final String bodyMd;



      /// Open enum.
  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  unknownEnumValue: AnnouncementStatusEnum.unknownDefaultOpenApi,
  )


  final AnnouncementStatusEnum status;



  @JsonKey(
    
    name: r'audience',
    required: true,
    includeIfNull: false,
  )


  final AnnouncementAudience audience;



  @JsonKey(
    
    name: r'publish_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? publishAt;



  @JsonKey(
    
    name: r'expires_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? expiresAt;



  @JsonKey(
    
    name: r'pinned',
    required: true,
    includeIfNull: false,
  )


  final bool pinned;



      /// Chosen by the sender (O5).
  @JsonKey(
    
    name: r'channels',
    required: true,
    includeIfNull: false,
  unknownEnumValue: AnnouncementChannelsEnum.unknownDefaultOpenApi,
  )


  final List<AnnouncementChannelsEnum> channels;



      /// Set at publish.
  @JsonKey(
    
    name: r'recipient_count',
    required: true,
    includeIfNull: true,
  )


  final int? recipientCount;



  @JsonKey(
    
    name: r'sms_count',
    required: true,
    includeIfNull: true,
  )


  final int? smsCount;



      /// Billed SMS segments of those messages, set at publish: a long text or a Turkish glyph (UCS-2, 70 characters a segment) takes several per message.
  @JsonKey(
    
    name: r'sms_segments',
    required: false,
    includeIfNull: false,
  )


  final int? smsSegments;



      /// Opened in web or app; a delivered SMS or email is not a read.
  @JsonKey(
    
    name: r'read_count',
    required: true,
    includeIfNull: false,
  )


  final int readCount;



      /// When the caller read it.
  @JsonKey(
    
    name: r'read_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? readAt;



      /// The attached files with what a client needs to show them; download through `files.download` with the `id`.
  @JsonKey(
    
    name: r'attachments',
    required: true,
    includeIfNull: false,
  )


  final List<AnnouncementAttachment> attachments;



  @JsonKey(
    
    name: r'published_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? publishedAt;



  @JsonKey(
    
    name: r'created_by',
    required: true,
    includeIfNull: true,
  )


  final String? createdBy;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'updated_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime updatedAt;



      /// Optimistic-lock counter; send it back as If-Match on updates.
  @JsonKey(
    
    name: r'version',
    required: true,
    includeIfNull: false,
  )


  final int version;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Announcement &&
      other.id == id &&
      other.orgId == orgId &&
      other.siteId == siteId &&
      other.title == title &&
      other.bodyMd == bodyMd &&
      other.status == status &&
      other.audience == audience &&
      other.publishAt == publishAt &&
      other.expiresAt == expiresAt &&
      other.pinned == pinned &&
      other.channels == channels &&
      other.recipientCount == recipientCount &&
      other.smsCount == smsCount &&
      other.smsSegments == smsSegments &&
      other.readCount == readCount &&
      other.readAt == readAt &&
      other.attachments == attachments &&
      other.publishedAt == publishedAt &&
      other.createdBy == createdBy &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.version == version;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        siteId.hashCode +
        title.hashCode +
        bodyMd.hashCode +
        status.hashCode +
        audience.hashCode +
        (publishAt == null ? 0 : publishAt.hashCode) +
        (expiresAt == null ? 0 : expiresAt.hashCode) +
        pinned.hashCode +
        channels.hashCode +
        (recipientCount == null ? 0 : recipientCount.hashCode) +
        (smsCount == null ? 0 : smsCount.hashCode) +
        (smsSegments == null ? 0 : smsSegments.hashCode) +
        readCount.hashCode +
        (readAt == null ? 0 : readAt.hashCode) +
        attachments.hashCode +
        (publishedAt == null ? 0 : publishedAt.hashCode) +
        (createdBy == null ? 0 : createdBy.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode +
        version.hashCode;

  factory Announcement.fromJson(Map<String, dynamic> json) => _$AnnouncementFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum AnnouncementStatusEnum {
@JsonValue(r'draft')
draft(r'draft'),
@JsonValue(r'scheduled')
scheduled(r'scheduled'),
@JsonValue(r'published')
published(r'published'),
@JsonValue(r'archived')
archived(r'archived'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const AnnouncementStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Open enum.
enum AnnouncementChannelsEnum {
@JsonValue(r'in_app')
inApp(r'in_app'),
@JsonValue(r'email')
email(r'email'),
@JsonValue(r'sms')
sms(r'sms'),
@JsonValue(r'push')
push(r'push'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const AnnouncementChannelsEnum(this.value);

final String value;

@override
String toString() => value;
}


