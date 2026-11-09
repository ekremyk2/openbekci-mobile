//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking_cancel.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BookingCancel {
  /// Returns a new [BookingCancel] instance.
  BookingCancel({

     this.reason,
  });

  @JsonKey(
    
    name: r'reason',
    required: false,
    includeIfNull: false,
  )


  final String? reason;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BookingCancel &&
      other.reason == reason;

    @override
    int get hashCode =>
        reason.hashCode;

  factory BookingCancel.fromJson(Map<String, dynamic> json) => _$BookingCancelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingCancelToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

