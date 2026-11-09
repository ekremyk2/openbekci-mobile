//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_vote.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TicketVote {
  /// Returns a new [TicketVote] instance.
  TicketVote({

    required  this.ticketId,

    required  this.voteCount,

    required  this.voted,
  });

  @JsonKey(
    
    name: r'ticket_id',
    required: true,
    includeIfNull: false,
  )


  final String ticketId;



  @JsonKey(
    
    name: r'vote_count',
    required: true,
    includeIfNull: false,
  )


  final int voteCount;



  @JsonKey(
    
    name: r'voted',
    required: true,
    includeIfNull: false,
  )


  final bool voted;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TicketVote &&
      other.ticketId == ticketId &&
      other.voteCount == voteCount &&
      other.voted == voted;

    @override
    int get hashCode =>
        ticketId.hashCode +
        voteCount.hashCode +
        voted.hashCode;

  factory TicketVote.fromJson(Map<String, dynamic> json) => _$TicketVoteFromJson(json);

  Map<String, dynamic> toJson() => _$TicketVoteToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

