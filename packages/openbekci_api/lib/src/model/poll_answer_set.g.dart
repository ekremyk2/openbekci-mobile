// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_answer_set.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PollAnswerSetCWProxy {
  PollAnswerSet unitId(String unitId);

  PollAnswerSet answer(PollAnswerSetAnswerEnum answer);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PollAnswerSet(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PollAnswerSet(...).copyWith(id: 12, name: "My name")
  /// ````
  PollAnswerSet call({String unitId, PollAnswerSetAnswerEnum answer});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPollAnswerSet.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPollAnswerSet.copyWith.fieldName(...)`
class _$PollAnswerSetCWProxyImpl implements _$PollAnswerSetCWProxy {
  const _$PollAnswerSetCWProxyImpl(this._value);

  final PollAnswerSet _value;

  @override
  PollAnswerSet unitId(String unitId) => this(unitId: unitId);

  @override
  PollAnswerSet answer(PollAnswerSetAnswerEnum answer) => this(answer: answer);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PollAnswerSet(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PollAnswerSet(...).copyWith(id: 12, name: "My name")
  /// ````
  PollAnswerSet call({
    Object? unitId = const $CopyWithPlaceholder(),
    Object? answer = const $CopyWithPlaceholder(),
  }) {
    return PollAnswerSet(
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as String,
      answer: answer == const $CopyWithPlaceholder()
          ? _value.answer
          // ignore: cast_nullable_to_non_nullable
          : answer as PollAnswerSetAnswerEnum,
    );
  }
}

extension $PollAnswerSetCopyWith on PollAnswerSet {
  /// Returns a callable class that can be used as follows: `instanceOfPollAnswerSet.copyWith(...)` or like so:`instanceOfPollAnswerSet.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PollAnswerSetCWProxy get copyWith => _$PollAnswerSetCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollAnswerSet _$PollAnswerSetFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PollAnswerSet', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['unit_id', 'answer']);
      final val = PollAnswerSet(
        unitId: $checkedConvert('unit_id', (v) => v as String),
        answer: $checkedConvert(
          'answer',
          (v) => $enumDecode(
            _$PollAnswerSetAnswerEnumEnumMap,
            v,
            unknownValue: PollAnswerSetAnswerEnum.unknownDefaultOpenApi,
          ),
        ),
      );
      return val;
    }, fieldKeyMap: const {'unitId': 'unit_id'});

Map<String, dynamic> _$PollAnswerSetToJson(PollAnswerSet instance) =>
    <String, dynamic>{
      'unit_id': instance.unitId,
      'answer': _$PollAnswerSetAnswerEnumEnumMap[instance.answer]!,
    };

const _$PollAnswerSetAnswerEnumEnumMap = {
  PollAnswerSetAnswerEnum.yes: 'yes',
  PollAnswerSetAnswerEnum.no: 'no',
  PollAnswerSetAnswerEnum.abstain: 'abstain',
  PollAnswerSetAnswerEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
