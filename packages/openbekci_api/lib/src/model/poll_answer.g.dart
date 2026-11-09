// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_answer.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PollAnswerCWProxy {
  PollAnswer agendaItemId(String agendaItemId);

  PollAnswer unitId(String unitId);

  PollAnswer unitDoorNumber(String unitDoorNumber);

  PollAnswer answer(PollAnswerAnswerEnum answer);

  PollAnswer answeredBy(String answeredBy);

  PollAnswer answeredAt(DateTime answeredAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PollAnswer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PollAnswer(...).copyWith(id: 12, name: "My name")
  /// ````
  PollAnswer call({
    String agendaItemId,
    String unitId,
    String unitDoorNumber,
    PollAnswerAnswerEnum answer,
    String answeredBy,
    DateTime answeredAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPollAnswer.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPollAnswer.copyWith.fieldName(...)`
class _$PollAnswerCWProxyImpl implements _$PollAnswerCWProxy {
  const _$PollAnswerCWProxyImpl(this._value);

  final PollAnswer _value;

  @override
  PollAnswer agendaItemId(String agendaItemId) =>
      this(agendaItemId: agendaItemId);

  @override
  PollAnswer unitId(String unitId) => this(unitId: unitId);

  @override
  PollAnswer unitDoorNumber(String unitDoorNumber) =>
      this(unitDoorNumber: unitDoorNumber);

  @override
  PollAnswer answer(PollAnswerAnswerEnum answer) => this(answer: answer);

  @override
  PollAnswer answeredBy(String answeredBy) => this(answeredBy: answeredBy);

  @override
  PollAnswer answeredAt(DateTime answeredAt) => this(answeredAt: answeredAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PollAnswer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PollAnswer(...).copyWith(id: 12, name: "My name")
  /// ````
  PollAnswer call({
    Object? agendaItemId = const $CopyWithPlaceholder(),
    Object? unitId = const $CopyWithPlaceholder(),
    Object? unitDoorNumber = const $CopyWithPlaceholder(),
    Object? answer = const $CopyWithPlaceholder(),
    Object? answeredBy = const $CopyWithPlaceholder(),
    Object? answeredAt = const $CopyWithPlaceholder(),
  }) {
    return PollAnswer(
      agendaItemId: agendaItemId == const $CopyWithPlaceholder()
          ? _value.agendaItemId
          // ignore: cast_nullable_to_non_nullable
          : agendaItemId as String,
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as String,
      unitDoorNumber: unitDoorNumber == const $CopyWithPlaceholder()
          ? _value.unitDoorNumber
          // ignore: cast_nullable_to_non_nullable
          : unitDoorNumber as String,
      answer: answer == const $CopyWithPlaceholder()
          ? _value.answer
          // ignore: cast_nullable_to_non_nullable
          : answer as PollAnswerAnswerEnum,
      answeredBy: answeredBy == const $CopyWithPlaceholder()
          ? _value.answeredBy
          // ignore: cast_nullable_to_non_nullable
          : answeredBy as String,
      answeredAt: answeredAt == const $CopyWithPlaceholder()
          ? _value.answeredAt
          // ignore: cast_nullable_to_non_nullable
          : answeredAt as DateTime,
    );
  }
}

extension $PollAnswerCopyWith on PollAnswer {
  /// Returns a callable class that can be used as follows: `instanceOfPollAnswer.copyWith(...)` or like so:`instanceOfPollAnswer.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PollAnswerCWProxy get copyWith => _$PollAnswerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollAnswer _$PollAnswerFromJson(Map<String, dynamic> json) => $checkedCreate(
  'PollAnswer',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'agenda_item_id',
        'unit_id',
        'unit_door_number',
        'answer',
        'answered_by',
        'answered_at',
      ],
    );
    final val = PollAnswer(
      agendaItemId: $checkedConvert('agenda_item_id', (v) => v as String),
      unitId: $checkedConvert('unit_id', (v) => v as String),
      unitDoorNumber: $checkedConvert('unit_door_number', (v) => v as String),
      answer: $checkedConvert(
        'answer',
        (v) => $enumDecode(
          _$PollAnswerAnswerEnumEnumMap,
          v,
          unknownValue: PollAnswerAnswerEnum.unknownDefaultOpenApi,
        ),
      ),
      answeredBy: $checkedConvert('answered_by', (v) => v as String),
      answeredAt: $checkedConvert(
        'answered_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'agendaItemId': 'agenda_item_id',
    'unitId': 'unit_id',
    'unitDoorNumber': 'unit_door_number',
    'answeredBy': 'answered_by',
    'answeredAt': 'answered_at',
  },
);

Map<String, dynamic> _$PollAnswerToJson(PollAnswer instance) =>
    <String, dynamic>{
      'agenda_item_id': instance.agendaItemId,
      'unit_id': instance.unitId,
      'unit_door_number': instance.unitDoorNumber,
      'answer': _$PollAnswerAnswerEnumEnumMap[instance.answer]!,
      'answered_by': instance.answeredBy,
      'answered_at': instance.answeredAt.toIso8601String(),
    };

const _$PollAnswerAnswerEnumEnumMap = {
  PollAnswerAnswerEnum.yes: 'yes',
  PollAnswerAnswerEnum.no: 'no',
  PollAnswerAnswerEnum.abstain: 'abstain',
  PollAnswerAnswerEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
