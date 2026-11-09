//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'eligibility_owner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class EligibilityOwner {
  /// Returns a new [EligibilityOwner] instance.
  EligibilityOwner({

    required  this.personId,

    required  this.displayName,

    required  this.unitIds,

    required  this.unitLabels,

    required  this.share,

    required  this.voteWeight,

    required  this.representativeOfUnitIds,
  });

  @JsonKey(
    
    name: r'person_id',
    required: true,
    includeIfNull: false,
  )


  final String personId;



  @JsonKey(
    
    name: r'display_name',
    required: true,
    includeIfNull: false,
  )


  final String displayName;



      /// Every unit the person owns, including co-owned units another owner votes for.
  @JsonKey(
    
    name: r'unit_ids',
    required: true,
    includeIfNull: false,
  )


  final List<String> unitIds;



      /// Door numbers of `unit_ids`.
  @JsonKey(
    
    name: r'unit_labels',
    required: true,
    includeIfNull: false,
  )


  final List<String> unitLabels;



      /// The arsa payi the person votes for, a decimal string (exact, not a float).
  @JsonKey(
    
    name: r'share',
    required: true,
    includeIfNull: false,
  )


  final String share;



      /// Number of votes the person holds (before the per-person cap).
  @JsonKey(
    
    name: r'vote_weight',
    required: true,
    includeIfNull: false,
  )


  final int voteWeight;



      /// The units this person votes for (co-owners vote through one representative).
  @JsonKey(
    
    name: r'representative_of_unit_ids',
    required: true,
    includeIfNull: false,
  )


  final List<String> representativeOfUnitIds;





    @override
    bool operator ==(Object other) => identical(this, other) || other is EligibilityOwner &&
      other.personId == personId &&
      other.displayName == displayName &&
      other.unitIds == unitIds &&
      other.unitLabels == unitLabels &&
      other.share == share &&
      other.voteWeight == voteWeight &&
      other.representativeOfUnitIds == representativeOfUnitIds;

    @override
    int get hashCode =>
        personId.hashCode +
        displayName.hashCode +
        unitIds.hashCode +
        unitLabels.hashCode +
        share.hashCode +
        voteWeight.hashCode +
        representativeOfUnitIds.hashCode;

  factory EligibilityOwner.fromJson(Map<String, dynamic> json) => _$EligibilityOwnerFromJson(json);

  Map<String, dynamic> toJson() => _$EligibilityOwnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

