//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/session.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session_list.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SessionList {
  /// Returns a new [SessionList] instance.
  SessionList({

    required  this.items,

    required  this.nextCursor,
  });

  @JsonKey(
    
    name: r'items',
    required: true,
    includeIfNull: false,
  )


  final List<Session> items;



      /// Always null; the list is short and returned whole.
  @JsonKey(
    
    name: r'next_cursor',
    required: true,
    includeIfNull: true,
  )


  final String? nextCursor;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SessionList &&
      other.items == items &&
      other.nextCursor == nextCursor;

    @override
    int get hashCode =>
        items.hashCode +
        (nextCursor == null ? 0 : nextCursor.hashCode);

  factory SessionList.fromJson(Map<String, dynamic> json) => _$SessionListFromJson(json);

  Map<String, dynamic> toJson() => _$SessionListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

