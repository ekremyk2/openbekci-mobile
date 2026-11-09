// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_poll.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MyPollCWProxy {
  MyPoll agendaItemId(String agendaItemId);

  MyPoll title(String title);

  MyPoll answeredUnits(List<String> answeredUnits);

  MyPoll answers(List<MyPollAnswer> answers);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MyPoll(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MyPoll(...).copyWith(id: 12, name: "My name")
  /// ````
  MyPoll call({
    String agendaItemId,
    String title,
    List<String> answeredUnits,
    List<MyPollAnswer> answers,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMyPoll.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMyPoll.copyWith.fieldName(...)`
class _$MyPollCWProxyImpl implements _$MyPollCWProxy {
  const _$MyPollCWProxyImpl(this._value);

  final MyPoll _value;

  @override
  MyPoll agendaItemId(String agendaItemId) => this(agendaItemId: agendaItemId);

  @override
  MyPoll title(String title) => this(title: title);

  @override
  MyPoll answeredUnits(List<String> answeredUnits) =>
      this(answeredUnits: answeredUnits);

  @override
  MyPoll answers(List<MyPollAnswer> answers) => this(answers: answers);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MyPoll(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MyPoll(...).copyWith(id: 12, name: "My name")
  /// ````
  MyPoll call({
    Object? agendaItemId = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? answeredUnits = const $CopyWithPlaceholder(),
    Object? answers = const $CopyWithPlaceholder(),
  }) {
    return MyPoll(
      agendaItemId: agendaItemId == const $CopyWithPlaceholder()
          ? _value.agendaItemId
          // ignore: cast_nullable_to_non_nullable
          : agendaItemId as String,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      answeredUnits: answeredUnits == const $CopyWithPlaceholder()
          ? _value.answeredUnits
          // ignore: cast_nullable_to_non_nullable
          : answeredUnits as List<String>,
      answers: answers == const $CopyWithPlaceholder()
          ? _value.answers
          // ignore: cast_nullable_to_non_nullable
          : answers as List<MyPollAnswer>,
    );
  }
}

extension $MyPollCopyWith on MyPoll {
  /// Returns a callable class that can be used as follows: `instanceOfMyPoll.copyWith(...)` or like so:`instanceOfMyPoll.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MyPollCWProxy get copyWith => _$MyPollCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPoll _$MyPollFromJson(Map<String, dynamic> json) => $checkedCreate(
  'MyPoll',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'agenda_item_id',
        'title',
        'answered_units',
        'answers',
      ],
    );
    final val = MyPoll(
      agendaItemId: $checkedConvert('agenda_item_id', (v) => v as String),
      title: $checkedConvert('title', (v) => v as String),
      answeredUnits: $checkedConvert(
        'answered_units',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      answers: $checkedConvert(
        'answers',
        (v) => (v as List<dynamic>)
            .map((e) => MyPollAnswer.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'agendaItemId': 'agenda_item_id',
    'answeredUnits': 'answered_units',
  },
);

Map<String, dynamic> _$MyPollToJson(MyPoll instance) => <String, dynamic>{
  'agenda_item_id': instance.agendaItemId,
  'title': instance.title,
  'answered_units': instance.answeredUnits,
  'answers': instance.answers.map((e) => e.toJson()).toList(),
};
