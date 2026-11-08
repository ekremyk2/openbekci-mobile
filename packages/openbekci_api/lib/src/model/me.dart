//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/org_access.dart';
import 'package:openbekci_api/src/model/me_occupancy.dart';
import 'package:openbekci_api/src/model/me_user.dart';
import 'package:openbekci_api/src/model/me_policies.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'me.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Me {
  /// Returns a new [Me] instance.
  Me({

    required  this.user,

    required  this.organizations,

    required  this.occupancies,

    required  this.policies,
  });

  @JsonKey(
    
    name: r'user',
    required: true,
    includeIfNull: false,
  )


  final MeUser user;



  @JsonKey(
    
    name: r'organizations',
    required: true,
    includeIfNull: false,
  )


  final List<OrgAccess> organizations;



      /// The caller's unit occupancies across organizations (owner, tenant, household; former ones only inside their dates). Empty until the people module lands.
  @JsonKey(
    
    name: r'occupancies',
    required: true,
    includeIfNull: false,
  )


  final List<MeOccupancy> occupancies;



  @JsonKey(
    
    name: r'policies',
    required: true,
    includeIfNull: false,
  )


  final MePolicies policies;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Me &&
      other.user == user &&
      other.organizations == organizations &&
      other.occupancies == occupancies &&
      other.policies == policies;

    @override
    int get hashCode =>
        user.hashCode +
        organizations.hashCode +
        occupancies.hashCode +
        policies.hashCode;

  factory Me.fromJson(Map<String, dynamic> json) => _$MeFromJson(json);

  Map<String, dynamic> toJson() => _$MeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

