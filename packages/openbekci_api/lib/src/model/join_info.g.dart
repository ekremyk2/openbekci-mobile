// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_info.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$JoinInfoCWProxy {
  JoinInfo siteName(String siteName);

  JoinInfo orgName(String orgName);

  JoinInfo blocks(List<JoinBlock> blocks);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JoinInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JoinInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  JoinInfo call({String siteName, String orgName, List<JoinBlock> blocks});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfJoinInfo.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfJoinInfo.copyWith.fieldName(...)`
class _$JoinInfoCWProxyImpl implements _$JoinInfoCWProxy {
  const _$JoinInfoCWProxyImpl(this._value);

  final JoinInfo _value;

  @override
  JoinInfo siteName(String siteName) => this(siteName: siteName);

  @override
  JoinInfo orgName(String orgName) => this(orgName: orgName);

  @override
  JoinInfo blocks(List<JoinBlock> blocks) => this(blocks: blocks);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `JoinInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// JoinInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  JoinInfo call({
    Object? siteName = const $CopyWithPlaceholder(),
    Object? orgName = const $CopyWithPlaceholder(),
    Object? blocks = const $CopyWithPlaceholder(),
  }) {
    return JoinInfo(
      siteName: siteName == const $CopyWithPlaceholder()
          ? _value.siteName
          // ignore: cast_nullable_to_non_nullable
          : siteName as String,
      orgName: orgName == const $CopyWithPlaceholder()
          ? _value.orgName
          // ignore: cast_nullable_to_non_nullable
          : orgName as String,
      blocks: blocks == const $CopyWithPlaceholder()
          ? _value.blocks
          // ignore: cast_nullable_to_non_nullable
          : blocks as List<JoinBlock>,
    );
  }
}

extension $JoinInfoCopyWith on JoinInfo {
  /// Returns a callable class that can be used as follows: `instanceOfJoinInfo.copyWith(...)` or like so:`instanceOfJoinInfo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$JoinInfoCWProxy get copyWith => _$JoinInfoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinInfo _$JoinInfoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('JoinInfo', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['site_name', 'org_name', 'blocks']);
      final val = JoinInfo(
        siteName: $checkedConvert('site_name', (v) => v as String),
        orgName: $checkedConvert('org_name', (v) => v as String),
        blocks: $checkedConvert(
          'blocks',
          (v) => (v as List<dynamic>)
              .map((e) => JoinBlock.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'siteName': 'site_name', 'orgName': 'org_name'});

Map<String, dynamic> _$JoinInfoToJson(JoinInfo instance) => <String, dynamic>{
  'site_name': instance.siteName,
  'org_name': instance.orgName,
  'blocks': instance.blocks.map((e) => e.toJson()).toList(),
};
