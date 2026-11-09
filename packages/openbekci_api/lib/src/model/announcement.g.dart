// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AnnouncementCWProxy {
  Announcement id(String id);

  Announcement orgId(String orgId);

  Announcement siteId(String siteId);

  Announcement title(String title);

  Announcement bodyMd(String bodyMd);

  Announcement status(AnnouncementStatusEnum status);

  Announcement audience(AnnouncementAudience audience);

  Announcement publishAt(DateTime? publishAt);

  Announcement expiresAt(DateTime? expiresAt);

  Announcement pinned(bool pinned);

  Announcement channels(List<AnnouncementChannelsEnum> channels);

  Announcement recipientCount(int? recipientCount);

  Announcement smsCount(int? smsCount);

  Announcement smsSegments(int? smsSegments);

  Announcement readCount(int readCount);

  Announcement readAt(DateTime? readAt);

  Announcement attachments(List<AnnouncementAttachment> attachments);

  Announcement publishedAt(DateTime? publishedAt);

  Announcement createdBy(String? createdBy);

  Announcement createdAt(DateTime createdAt);

  Announcement updatedAt(DateTime updatedAt);

  Announcement version(int version);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Announcement(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Announcement(...).copyWith(id: 12, name: "My name")
  /// ````
  Announcement call({
    String id,
    String orgId,
    String siteId,
    String title,
    String bodyMd,
    AnnouncementStatusEnum status,
    AnnouncementAudience audience,
    DateTime? publishAt,
    DateTime? expiresAt,
    bool pinned,
    List<AnnouncementChannelsEnum> channels,
    int? recipientCount,
    int? smsCount,
    int? smsSegments,
    int readCount,
    DateTime? readAt,
    List<AnnouncementAttachment> attachments,
    DateTime? publishedAt,
    String? createdBy,
    DateTime createdAt,
    DateTime updatedAt,
    int version,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAnnouncement.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAnnouncement.copyWith.fieldName(...)`
class _$AnnouncementCWProxyImpl implements _$AnnouncementCWProxy {
  const _$AnnouncementCWProxyImpl(this._value);

  final Announcement _value;

  @override
  Announcement id(String id) => this(id: id);

  @override
  Announcement orgId(String orgId) => this(orgId: orgId);

  @override
  Announcement siteId(String siteId) => this(siteId: siteId);

  @override
  Announcement title(String title) => this(title: title);

  @override
  Announcement bodyMd(String bodyMd) => this(bodyMd: bodyMd);

  @override
  Announcement status(AnnouncementStatusEnum status) => this(status: status);

  @override
  Announcement audience(AnnouncementAudience audience) =>
      this(audience: audience);

  @override
  Announcement publishAt(DateTime? publishAt) => this(publishAt: publishAt);

  @override
  Announcement expiresAt(DateTime? expiresAt) => this(expiresAt: expiresAt);

  @override
  Announcement pinned(bool pinned) => this(pinned: pinned);

  @override
  Announcement channels(List<AnnouncementChannelsEnum> channels) =>
      this(channels: channels);

  @override
  Announcement recipientCount(int? recipientCount) =>
      this(recipientCount: recipientCount);

  @override
  Announcement smsCount(int? smsCount) => this(smsCount: smsCount);

  @override
  Announcement smsSegments(int? smsSegments) => this(smsSegments: smsSegments);

  @override
  Announcement readCount(int readCount) => this(readCount: readCount);

  @override
  Announcement readAt(DateTime? readAt) => this(readAt: readAt);

  @override
  Announcement attachments(List<AnnouncementAttachment> attachments) =>
      this(attachments: attachments);

  @override
  Announcement publishedAt(DateTime? publishedAt) =>
      this(publishedAt: publishedAt);

  @override
  Announcement createdBy(String? createdBy) => this(createdBy: createdBy);

  @override
  Announcement createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Announcement updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  Announcement version(int version) => this(version: version);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Announcement(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Announcement(...).copyWith(id: 12, name: "My name")
  /// ````
  Announcement call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? siteId = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? bodyMd = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? audience = const $CopyWithPlaceholder(),
    Object? publishAt = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
    Object? pinned = const $CopyWithPlaceholder(),
    Object? channels = const $CopyWithPlaceholder(),
    Object? recipientCount = const $CopyWithPlaceholder(),
    Object? smsCount = const $CopyWithPlaceholder(),
    Object? smsSegments = const $CopyWithPlaceholder(),
    Object? readCount = const $CopyWithPlaceholder(),
    Object? readAt = const $CopyWithPlaceholder(),
    Object? attachments = const $CopyWithPlaceholder(),
    Object? publishedAt = const $CopyWithPlaceholder(),
    Object? createdBy = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
  }) {
    return Announcement(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      orgId: orgId == const $CopyWithPlaceholder()
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String,
      siteId: siteId == const $CopyWithPlaceholder()
          ? _value.siteId
          // ignore: cast_nullable_to_non_nullable
          : siteId as String,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      bodyMd: bodyMd == const $CopyWithPlaceholder()
          ? _value.bodyMd
          // ignore: cast_nullable_to_non_nullable
          : bodyMd as String,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as AnnouncementStatusEnum,
      audience: audience == const $CopyWithPlaceholder()
          ? _value.audience
          // ignore: cast_nullable_to_non_nullable
          : audience as AnnouncementAudience,
      publishAt: publishAt == const $CopyWithPlaceholder()
          ? _value.publishAt
          // ignore: cast_nullable_to_non_nullable
          : publishAt as DateTime?,
      expiresAt: expiresAt == const $CopyWithPlaceholder()
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as DateTime?,
      pinned: pinned == const $CopyWithPlaceholder()
          ? _value.pinned
          // ignore: cast_nullable_to_non_nullable
          : pinned as bool,
      channels: channels == const $CopyWithPlaceholder()
          ? _value.channels
          // ignore: cast_nullable_to_non_nullable
          : channels as List<AnnouncementChannelsEnum>,
      recipientCount: recipientCount == const $CopyWithPlaceholder()
          ? _value.recipientCount
          // ignore: cast_nullable_to_non_nullable
          : recipientCount as int?,
      smsCount: smsCount == const $CopyWithPlaceholder()
          ? _value.smsCount
          // ignore: cast_nullable_to_non_nullable
          : smsCount as int?,
      smsSegments: smsSegments == const $CopyWithPlaceholder()
          ? _value.smsSegments
          // ignore: cast_nullable_to_non_nullable
          : smsSegments as int?,
      readCount: readCount == const $CopyWithPlaceholder()
          ? _value.readCount
          // ignore: cast_nullable_to_non_nullable
          : readCount as int,
      readAt: readAt == const $CopyWithPlaceholder()
          ? _value.readAt
          // ignore: cast_nullable_to_non_nullable
          : readAt as DateTime?,
      attachments: attachments == const $CopyWithPlaceholder()
          ? _value.attachments
          // ignore: cast_nullable_to_non_nullable
          : attachments as List<AnnouncementAttachment>,
      publishedAt: publishedAt == const $CopyWithPlaceholder()
          ? _value.publishedAt
          // ignore: cast_nullable_to_non_nullable
          : publishedAt as DateTime?,
      createdBy: createdBy == const $CopyWithPlaceholder()
          ? _value.createdBy
          // ignore: cast_nullable_to_non_nullable
          : createdBy as String?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
      version: version == const $CopyWithPlaceholder()
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as int,
    );
  }
}

extension $AnnouncementCopyWith on Announcement {
  /// Returns a callable class that can be used as follows: `instanceOfAnnouncement.copyWith(...)` or like so:`instanceOfAnnouncement.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AnnouncementCWProxy get copyWith => _$AnnouncementCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Announcement _$AnnouncementFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'Announcement',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'org_id',
        'site_id',
        'title',
        'body_md',
        'status',
        'audience',
        'publish_at',
        'expires_at',
        'pinned',
        'channels',
        'recipient_count',
        'sms_count',
        'read_count',
        'read_at',
        'attachments',
        'published_at',
        'created_by',
        'created_at',
        'updated_at',
        'version',
      ],
    );
    final val = Announcement(
      id: $checkedConvert('id', (v) => v as String),
      orgId: $checkedConvert('org_id', (v) => v as String),
      siteId: $checkedConvert('site_id', (v) => v as String),
      title: $checkedConvert('title', (v) => v as String),
      bodyMd: $checkedConvert('body_md', (v) => v as String),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(
          _$AnnouncementStatusEnumEnumMap,
          v,
          unknownValue: AnnouncementStatusEnum.unknownDefaultOpenApi,
        ),
      ),
      audience: $checkedConvert(
        'audience',
        (v) => AnnouncementAudience.fromJson(v as Map<String, dynamic>),
      ),
      publishAt: $checkedConvert(
        'publish_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      expiresAt: $checkedConvert(
        'expires_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      pinned: $checkedConvert('pinned', (v) => v as bool),
      channels: $checkedConvert(
        'channels',
        (v) => (v as List<dynamic>)
            .map(
              (e) => $enumDecode(
                _$AnnouncementChannelsEnumEnumMap,
                e,
                unknownValue: AnnouncementChannelsEnum.unknownDefaultOpenApi,
              ),
            )
            .toList(),
      ),
      recipientCount: $checkedConvert(
        'recipient_count',
        (v) => (v as num?)?.toInt(),
      ),
      smsCount: $checkedConvert('sms_count', (v) => (v as num?)?.toInt()),
      smsSegments: $checkedConvert('sms_segments', (v) => (v as num?)?.toInt()),
      readCount: $checkedConvert('read_count', (v) => (v as num).toInt()),
      readAt: $checkedConvert(
        'read_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      attachments: $checkedConvert(
        'attachments',
        (v) => (v as List<dynamic>)
            .map(
              (e) => AnnouncementAttachment.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      publishedAt: $checkedConvert(
        'published_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      createdBy: $checkedConvert('created_by', (v) => v as String?),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
      version: $checkedConvert('version', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'orgId': 'org_id',
    'siteId': 'site_id',
    'bodyMd': 'body_md',
    'publishAt': 'publish_at',
    'expiresAt': 'expires_at',
    'recipientCount': 'recipient_count',
    'smsCount': 'sms_count',
    'smsSegments': 'sms_segments',
    'readCount': 'read_count',
    'readAt': 'read_at',
    'publishedAt': 'published_at',
    'createdBy': 'created_by',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$AnnouncementToJson(Announcement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'org_id': instance.orgId,
      'site_id': instance.siteId,
      'title': instance.title,
      'body_md': instance.bodyMd,
      'status': _$AnnouncementStatusEnumEnumMap[instance.status]!,
      'audience': instance.audience.toJson(),
      'publish_at': instance.publishAt?.toIso8601String(),
      'expires_at': instance.expiresAt?.toIso8601String(),
      'pinned': instance.pinned,
      'channels': instance.channels
          .map((e) => _$AnnouncementChannelsEnumEnumMap[e]!)
          .toList(),
      'recipient_count': instance.recipientCount,
      'sms_count': instance.smsCount,
      'sms_segments': ?instance.smsSegments,
      'read_count': instance.readCount,
      'read_at': instance.readAt?.toIso8601String(),
      'attachments': instance.attachments.map((e) => e.toJson()).toList(),
      'published_at': instance.publishedAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'version': instance.version,
    };

const _$AnnouncementStatusEnumEnumMap = {
  AnnouncementStatusEnum.draft: 'draft',
  AnnouncementStatusEnum.scheduled: 'scheduled',
  AnnouncementStatusEnum.published: 'published',
  AnnouncementStatusEnum.archived: 'archived',
  AnnouncementStatusEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};

const _$AnnouncementChannelsEnumEnumMap = {
  AnnouncementChannelsEnum.inApp: 'in_app',
  AnnouncementChannelsEnum.email: 'email',
  AnnouncementChannelsEnum.sms: 'sms',
  AnnouncementChannelsEnum.push: 'push',
  AnnouncementChannelsEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
