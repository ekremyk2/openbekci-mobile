// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org_access.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OrgAccessCWProxy {
  OrgAccess defaultLocale(String defaultLocale);

  OrgAccess id(String id);

  OrgAccess slug(String slug);

  OrgAccess name(String name);

  OrgAccess roles(List<RoleGrant> roles);

  OrgAccess permissions(List<PermissionGrant> permissions);

  OrgAccess sites(List<MeSite> sites);

  OrgAccess personId(String? personId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrgAccess(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrgAccess(...).copyWith(id: 12, name: "My name")
  /// ````
  OrgAccess call({
    String defaultLocale,
    String id,
    String slug,
    String name,
    List<RoleGrant> roles,
    List<PermissionGrant> permissions,
    List<MeSite> sites,
    String? personId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOrgAccess.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOrgAccess.copyWith.fieldName(...)`
class _$OrgAccessCWProxyImpl implements _$OrgAccessCWProxy {
  const _$OrgAccessCWProxyImpl(this._value);

  final OrgAccess _value;

  @override
  OrgAccess defaultLocale(String defaultLocale) =>
      this(defaultLocale: defaultLocale);

  @override
  OrgAccess id(String id) => this(id: id);

  @override
  OrgAccess slug(String slug) => this(slug: slug);

  @override
  OrgAccess name(String name) => this(name: name);

  @override
  OrgAccess roles(List<RoleGrant> roles) => this(roles: roles);

  @override
  OrgAccess permissions(List<PermissionGrant> permissions) =>
      this(permissions: permissions);

  @override
  OrgAccess sites(List<MeSite> sites) => this(sites: sites);

  @override
  OrgAccess personId(String? personId) => this(personId: personId);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrgAccess(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrgAccess(...).copyWith(id: 12, name: "My name")
  /// ````
  OrgAccess call({
    Object? defaultLocale = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? slug = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? roles = const $CopyWithPlaceholder(),
    Object? permissions = const $CopyWithPlaceholder(),
    Object? sites = const $CopyWithPlaceholder(),
    Object? personId = const $CopyWithPlaceholder(),
  }) {
    return OrgAccess(
      defaultLocale: defaultLocale == const $CopyWithPlaceholder()
          ? _value.defaultLocale
          // ignore: cast_nullable_to_non_nullable
          : defaultLocale as String,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      slug: slug == const $CopyWithPlaceholder()
          ? _value.slug
          // ignore: cast_nullable_to_non_nullable
          : slug as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      roles: roles == const $CopyWithPlaceholder()
          ? _value.roles
          // ignore: cast_nullable_to_non_nullable
          : roles as List<RoleGrant>,
      permissions: permissions == const $CopyWithPlaceholder()
          ? _value.permissions
          // ignore: cast_nullable_to_non_nullable
          : permissions as List<PermissionGrant>,
      sites: sites == const $CopyWithPlaceholder()
          ? _value.sites
          // ignore: cast_nullable_to_non_nullable
          : sites as List<MeSite>,
      personId: personId == const $CopyWithPlaceholder()
          ? _value.personId
          // ignore: cast_nullable_to_non_nullable
          : personId as String?,
    );
  }
}

extension $OrgAccessCopyWith on OrgAccess {
  /// Returns a callable class that can be used as follows: `instanceOfOrgAccess.copyWith(...)` or like so:`instanceOfOrgAccess.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OrgAccessCWProxy get copyWith => _$OrgAccessCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrgAccess _$OrgAccessFromJson(Map<String, dynamic> json) => $checkedCreate(
  'OrgAccess',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'default_locale',
        'id',
        'slug',
        'name',
        'roles',
        'permissions',
        'sites',
        'person_id',
      ],
    );
    final val = OrgAccess(
      defaultLocale: $checkedConvert('default_locale', (v) => v as String),
      id: $checkedConvert('id', (v) => v as String),
      slug: $checkedConvert('slug', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      roles: $checkedConvert(
        'roles',
        (v) => (v as List<dynamic>)
            .map((e) => RoleGrant.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      permissions: $checkedConvert(
        'permissions',
        (v) => (v as List<dynamic>)
            .map((e) => PermissionGrant.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      sites: $checkedConvert(
        'sites',
        (v) => (v as List<dynamic>)
            .map((e) => MeSite.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      personId: $checkedConvert('person_id', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'defaultLocale': 'default_locale',
    'personId': 'person_id',
  },
);

Map<String, dynamic> _$OrgAccessToJson(OrgAccess instance) => <String, dynamic>{
  'default_locale': instance.defaultLocale,
  'id': instance.id,
  'slug': instance.slug,
  'name': instance.name,
  'roles': instance.roles.map((e) => e.toJson()).toList(),
  'permissions': instance.permissions.map((e) => e.toJson()).toList(),
  'sites': instance.sites.map((e) => e.toJson()).toList(),
  'person_id': instance.personId,
};
