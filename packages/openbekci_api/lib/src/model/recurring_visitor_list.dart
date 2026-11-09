//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/recurring_visitor.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recurring_visitor_list.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RecurringVisitorList {
  /// Returns a new [RecurringVisitorList] instance.
  RecurringVisitorList({

    required  this.items,

    required  this.nextCursor,
  });

  @JsonKey(
    
    name: r'items',
    required: true,
    includeIfNull: false,
  )


  final List<RecurringVisitor> items;



      /// Pass as `cursor` for the next page; null on the last page.
  @JsonKey(
    
    name: r'next_cursor',
    required: true,
    includeIfNull: true,
  )


  final String? nextCursor;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RecurringVisitorList &&
      other.items == items &&
      other.nextCursor == nextCursor;

    @override
    int get hashCode =>
        items.hashCode +
        (nextCursor == null ? 0 : nextCursor.hashCode);

  factory RecurringVisitorList.fromJson(Map<String, dynamic> json) => _$RecurringVisitorListFromJson(json);

  Map<String, dynamic> toJson() => _$RecurringVisitorListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

