// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decision.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DecisionCWProxy {
  Decision id(String id);

  Decision orgId(String orgId);

  Decision siteId(String siteId);

  Decision meetingId(String meetingId);

  Decision agendaItemId(String? agendaItemId);

  Decision sequenceNo(int sequenceNo);

  Decision year(int year);

  Decision text(String text);

  Decision outcome(DecisionOutcomeEnum outcome);

  Decision voteCount(VoteCount? voteCount);

  Decision dissents(List<Dissent> dissents);

  Decision outcomeOverrideReason(String? outcomeOverrideReason);

  Decision concernsResidents(bool concernsResidents);

  Decision notifiedAt(DateTime? notifiedAt);

  Decision effect(DecisionEffect? effect);

  Decision createdAt(DateTime createdAt);

  Decision updatedAt(DateTime updatedAt);

  Decision version(int version);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Decision(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Decision(...).copyWith(id: 12, name: "My name")
  /// ````
  Decision call({
    String id,
    String orgId,
    String siteId,
    String meetingId,
    String? agendaItemId,
    int sequenceNo,
    int year,
    String text,
    DecisionOutcomeEnum outcome,
    VoteCount? voteCount,
    List<Dissent> dissents,
    String? outcomeOverrideReason,
    bool concernsResidents,
    DateTime? notifiedAt,
    DecisionEffect? effect,
    DateTime createdAt,
    DateTime updatedAt,
    int version,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDecision.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDecision.copyWith.fieldName(...)`
class _$DecisionCWProxyImpl implements _$DecisionCWProxy {
  const _$DecisionCWProxyImpl(this._value);

  final Decision _value;

  @override
  Decision id(String id) => this(id: id);

  @override
  Decision orgId(String orgId) => this(orgId: orgId);

  @override
  Decision siteId(String siteId) => this(siteId: siteId);

  @override
  Decision meetingId(String meetingId) => this(meetingId: meetingId);

  @override
  Decision agendaItemId(String? agendaItemId) =>
      this(agendaItemId: agendaItemId);

  @override
  Decision sequenceNo(int sequenceNo) => this(sequenceNo: sequenceNo);

  @override
  Decision year(int year) => this(year: year);

  @override
  Decision text(String text) => this(text: text);

  @override
  Decision outcome(DecisionOutcomeEnum outcome) => this(outcome: outcome);

  @override
  Decision voteCount(VoteCount? voteCount) => this(voteCount: voteCount);

  @override
  Decision dissents(List<Dissent> dissents) => this(dissents: dissents);

  @override
  Decision outcomeOverrideReason(String? outcomeOverrideReason) =>
      this(outcomeOverrideReason: outcomeOverrideReason);

  @override
  Decision concernsResidents(bool concernsResidents) =>
      this(concernsResidents: concernsResidents);

  @override
  Decision notifiedAt(DateTime? notifiedAt) => this(notifiedAt: notifiedAt);

  @override
  Decision effect(DecisionEffect? effect) => this(effect: effect);

  @override
  Decision createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Decision updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  Decision version(int version) => this(version: version);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Decision(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Decision(...).copyWith(id: 12, name: "My name")
  /// ````
  Decision call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? siteId = const $CopyWithPlaceholder(),
    Object? meetingId = const $CopyWithPlaceholder(),
    Object? agendaItemId = const $CopyWithPlaceholder(),
    Object? sequenceNo = const $CopyWithPlaceholder(),
    Object? year = const $CopyWithPlaceholder(),
    Object? text = const $CopyWithPlaceholder(),
    Object? outcome = const $CopyWithPlaceholder(),
    Object? voteCount = const $CopyWithPlaceholder(),
    Object? dissents = const $CopyWithPlaceholder(),
    Object? outcomeOverrideReason = const $CopyWithPlaceholder(),
    Object? concernsResidents = const $CopyWithPlaceholder(),
    Object? notifiedAt = const $CopyWithPlaceholder(),
    Object? effect = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
  }) {
    return Decision(
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
      meetingId: meetingId == const $CopyWithPlaceholder()
          ? _value.meetingId
          // ignore: cast_nullable_to_non_nullable
          : meetingId as String,
      agendaItemId: agendaItemId == const $CopyWithPlaceholder()
          ? _value.agendaItemId
          // ignore: cast_nullable_to_non_nullable
          : agendaItemId as String?,
      sequenceNo: sequenceNo == const $CopyWithPlaceholder()
          ? _value.sequenceNo
          // ignore: cast_nullable_to_non_nullable
          : sequenceNo as int,
      year: year == const $CopyWithPlaceholder()
          ? _value.year
          // ignore: cast_nullable_to_non_nullable
          : year as int,
      text: text == const $CopyWithPlaceholder()
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as String,
      outcome: outcome == const $CopyWithPlaceholder()
          ? _value.outcome
          // ignore: cast_nullable_to_non_nullable
          : outcome as DecisionOutcomeEnum,
      voteCount: voteCount == const $CopyWithPlaceholder()
          ? _value.voteCount
          // ignore: cast_nullable_to_non_nullable
          : voteCount as VoteCount?,
      dissents: dissents == const $CopyWithPlaceholder()
          ? _value.dissents
          // ignore: cast_nullable_to_non_nullable
          : dissents as List<Dissent>,
      outcomeOverrideReason:
          outcomeOverrideReason == const $CopyWithPlaceholder()
          ? _value.outcomeOverrideReason
          // ignore: cast_nullable_to_non_nullable
          : outcomeOverrideReason as String?,
      concernsResidents: concernsResidents == const $CopyWithPlaceholder()
          ? _value.concernsResidents
          // ignore: cast_nullable_to_non_nullable
          : concernsResidents as bool,
      notifiedAt: notifiedAt == const $CopyWithPlaceholder()
          ? _value.notifiedAt
          // ignore: cast_nullable_to_non_nullable
          : notifiedAt as DateTime?,
      effect: effect == const $CopyWithPlaceholder()
          ? _value.effect
          // ignore: cast_nullable_to_non_nullable
          : effect as DecisionEffect?,
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

extension $DecisionCopyWith on Decision {
  /// Returns a callable class that can be used as follows: `instanceOfDecision.copyWith(...)` or like so:`instanceOfDecision.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DecisionCWProxy get copyWith => _$DecisionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Decision _$DecisionFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Decision',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'org_id',
        'site_id',
        'meeting_id',
        'agenda_item_id',
        'sequence_no',
        'year',
        'text',
        'outcome',
        'vote_count',
        'dissents',
        'concerns_residents',
        'notified_at',
        'effect',
        'created_at',
        'updated_at',
        'version',
      ],
    );
    final val = Decision(
      id: $checkedConvert('id', (v) => v as String),
      orgId: $checkedConvert('org_id', (v) => v as String),
      siteId: $checkedConvert('site_id', (v) => v as String),
      meetingId: $checkedConvert('meeting_id', (v) => v as String),
      agendaItemId: $checkedConvert('agenda_item_id', (v) => v as String?),
      sequenceNo: $checkedConvert('sequence_no', (v) => (v as num).toInt()),
      year: $checkedConvert('year', (v) => (v as num).toInt()),
      text: $checkedConvert('text', (v) => v as String),
      outcome: $checkedConvert(
        'outcome',
        (v) => $enumDecode(
          _$DecisionOutcomeEnumEnumMap,
          v,
          unknownValue: DecisionOutcomeEnum.unknownDefaultOpenApi,
        ),
      ),
      voteCount: $checkedConvert(
        'vote_count',
        (v) => v == null ? null : VoteCount.fromJson(v as Map<String, dynamic>),
      ),
      dissents: $checkedConvert(
        'dissents',
        (v) => (v as List<dynamic>)
            .map((e) => Dissent.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      outcomeOverrideReason: $checkedConvert(
        'outcome_override_reason',
        (v) => v as String?,
      ),
      concernsResidents: $checkedConvert(
        'concerns_residents',
        (v) => v as bool,
      ),
      notifiedAt: $checkedConvert(
        'notified_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      effect: $checkedConvert(
        'effect',
        (v) => v == null
            ? null
            : DecisionEffect.fromJson(v as Map<String, dynamic>),
      ),
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
    'meetingId': 'meeting_id',
    'agendaItemId': 'agenda_item_id',
    'sequenceNo': 'sequence_no',
    'voteCount': 'vote_count',
    'outcomeOverrideReason': 'outcome_override_reason',
    'concernsResidents': 'concerns_residents',
    'notifiedAt': 'notified_at',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$DecisionToJson(Decision instance) => <String, dynamic>{
  'id': instance.id,
  'org_id': instance.orgId,
  'site_id': instance.siteId,
  'meeting_id': instance.meetingId,
  'agenda_item_id': instance.agendaItemId,
  'sequence_no': instance.sequenceNo,
  'year': instance.year,
  'text': instance.text,
  'outcome': _$DecisionOutcomeEnumEnumMap[instance.outcome]!,
  'vote_count': instance.voteCount?.toJson(),
  'dissents': instance.dissents.map((e) => e.toJson()).toList(),
  'outcome_override_reason': ?instance.outcomeOverrideReason,
  'concerns_residents': instance.concernsResidents,
  'notified_at': instance.notifiedAt?.toIso8601String(),
  'effect': instance.effect?.toJson(),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'version': instance.version,
};

const _$DecisionOutcomeEnumEnumMap = {
  DecisionOutcomeEnum.accepted: 'accepted',
  DecisionOutcomeEnum.rejected: 'rejected',
  DecisionOutcomeEnum.noVote: 'no_vote',
  DecisionOutcomeEnum.noted: 'noted',
  DecisionOutcomeEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
