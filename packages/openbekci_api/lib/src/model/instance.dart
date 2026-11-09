//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/push_info.dart';
import 'package:openbekci_api/src/model/instance_pack.dart';
import 'package:openbekci_api/src/model/auth_method.dart';
import 'package:openbekci_api/src/model/min_app_version.dart';
import 'package:openbekci_api/src/model/branding.dart';
import 'package:openbekci_api/src/model/relay_enrollment.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'instance.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Instance {
  /// Returns a new [Instance] instance.
  Instance({

    required  this.instanceId,

    required  this.instanceName,

    required  this.apiBaseUrl,

    required  this.apiVersions,

    required  this.serverVersion,

    required  this.sdkVersion,

    required  this.minAppVersion,

    required  this.authMethods,

    required  this.push,

    required  this.packs,

    required  this.branding,

    required  this.relayEnrollment,

    required  this.policies,

    required  this.packDetails,
  });

      /// Stable for the life of the instance.
  @JsonKey(
    
    name: r'instance_id',
    required: true,
    includeIfNull: false,
  )


  final String instanceId;



  @JsonKey(
    
    name: r'instance_name',
    required: true,
    includeIfNull: false,
  )


  final String instanceName;



  @JsonKey(
    
    name: r'api_base_url',
    required: true,
    includeIfNull: false,
  )


  final String apiBaseUrl;



  @JsonKey(
    
    name: r'api_versions',
    required: true,
    includeIfNull: false,
  )


  final List<String> apiVersions;



  @JsonKey(
    
    name: r'server_version',
    required: true,
    includeIfNull: false,
  )


  final String serverVersion;



      /// Pack SDK version, null until packs exist.
  @JsonKey(
    
    name: r'sdk_version',
    required: true,
    includeIfNull: true,
  )


  final String? sdkVersion;



  @JsonKey(
    
    name: r'min_app_version',
    required: true,
    includeIfNull: false,
  )


  final MinAppVersion minAppVersion;



  @JsonKey(
    
    name: r'auth_methods',
    required: true,
    includeIfNull: false,
  )


  final List<AuthMethod> authMethods;



  @JsonKey(
    
    name: r'push',
    required: true,
    includeIfNull: false,
  )


  final PushInfo push;



  @JsonKey(
    
    name: r'packs',
    required: true,
    includeIfNull: false,
  )


  final List<String> packs;



  @JsonKey(
    
    name: r'branding',
    required: true,
    includeIfNull: false,
  )


  final Branding branding;



  @JsonKey(
    
    name: r'relay_enrollment',
    required: true,
    includeIfNull: false,
  )


  final RelayEnrollment relayEnrollment;



      /// Instance policies. Empty until later phases add some.
  @JsonKey(
    
    name: r'policies',
    required: true,
    includeIfNull: false,
  )


  final Map<String, Object> policies;



      /// The packs compiled into this server (`packs` lists the ones enabled for at least one organization).
  @JsonKey(
    
    name: r'pack_details',
    required: true,
    includeIfNull: false,
  )


  final List<InstancePack> packDetails;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Instance &&
      other.instanceId == instanceId &&
      other.instanceName == instanceName &&
      other.apiBaseUrl == apiBaseUrl &&
      other.apiVersions == apiVersions &&
      other.serverVersion == serverVersion &&
      other.sdkVersion == sdkVersion &&
      other.minAppVersion == minAppVersion &&
      other.authMethods == authMethods &&
      other.push == push &&
      other.packs == packs &&
      other.branding == branding &&
      other.relayEnrollment == relayEnrollment &&
      other.policies == policies &&
      other.packDetails == packDetails;

    @override
    int get hashCode =>
        instanceId.hashCode +
        instanceName.hashCode +
        apiBaseUrl.hashCode +
        apiVersions.hashCode +
        serverVersion.hashCode +
        (sdkVersion == null ? 0 : sdkVersion.hashCode) +
        minAppVersion.hashCode +
        authMethods.hashCode +
        push.hashCode +
        packs.hashCode +
        branding.hashCode +
        relayEnrollment.hashCode +
        policies.hashCode +
        packDetails.hashCode;

  factory Instance.fromJson(Map<String, dynamic> json) => _$InstanceFromJson(json);

  Map<String, dynamic> toJson() => _$InstanceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

