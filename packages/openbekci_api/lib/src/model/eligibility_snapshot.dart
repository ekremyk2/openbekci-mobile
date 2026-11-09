//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/eligibility_owner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'eligibility_snapshot.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class EligibilitySnapshot {
  /// Returns a new [EligibilitySnapshot] instance.
  EligibilitySnapshot({

    required  this.takenAt,

    required  this.asOf,

    required  this.voteWeight,

    required  this.shareBasis,

    required  this.unitCount,

    required  this.totalVotes,

    required  this.totalShare,

    required  this.owners,

    required  this.unrepresentedUnits,
  });

      /// When the snapshot was computed.
  @JsonKey(
    
    name: r'taken_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime takenAt;



      /// The day whose owners of record it lists.
  @JsonKey(
    
    name: r'as_of',
    required: true,
    includeIfNull: false,
  )


  final DateTime asOf;



      /// Open enum. `per_unit` or `per_owner`.
  @JsonKey(
    
    name: r'vote_weight',
    required: true,
    includeIfNull: false,
  unknownEnumValue: EligibilitySnapshotVoteWeightEnum.unknownDefaultOpenApi,
  )


  final EligibilitySnapshotVoteWeightEnum voteWeight;



      /// `arsa_payi`, or `equal` when the site has no arsa payi values.
  @JsonKey(
    
    name: r'share_basis',
    required: true,
    includeIfNull: false,
  )


  final String shareBasis;



  @JsonKey(
    
    name: r'unit_count',
    required: true,
    includeIfNull: false,
  )


  final int unitCount;



  @JsonKey(
    
    name: r'total_votes',
    required: true,
    includeIfNull: false,
  )


  final int totalVotes;



  @JsonKey(
    
    name: r'total_share',
    required: true,
    includeIfNull: false,
  )


  final num totalShare;



  @JsonKey(
    
    name: r'owners',
    required: true,
    includeIfNull: false,
  )


  final List<EligibilityOwner> owners;



      /// Door numbers of units without an owner of record; nobody votes for them.
  @JsonKey(
    
    name: r'unrepresented_units',
    required: true,
    includeIfNull: false,
  )


  final List<String> unrepresentedUnits;





    @override
    bool operator ==(Object other) => identical(this, other) || other is EligibilitySnapshot &&
      other.takenAt == takenAt &&
      other.asOf == asOf &&
      other.voteWeight == voteWeight &&
      other.shareBasis == shareBasis &&
      other.unitCount == unitCount &&
      other.totalVotes == totalVotes &&
      other.totalShare == totalShare &&
      other.owners == owners &&
      other.unrepresentedUnits == unrepresentedUnits;

    @override
    int get hashCode =>
        takenAt.hashCode +
        asOf.hashCode +
        voteWeight.hashCode +
        shareBasis.hashCode +
        unitCount.hashCode +
        totalVotes.hashCode +
        totalShare.hashCode +
        owners.hashCode +
        unrepresentedUnits.hashCode;

  factory EligibilitySnapshot.fromJson(Map<String, dynamic> json) => _$EligibilitySnapshotFromJson(json);

  Map<String, dynamic> toJson() => _$EligibilitySnapshotToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum. `per_unit` or `per_owner`.
enum EligibilitySnapshotVoteWeightEnum {
@JsonValue(r'per_unit')
perUnit(r'per_unit'),
@JsonValue(r'per_owner')
perOwner(r'per_owner'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const EligibilitySnapshotVoteWeightEnum(this.value);

final String value;

@override
String toString() => value;
}


