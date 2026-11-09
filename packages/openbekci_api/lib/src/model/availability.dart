//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/time_range.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'availability.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Availability {
  /// Returns a new [Availability] instance.
  Availability({

    required  this.facilityId,

    required  this.from,

    required  this.to,

    required  this.taken,

    required  this.blocked,
  });

  @JsonKey(
    
    name: r'facility_id',
    required: true,
    includeIfNull: false,
  )


  final String facilityId;



  @JsonKey(
    
    name: r'from',
    required: true,
    includeIfNull: false,
  )


  final DateTime from;



  @JsonKey(
    
    name: r'to',
    required: true,
    includeIfNull: false,
  )


  final DateTime to;



      /// Residents see slots only as taken; names stay with the manager (KVKK).
  @JsonKey(
    
    name: r'taken',
    required: true,
    includeIfNull: false,
  )


  final List<TimeRange> taken;



  @JsonKey(
    
    name: r'blocked',
    required: true,
    includeIfNull: false,
  )


  final List<TimeRange> blocked;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Availability &&
      other.facilityId == facilityId &&
      other.from == from &&
      other.to == to &&
      other.taken == taken &&
      other.blocked == blocked;

    @override
    int get hashCode =>
        facilityId.hashCode +
        from.hashCode +
        to.hashCode +
        taken.hashCode +
        blocked.hashCode;

  factory Availability.fromJson(Map<String, dynamic> json) => _$AvailabilityFromJson(json);

  Map<String, dynamic> toJson() => _$AvailabilityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

