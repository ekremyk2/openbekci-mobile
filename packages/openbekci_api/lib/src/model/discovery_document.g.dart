// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovery_document.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DiscoveryDocumentCWProxy {
  DiscoveryDocument instanceId(String instanceId);

  DiscoveryDocument instanceName(String instanceName);

  DiscoveryDocument apiBaseUrl(String apiBaseUrl);

  DiscoveryDocument apiVersions(List<String> apiVersions);

  DiscoveryDocument serverVersion(String serverVersion);

  DiscoveryDocument sdkVersion(String? sdkVersion);

  DiscoveryDocument minAppVersion(MinAppVersion minAppVersion);

  DiscoveryDocument authMethods(List<AuthMethod> authMethods);

  DiscoveryDocument push(PushInfo push);

  DiscoveryDocument packs(List<String> packs);

  DiscoveryDocument branding(Branding branding);

  DiscoveryDocument relayEnrollment(RelayEnrollment relayEnrollment);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiscoveryDocument(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiscoveryDocument(...).copyWith(id: 12, name: "My name")
  /// ````
  DiscoveryDocument call({
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
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDiscoveryDocument.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDiscoveryDocument.copyWith.fieldName(...)`
class _$DiscoveryDocumentCWProxyImpl implements _$DiscoveryDocumentCWProxy {
  const _$DiscoveryDocumentCWProxyImpl(this._value);

  final DiscoveryDocument _value;

  @override
  DiscoveryDocument instanceId(String instanceId) =>
      this(instanceId: instanceId);

  @override
  DiscoveryDocument instanceName(String instanceName) =>
      this(instanceName: instanceName);

  @override
  DiscoveryDocument apiBaseUrl(String apiBaseUrl) =>
      this(apiBaseUrl: apiBaseUrl);

  @override
  DiscoveryDocument apiVersions(List<String> apiVersions) =>
      this(apiVersions: apiVersions);

  @override
  DiscoveryDocument serverVersion(String serverVersion) =>
      this(serverVersion: serverVersion);

  @override
  DiscoveryDocument sdkVersion(String? sdkVersion) =>
      this(sdkVersion: sdkVersion);

  @override
  DiscoveryDocument minAppVersion(MinAppVersion minAppVersion) =>
      this(minAppVersion: minAppVersion);

  @override
  DiscoveryDocument authMethods(List<AuthMethod> authMethods) =>
      this(authMethods: authMethods);

  @override
  DiscoveryDocument push(PushInfo push) => this(push: push);

  @override
  DiscoveryDocument packs(List<String> packs) => this(packs: packs);

  @override
  DiscoveryDocument branding(Branding branding) => this(branding: branding);

  @override
  DiscoveryDocument relayEnrollment(RelayEnrollment relayEnrollment) =>
      this(relayEnrollment: relayEnrollment);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiscoveryDocument(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiscoveryDocument(...).copyWith(id: 12, name: "My name")
  /// ````
  DiscoveryDocument call({
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
  }) {
    return DiscoveryDocument(
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
    );
  }
}

extension $DiscoveryDocumentCopyWith on DiscoveryDocument {
  /// Returns a callable class that can be used as follows: `instanceOfDiscoveryDocument.copyWith(...)` or like so:`instanceOfDiscoveryDocument.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DiscoveryDocumentCWProxy get copyWith =>
      _$DiscoveryDocumentCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscoveryDocument _$DiscoveryDocumentFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DiscoveryDocument',
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
          ],
        );
        final val = DiscoveryDocument(
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
      },
    );

Map<String, dynamic> _$DiscoveryDocumentToJson(DiscoveryDocument instance) =>
    <String, dynamic>{
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
    };
