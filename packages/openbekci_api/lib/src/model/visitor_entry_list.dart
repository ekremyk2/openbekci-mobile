//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/visitor_entry.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'visitor_entry_list.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VisitorEntryList {
  /// Returns a new [VisitorEntryList] instance.
  VisitorEntryList({

    required  this.items,

    required  this.nextCursor,
  });

  @JsonKey(
    
    name: r'items',
    required: true,
    includeIfNull: false,
  )


  final List<VisitorEntry> items;



      /// Pass as `cursor` for the next page; null on the last page.
  @JsonKey(
    
    name: r'next_cursor',
    required: true,
    includeIfNull: true,
  )


  final String? nextCursor;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VisitorEntryList &&
      other.items == items &&
      other.nextCursor == nextCursor;

    @override
    int get hashCode =>
        items.hashCode +
        (nextCursor == null ? 0 : nextCursor.hashCode);

  factory VisitorEntryList.fromJson(Map<String, dynamic> json) => _$VisitorEntryListFromJson(json);

  Map<String, dynamic> toJson() => _$VisitorEntryListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

