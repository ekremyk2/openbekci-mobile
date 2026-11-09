// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agenda_item.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AgendaItemCWProxy {
  AgendaItem id(String id);

  AgendaItem orgId(String orgId);

  AgendaItem meetingId(String meetingId);

  AgendaItem position(int position);

  AgendaItem title(String title);

  AgendaItem description(String? description);

  AgendaItem willBeVoted(bool willBeVoted);

  AgendaItem topic(String? topic);

  AgendaItem decisionId(String? decisionId);

  AgendaItem createdAt(DateTime createdAt);

  AgendaItem updatedAt(DateTime updatedAt);

  AgendaItem version(int version);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AgendaItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AgendaItem(...).copyWith(id: 12, name: "My name")
  /// ````
  AgendaItem call({
    String id,
    String orgId,
    String meetingId,
    int position,
    String title,
    String? description,
    bool willBeVoted,
    String? topic,
    String? decisionId,
    DateTime createdAt,
    DateTime updatedAt,
    int version,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAgendaItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAgendaItem.copyWith.fieldName(...)`
class _$AgendaItemCWProxyImpl implements _$AgendaItemCWProxy {
  const _$AgendaItemCWProxyImpl(this._value);

  final AgendaItem _value;

  @override
  AgendaItem id(String id) => this(id: id);

  @override
  AgendaItem orgId(String orgId) => this(orgId: orgId);

  @override
  AgendaItem meetingId(String meetingId) => this(meetingId: meetingId);

  @override
  AgendaItem position(int position) => this(position: position);

  @override
  AgendaItem title(String title) => this(title: title);

  @override
  AgendaItem description(String? description) => this(description: description);

  @override
  AgendaItem willBeVoted(bool willBeVoted) => this(willBeVoted: willBeVoted);

  @override
  AgendaItem topic(String? topic) => this(topic: topic);

  @override
  AgendaItem decisionId(String? decisionId) => this(decisionId: decisionId);

  @override
  AgendaItem createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  AgendaItem updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  AgendaItem version(int version) => this(version: version);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AgendaItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AgendaItem(...).copyWith(id: 12, name: "My name")
  /// ````
  AgendaItem call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? meetingId = const $CopyWithPlaceholder(),
    Object? position = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? willBeVoted = const $CopyWithPlaceholder(),
    Object? topic = const $CopyWithPlaceholder(),
    Object? decisionId = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
  }) {
    return AgendaItem(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      orgId: orgId == const $CopyWithPlaceholder()
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String,
      meetingId: meetingId == const $CopyWithPlaceholder()
          ? _value.meetingId
          // ignore: cast_nullable_to_non_nullable
          : meetingId as String,
      position: position == const $CopyWithPlaceholder()
          ? _value.position
          // ignore: cast_nullable_to_non_nullable
          : position as int,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      willBeVoted: willBeVoted == const $CopyWithPlaceholder()
          ? _value.willBeVoted
          // ignore: cast_nullable_to_non_nullable
          : willBeVoted as bool,
      topic: topic == const $CopyWithPlaceholder()
          ? _value.topic
          // ignore: cast_nullable_to_non_nullable
          : topic as String?,
      decisionId: decisionId == const $CopyWithPlaceholder()
          ? _value.decisionId
          // ignore: cast_nullable_to_non_nullable
          : decisionId as String?,
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

extension $AgendaItemCopyWith on AgendaItem {
  /// Returns a callable class that can be used as follows: `instanceOfAgendaItem.copyWith(...)` or like so:`instanceOfAgendaItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AgendaItemCWProxy get copyWith => _$AgendaItemCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgendaItem _$AgendaItemFromJson(Map<String, dynamic> json) => $checkedCreate(
  'AgendaItem',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'org_id',
        'meeting_id',
        'position',
        'title',
        'description',
        'will_be_voted',
        'topic',
        'decision_id',
        'created_at',
        'updated_at',
        'version',
      ],
    );
    final val = AgendaItem(
      id: $checkedConvert('id', (v) => v as String),
      orgId: $checkedConvert('org_id', (v) => v as String),
      meetingId: $checkedConvert('meeting_id', (v) => v as String),
      position: $checkedConvert('position', (v) => (v as num).toInt()),
      title: $checkedConvert('title', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String?),
      willBeVoted: $checkedConvert('will_be_voted', (v) => v as bool),
      topic: $checkedConvert('topic', (v) => v as String?),
      decisionId: $checkedConvert('decision_id', (v) => v as String?),
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
    'meetingId': 'meeting_id',
    'willBeVoted': 'will_be_voted',
    'decisionId': 'decision_id',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$AgendaItemToJson(AgendaItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'org_id': instance.orgId,
      'meeting_id': instance.meetingId,
      'position': instance.position,
      'title': instance.title,
      'description': instance.description,
      'will_be_voted': instance.willBeVoted,
      'topic': instance.topic,
      'decision_id': instance.decisionId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'version': instance.version,
    };
