// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_vote.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketVoteCWProxy {
  TicketVote ticketId(String ticketId);

  TicketVote voteCount(int voteCount);

  TicketVote voted(bool voted);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketVote(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketVote(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketVote call({String ticketId, int voteCount, bool voted});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketVote.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketVote.copyWith.fieldName(...)`
class _$TicketVoteCWProxyImpl implements _$TicketVoteCWProxy {
  const _$TicketVoteCWProxyImpl(this._value);

  final TicketVote _value;

  @override
  TicketVote ticketId(String ticketId) => this(ticketId: ticketId);

  @override
  TicketVote voteCount(int voteCount) => this(voteCount: voteCount);

  @override
  TicketVote voted(bool voted) => this(voted: voted);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketVote(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketVote(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketVote call({
    Object? ticketId = const $CopyWithPlaceholder(),
    Object? voteCount = const $CopyWithPlaceholder(),
    Object? voted = const $CopyWithPlaceholder(),
  }) {
    return TicketVote(
      ticketId: ticketId == const $CopyWithPlaceholder()
          ? _value.ticketId
          // ignore: cast_nullable_to_non_nullable
          : ticketId as String,
      voteCount: voteCount == const $CopyWithPlaceholder()
          ? _value.voteCount
          // ignore: cast_nullable_to_non_nullable
          : voteCount as int,
      voted: voted == const $CopyWithPlaceholder()
          ? _value.voted
          // ignore: cast_nullable_to_non_nullable
          : voted as bool,
    );
  }
}

extension $TicketVoteCopyWith on TicketVote {
  /// Returns a callable class that can be used as follows: `instanceOfTicketVote.copyWith(...)` or like so:`instanceOfTicketVote.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketVoteCWProxy get copyWith => _$TicketVoteCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketVote _$TicketVoteFromJson(Map<String, dynamic> json) => $checkedCreate(
  'TicketVote',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['ticket_id', 'vote_count', 'voted']);
    final val = TicketVote(
      ticketId: $checkedConvert('ticket_id', (v) => v as String),
      voteCount: $checkedConvert('vote_count', (v) => (v as num).toInt()),
      voted: $checkedConvert('voted', (v) => v as bool),
    );
    return val;
  },
  fieldKeyMap: const {'ticketId': 'ticket_id', 'voteCount': 'vote_count'},
);

Map<String, dynamic> _$TicketVoteToJson(TicketVote instance) =>
    <String, dynamic>{
      'ticket_id': instance.ticketId,
      'vote_count': instance.voteCount,
      'voted': instance.voted,
    };
