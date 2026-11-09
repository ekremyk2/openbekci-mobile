// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instance.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InstanceCWProxy {
  Instance instanceId(String instanceId);

  Instance instanceName(String instanceName);

  Instance apiBaseUrl(String apiBaseUrl);

  Instance apiVersions(List<String> apiVersions);

  Instance serverVersion(String serverVersion);

  Instance sdkVersion(String? sdkVersion);

  Instance minAppVersion(MinAppVersion minAppVersion);

  Instance authMethods(List<AuthMethod> authMethods);

  Instance push(PushInfo push);

  Instance packs(List<String> packs);

  Instance branding(Branding branding);

  Instance relayEnrollment(RelayEnrollment relayEnrollment);

  Instance policies(Map<String, Object> policies);

  Instance packDetails(List<InstancePack> packDetails);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Instance(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Instance(...).copyWith(id: 12, name: "My name")
  /// ````
  Instance call({
    String instanceId,
    String instanceName,
    String apiBaseUrl,
    List<String> apiVersions,
    String serverVersion,
    String? sdkVersion,
    MinAppVersion minAppVersion,
    List<AuthMethod> authMethods,
    PushInfo push,
    List<String> packs,
    Branding branding,
    RelayEnrollment relayEnrollment,
    Map<String, Object> policies,
    List<InstancePack> packDetails,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInstance.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInstance.copyWith.fieldName(...)`
class _$InstanceCWProxyImpl implements _$InstanceCWProxy {
  const _$InstanceCWProxyImpl(this._value);

  final Instance _value;

  @override
  Instance instanceId(String instanceId) => this(instanceId: instanceId);

  @override
  Instance instanceName(String instanceName) =>
      this(instanceName: instanceName);

  @override
  Instance apiBaseUrl(String apiBaseUrl) => this(apiBaseUrl: apiBaseUrl);

  @override
  Instance apiVersions(List<String> apiVersions) =>
      this(apiVersions: apiVersions);

  @override
  Instance serverVersion(String serverVersion) =>
      this(serverVersion: serverVersion);

  @override
  Instance sdkVersion(String? sdkVersion) => this(sdkVersion: sdkVersion);

  @override
  Instance minAppVersion(MinAppVersion minAppVersion) =>
      this(minAppVersion: minAppVersion);

  @override
  Instance authMethods(List<AuthMethod> authMethods) =>
      this(authMethods: authMethods);

  @override
  Instance push(PushInfo push) => this(push: push);

  @override
  Instance packs(List<String> packs) => this(packs: packs);

  @override
  Instance branding(Branding branding) => this(branding: branding);

  @override
  Instance relayEnrollment(RelayEnrollment relayEnrollment) =>
      this(relayEnrollment: relayEnrollment);

  @override
  Instance policies(Map<String, Object> policies) => this(policies: policies);

  @override
  Instance packDetails(List<InstancePack> packDetails) =>
      this(packDetails: packDetails);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Instance(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Instance(...).copyWith(id: 12, name: "My name")
  /// ````
  Instance call({
    Object? instanceId = const $CopyWithPlaceholder(),
    Object? instanceName = const $CopyWithPlaceholder(),
    Object? apiBaseUrl = const $CopyWithPlaceholder(),
    Object? apiVersions = const $CopyWithPlaceholder(),
    Object? serverVersion = const $CopyWithPlaceholder(),
    Object? sdkVersion = const $CopyWithPlaceholder(),
    Object? minAppVersion = const $CopyWithPlaceholder(),
    Object? authMethods = const $CopyWithPlaceholder(),
    Object? push = const $CopyWithPlaceholder(),
    Object? packs = const $CopyWithPlaceholder(),
    Object? branding = const $CopyWithPlaceholder(),
    Object? relayEnrollment = const $CopyWithPlaceholder(),
    Object? policies = const $CopyWithPlaceholder(),
    Object? packDetails = const $CopyWithPlaceholder(),
  }) {
    return Instance(
      instanceId: instanceId == const $CopyWithPlaceholder()
          ? _value.instanceId
          // ignore: cast_nullable_to_non_nullable
          : instanceId as String,
      instanceName: instanceName == const $CopyWithPlaceholder()
          ? _value.instanceName
          // ignore: cast_nullable_to_non_nullable
          : instanceName as String,
      apiBaseUrl: apiBaseUrl == const $CopyWithPlaceholder()
          ? _value.apiBaseUrl
          // ignore: cast_nullable_to_non_nullable
          : apiBaseUrl as String,
      apiVersions: apiVersions == const $CopyWithPlaceholder()
          ? _value.apiVersions
          // ignore: cast_nullable_to_non_nullable
          : apiVersions as List<String>,
      serverVersion: serverVersion == const $CopyWithPlaceholder()
          ? _value.serverVersion
          // ignore: cast_nullable_to_non_nullable
          : serverVersion as String,
      sdkVersion: sdkVersion == const $CopyWithPlaceholder()
          ? _value.sdkVersion
          // ignore: cast_nullable_to_non_nullable
          : sdkVersion as String?,
      minAppVersion: minAppVersion == const $CopyWithPlaceholder()
          ? _value.minAppVersion
          // ignore: cast_nullable_to_non_nullable
          : minAppVersion as MinAppVersion,
      authMethods: authMethods == const $CopyWithPlaceholder()
          ? _value.authMethods
          // ignore: cast_nullable_to_non_nullable
          : authMethods as List<AuthMethod>,
      push: push == const $CopyWithPlaceholder()
          ? _value.push
          // ignore: cast_nullable_to_non_nullable
          : push as PushInfo,
      packs: packs == const $CopyWithPlaceholder()
          ? _value.packs
          // ignore: cast_nullable_to_non_nullable
          : packs as List<String>,
      branding: branding == const $CopyWithPlaceholder()
          ? _value.branding
          // ignore: cast_nullable_to_non_nullable
          : branding as Branding,
      relayEnrollment: relayEnrollment == const $CopyWithPlaceholder()
          ? _value.relayEnrollment
          // ignore: cast_nullable_to_non_nullable
          : relayEnrollment as RelayEnrollment,
      policies: policies == const $CopyWithPlaceholder()
          ? _value.policies
          // ignore: cast_nullable_to_non_nullable
          : policies as Map<String, Object>,
      packDetails: packDetails == const $CopyWithPlaceholder()
          ? _value.packDetails
          // ignore: cast_nullable_to_non_nullable
          : packDetails as List<InstancePack>,
    );
  }
}

extension $InstanceCopyWith on Instance {
  /// Returns a callable class that can be used as follows: `instanceOfInstance.copyWith(...)` or like so:`instanceOfInstance.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InstanceCWProxy get copyWith => _$InstanceCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Instance _$InstanceFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Instance',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'instance_id',
        'instance_name',
        'api_base_url',
        'api_versions',
        'server_version',
        'sdk_version',
        'min_app_version',
        'auth_methods',
        'push',
        'packs',
        'branding',
        'relay_enrollment',
        'policies',
        'pack_details',
      ],
    );
    final val = Instance(
      instanceId: $checkedConvert('instance_id', (v) => v as String),
      instanceName: $checkedConvert('instance_name', (v) => v as String),
      apiBaseUrl: $checkedConvert('api_base_url', (v) => v as String),
      apiVersions: $checkedConvert(
        'api_versions',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      serverVersion: $checkedConvert('server_version', (v) => v as String),
      sdkVersion: $checkedConvert('sdk_version', (v) => v as String?),
      minAppVersion: $checkedConvert(
        'min_app_version',
        (v) => MinAppVersion.fromJson(v as Map<String, dynamic>),
      ),
      authMethods: $checkedConvert(
        'auth_methods',
        (v) => (v as List<dynamic>)
            .map((e) => AuthMethod.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      push: $checkedConvert(
        'push',
        (v) => PushInfo.fromJson(v as Map<String, dynamic>),
      ),
      packs: $checkedConvert(
        'packs',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      branding: $checkedConvert(
        'branding',
        (v) => Branding.fromJson(v as Map<String, dynamic>),
      ),
      relayEnrollment: $checkedConvert(
        'relay_enrollment',
        (v) => RelayEnrollment.fromJson(v as Map<String, dynamic>),
      ),
      policies: $checkedConvert(
        'policies',
        (v) =>
            (v as Map<String, dynamic>).map((k, e) => MapEntry(k, e as Object)),
      ),
      packDetails: $checkedConvert(
        'pack_details',
        (v) => (v as List<dynamic>)
            .map((e) => InstancePack.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'instanceId': 'instance_id',
    'instanceName': 'instance_name',
    'apiBaseUrl': 'api_base_url',
    'apiVersions': 'api_versions',
    'serverVersion': 'server_version',
    'sdkVersion': 'sdk_version',
    'minAppVersion': 'min_app_version',
    'authMethods': 'auth_methods',
    'relayEnrollment': 'relay_enrollment',
    'packDetails': 'pack_details',
  },
);

Map<String, dynamic> _$InstanceToJson(Instance instance) => <String, dynamic>{
  'instance_id': instance.instanceId,
  'instance_name': instance.instanceName,
  'api_base_url': instance.apiBaseUrl,
  'api_versions': instance.apiVersions,
  'server_version': instance.serverVersion,
  'sdk_version': instance.sdkVersion,
  'min_app_version': instance.minAppVersion.toJson(),
  'auth_methods': instance.authMethods.map((e) => e.toJson()).toList(),
  'push': instance.push.toJson(),
  'packs': instance.packs,
  'branding': instance.branding.toJson(),
  'relay_enrollment': instance.relayEnrollment.toJson(),
  'policies': instance.policies,
  'pack_details': instance.packDetails.map((e) => e.toJson()).toList(),
};
