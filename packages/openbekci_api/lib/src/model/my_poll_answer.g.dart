// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_poll_answer.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MyPollAnswerCWProxy {
  MyPollAnswer unitId(String unitId);

  MyPollAnswer answer(MyPollAnswerAnswerEnum answer);

  MyPollAnswer answeredAt(DateTime answeredAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MyPollAnswer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MyPollAnswer(...).copyWith(id: 12, name: "My name")
  /// ````
  MyPollAnswer call({
    String unitId,
    MyPollAnswerAnswerEnum answer,
    DateTime answeredAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMyPollAnswer.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMyPollAnswer.copyWith.fieldName(...)`
class _$MyPollAnswerCWProxyImpl implements _$MyPollAnswerCWProxy {
  const _$MyPollAnswerCWProxyImpl(this._value);

  final MyPollAnswer _value;

  @override
  MyPollAnswer unitId(String unitId) => this(unitId: unitId);

  @override
  MyPollAnswer answer(MyPollAnswerAnswerEnum answer) => this(answer: answer);

  @override
  MyPollAnswer answeredAt(DateTime answeredAt) => this(answeredAt: answeredAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MyPollAnswer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MyPollAnswer(...).copyWith(id: 12, name: "My name")
  /// ````
  MyPollAnswer call({
    Object? unitId = const $CopyWithPlaceholder(),
    Object? answer = const $CopyWithPlaceholder(),
    Object? answeredAt = const $CopyWithPlaceholder(),
  }) {
    return MyPollAnswer(
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as String,
      answer: answer == const $CopyWithPlaceholder()
          ? _value.answer
          // ignore: cast_nullable_to_non_nullable
          : answer as MyPollAnswerAnswerEnum,
      answeredAt: answeredAt == const $CopyWithPlaceholder()
          ? _value.answeredAt
          // ignore: cast_nullable_to_non_nullable
          : answeredAt as DateTime,
    );
  }
}

extension $MyPollAnswerCopyWith on MyPollAnswer {
  /// Returns a callable class that can be used as follows: `instanceOfMyPollAnswer.copyWith(...)` or like so:`instanceOfMyPollAnswer.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MyPollAnswerCWProxy get copyWith => _$MyPollAnswerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPollAnswer _$MyPollAnswerFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MyPollAnswer',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['unit_id', 'answer', 'answered_at'],
        );
        final val = MyPollAnswer(
          unitId: $checkedConvert('unit_id', (v) => v as String),
          answer: $checkedConvert(
            'answer',
            (v) => $enumDecode(
              _$MyPollAnswerAnswerEnumEnumMap,
              v,
              unknownValue: MyPollAnswerAnswerEnum.unknownDefaultOpenApi,
            ),
          ),
          answeredAt: $checkedConvert(
            'answered_at',
            (v) => DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {'unitId': 'unit_id', 'answeredAt': 'answered_at'},
    );

Map<String, dynamic> _$MyPollAnswerToJson(MyPollAnswer instance) =>
    <String, dynamic>{
      'unit_id': instance.unitId,
      'answer': _$MyPollAnswerAnswerEnumEnumMap[instance.answer]!,
      'answered_at': instance.answeredAt.toIso8601String(),
    };

const _$MyPollAnswerAnswerEnumEnumMap = {
  MyPollAnswerAnswerEnum.yes: 'yes',
  MyPollAnswerAnswerEnum.no: 'no',
  MyPollAnswerAnswerEnum.abstain: 'abstain',
  MyPollAnswerAnswerEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
