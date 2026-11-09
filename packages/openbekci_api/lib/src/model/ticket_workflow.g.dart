// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_workflow.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketWorkflowCWProxy {
  TicketWorkflow siteId(String siteId);

  TicketWorkflow statuses(List<TicketStatus> statuses);

  TicketWorkflow isDefault(bool isDefault);

  TicketWorkflow version(int version);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketWorkflow(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketWorkflow(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketWorkflow call({
    String siteId,
    List<TicketStatus> statuses,
    bool isDefault,
    int version,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketWorkflow.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketWorkflow.copyWith.fieldName(...)`
class _$TicketWorkflowCWProxyImpl implements _$TicketWorkflowCWProxy {
  const _$TicketWorkflowCWProxyImpl(this._value);

  final TicketWorkflow _value;

  @override
  TicketWorkflow siteId(String siteId) => this(siteId: siteId);

  @override
  TicketWorkflow statuses(List<TicketStatus> statuses) =>
      this(statuses: statuses);

  @override
  TicketWorkflow isDefault(bool isDefault) => this(isDefault: isDefault);

  @override
  TicketWorkflow version(int version) => this(version: version);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketWorkflow(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketWorkflow(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketWorkflow call({
    Object? siteId = const $CopyWithPlaceholder(),
    Object? statuses = const $CopyWithPlaceholder(),
    Object? isDefault = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
  }) {
    return TicketWorkflow(
      siteId: siteId == const $CopyWithPlaceholder()
          ? _value.siteId
          // ignore: cast_nullable_to_non_nullable
          : siteId as String,
      statuses: statuses == const $CopyWithPlaceholder()
          ? _value.statuses
          // ignore: cast_nullable_to_non_nullable
          : statuses as List<TicketStatus>,
      isDefault: isDefault == const $CopyWithPlaceholder()
          ? _value.isDefault
          // ignore: cast_nullable_to_non_nullable
          : isDefault as bool,
      version: version == const $CopyWithPlaceholder()
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as int,
    );
  }
}

extension $TicketWorkflowCopyWith on TicketWorkflow {
  /// Returns a callable class that can be used as follows: `instanceOfTicketWorkflow.copyWith(...)` or like so:`instanceOfTicketWorkflow.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketWorkflowCWProxy get copyWith => _$TicketWorkflowCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketWorkflow _$TicketWorkflowFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TicketWorkflow',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['site_id', 'statuses', 'is_default', 'version'],
        );
        final val = TicketWorkflow(
          siteId: $checkedConvert('site_id', (v) => v as String),
          statuses: $checkedConvert(
            'statuses',
            (v) => (v as List<dynamic>)
                .map((e) => TicketStatus.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          isDefault: $checkedConvert('is_default', (v) => v as bool),
          version: $checkedConvert('version', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'siteId': 'site_id', 'isDefault': 'is_default'},
    );

Map<String, dynamic> _$TicketWorkflowToJson(TicketWorkflow instance) =>
    <String, dynamic>{
      'site_id': instance.siteId,
      'statuses': instance.statuses.map((e) => e.toJson()).toList(),
      'is_default': instance.isDefault,
      'version': instance.version,
    };
