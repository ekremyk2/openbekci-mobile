// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PollCWProxy {
  Poll agendaItemId(String agendaItemId);

  Poll question(String? question);

  Poll opensAt(DateTime opensAt);

  Poll closesAt(DateTime closesAt);

  Poll status(PollStatusEnum status);

  Poll version(int version);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Poll(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Poll(...).copyWith(id: 12, name: "My name")
  /// ````
  Poll call({
    String agendaItemId,
    String? question,
    DateTime opensAt,
    DateTime closesAt,
    PollStatusEnum status,
    int version,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPoll.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPoll.copyWith.fieldName(...)`
class _$PollCWProxyImpl implements _$PollCWProxy {
  const _$PollCWProxyImpl(this._value);

  final Poll _value;

  @override
  Poll agendaItemId(String agendaItemId) => this(agendaItemId: agendaItemId);

  @override
  Poll question(String? question) => this(question: question);

  @override
  Poll opensAt(DateTime opensAt) => this(opensAt: opensAt);

  @override
  Poll closesAt(DateTime closesAt) => this(closesAt: closesAt);

  @override
  Poll status(PollStatusEnum status) => this(status: status);

  @override
  Poll version(int version) => this(version: version);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Poll(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Poll(...).copyWith(id: 12, name: "My name")
  /// ````
  Poll call({
    Object? agendaItemId = const $CopyWithPlaceholder(),
    Object? question = const $CopyWithPlaceholder(),
    Object? opensAt = const $CopyWithPlaceholder(),
    Object? closesAt = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
  }) {
    return Poll(
      agendaItemId: agendaItemId == const $CopyWithPlaceholder()
          ? _value.agendaItemId
          // ignore: cast_nullable_to_non_nullable
          : agendaItemId as String,
      question: question == const $CopyWithPlaceholder()
          ? _value.question
          // ignore: cast_nullable_to_non_nullable
          : question as String?,
      opensAt: opensAt == const $CopyWithPlaceholder()
          ? _value.opensAt
          // ignore: cast_nullable_to_non_nullable
          : opensAt as DateTime,
      closesAt: closesAt == const $CopyWithPlaceholder()
          ? _value.closesAt
          // ignore: cast_nullable_to_non_nullable
          : closesAt as DateTime,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as PollStatusEnum,
      version: version == const $CopyWithPlaceholder()
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as int,
    );
  }
}

extension $PollCopyWith on Poll {
  /// Returns a callable class that can be used as follows: `instanceOfPoll.copyWith(...)` or like so:`instanceOfPoll.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PollCWProxy get copyWith => _$PollCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Poll _$PollFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Poll',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'agenda_item_id',
        'question',
        'opens_at',
        'closes_at',
        'status',
        'version',
      ],
    );
    final val = Poll(
      agendaItemId: $checkedConvert('agenda_item_id', (v) => v as String),
      question: $checkedConvert('question', (v) => v as String?),
      opensAt: $checkedConvert('opens_at', (v) => DateTime.parse(v as String)),
      closesAt: $checkedConvert(
        'closes_at',
        (v) => DateTime.parse(v as String),
      ),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(
          _$PollStatusEnumEnumMap,
          v,
          unknownValue: PollStatusEnum.unknownDefaultOpenApi,
        ),
      ),
      version: $checkedConvert('version', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'agendaItemId': 'agenda_item_id',
    'opensAt': 'opens_at',
    'closesAt': 'closes_at',
  },
);

Map<String, dynamic> _$PollToJson(Poll instance) => <String, dynamic>{
  'agenda_item_id': instance.agendaItemId,
  'question': instance.question,
  'opens_at': instance.opensAt.toIso8601String(),
  'closes_at': instance.closesAt.toIso8601String(),
  'status': _$PollStatusEnumEnumMap[instance.status]!,
  'version': instance.version,
};

const _$PollStatusEnumEnumMap = {
  PollStatusEnum.draft: 'draft',
  PollStatusEnum.open: 'open',
  PollStatusEnum.closed: 'closed',
  PollStatusEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
