//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'opening_hours.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OpeningHours {
  /// Returns a new [OpeningHours] instance.
  OpeningHours({

    required  this.days,

    required  this.start,

    required  this.end,
  });

      /// ISO weekdays, 1 = Monday.
  @JsonKey(
    
    name: r'days',
    required: true,
    includeIfNull: false,
  )


  final List<int> days;



  @JsonKey(
    
    name: r'start',
    required: true,
    includeIfNull: false,
  )


  final String start;



  @JsonKey(
    
    name: r'end',
    required: true,
    includeIfNull: false,
  )


  final String end;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OpeningHours &&
      other.days == days &&
      other.start == start &&
      other.end == end;

    @override
    int get hashCode =>
        days.hashCode +
        start.hashCode +
        end.hashCode;

  factory OpeningHours.fromJson(Map<String, dynamic> json) => _$OpeningHoursFromJson(json);

  Map<String, dynamic> toJson() => _$OpeningHoursToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

