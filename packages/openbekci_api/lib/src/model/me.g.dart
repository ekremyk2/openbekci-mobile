// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MeCWProxy {
  Me user(MeUser user);

  Me organizations(List<OrgAccess> organizations);

  Me occupancies(List<MeOccupancy> occupancies);

  Me policies(MePolicies policies);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Me(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Me(...).copyWith(id: 12, name: "My name")
  /// ````
  Me call({
    MeUser user,
    List<OrgAccess> organizations,
    List<MeOccupancy> occupancies,
    MePolicies policies,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMe.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMe.copyWith.fieldName(...)`
class _$MeCWProxyImpl implements _$MeCWProxy {
  const _$MeCWProxyImpl(this._value);

  final Me _value;

  @override
  Me user(MeUser user) => this(user: user);

  @override
  Me organizations(List<OrgAccess> organizations) =>
      this(organizations: organizations);

  @override
  Me occupancies(List<MeOccupancy> occupancies) =>
      this(occupancies: occupancies);

  @override
  Me policies(MePolicies policies) => this(policies: policies);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Me(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Me(...).copyWith(id: 12, name: "My name")
  /// ````
  Me call({
    Object? user = const $CopyWithPlaceholder(),
    Object? organizations = const $CopyWithPlaceholder(),
    Object? occupancies = const $CopyWithPlaceholder(),
    Object? policies = const $CopyWithPlaceholder(),
  }) {
    return Me(
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as MeUser,
      organizations: organizations == const $CopyWithPlaceholder()
          ? _value.organizations
          // ignore: cast_nullable_to_non_nullable
          : organizations as List<OrgAccess>,
      occupancies: occupancies == const $CopyWithPlaceholder()
          ? _value.occupancies
          // ignore: cast_nullable_to_non_nullable
          : occupancies as List<MeOccupancy>,
      policies: policies == const $CopyWithPlaceholder()
          ? _value.policies
          // ignore: cast_nullable_to_non_nullable
          : policies as MePolicies,
    );
  }
}

extension $MeCopyWith on Me {
  /// Returns a callable class that can be used as follows: `instanceOfMe.copyWith(...)` or like so:`instanceOfMe.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MeCWProxy get copyWith => _$MeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Me _$MeFromJson(Map<String, dynamic> json) => $checkedCreate('Me', json, (
  $checkedConvert,
) {
  $checkKeys(
    json,
    requiredKeys: const ['user', 'organizations', 'occupancies', 'policies'],
  );
  final val = Me(
    user: $checkedConvert(
      'user',
      (v) => MeUser.fromJson(v as Map<String, dynamic>),
    ),
    organizations: $checkedConvert(
      'organizations',
      (v) => (v as List<dynamic>)
          .map((e) => OrgAccess.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    occupancies: $checkedConvert(
      'occupancies',
      (v) => (v as List<dynamic>)
          .map((e) => MeOccupancy.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    policies: $checkedConvert(
      'policies',
      (v) => MePolicies.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$MeToJson(Me instance) => <String, dynamic>{
  'user': instance.user.toJson(),
  'organizations': instance.organizations.map((e) => e.toJson()).toList(),
  'occupancies': instance.occupancies.map((e) => e.toJson()).toList(),
  'policies': instance.policies.toJson(),
};
