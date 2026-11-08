//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/occupancy.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'occupancy_list.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OccupancyList {
  /// Returns a new [OccupancyList] instance.
  OccupancyList({

    required  this.items,

    required  this.nextCursor,
  });

  @JsonKey(
    
    name: r'items',
    required: true,
    includeIfNull: false,
  )


  final List<Occupancy> items;



      /// Pass as `cursor` for the next page; null on the last page.
  @JsonKey(
    
    name: r'next_cursor',
    required: true,
    includeIfNull: true,
  )


  final String? nextCursor;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OccupancyList &&
      other.items == items &&
      other.nextCursor == nextCursor;

    @override
    int get hashCode =>
        items.hashCode +
        (nextCursor == null ? 0 : nextCursor.hashCode);

  factory OccupancyList.fromJson(Map<String, dynamic> json) => _$OccupancyListFromJson(json);

  Map<String, dynamic> toJson() => _$OccupancyListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

