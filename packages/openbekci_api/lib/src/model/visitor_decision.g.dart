// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_decision.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VisitorDecisionCWProxy {
  VisitorDecision decision(VisitorDecisionDecisionEnum decision);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VisitorDecision(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VisitorDecision(...).copyWith(id: 12, name: "My name")
  /// ````
  VisitorDecision call({VisitorDecisionDecisionEnum decision});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVisitorDecision.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVisitorDecision.copyWith.fieldName(...)`
class _$VisitorDecisionCWProxyImpl implements _$VisitorDecisionCWProxy {
  const _$VisitorDecisionCWProxyImpl(this._value);

  final VisitorDecision _value;

  @override
  VisitorDecision decision(VisitorDecisionDecisionEnum decision) =>
      this(decision: decision);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VisitorDecision(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VisitorDecision(...).copyWith(id: 12, name: "My name")
  /// ````
  VisitorDecision call({Object? decision = const $CopyWithPlaceholder()}) {
    return VisitorDecision(
      decision: decision == const $CopyWithPlaceholder()
          ? _value.decision
          // ignore: cast_nullable_to_non_nullable
          : decision as VisitorDecisionDecisionEnum,
    );
  }
}

extension $VisitorDecisionCopyWith on VisitorDecision {
  /// Returns a callable class that can be used as follows: `instanceOfVisitorDecision.copyWith(...)` or like so:`instanceOfVisitorDecision.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VisitorDecisionCWProxy get copyWith => _$VisitorDecisionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitorDecision _$VisitorDecisionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('VisitorDecision', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['decision']);
      final val = VisitorDecision(
        decision: $checkedConvert(
          'decision',
          (v) => $enumDecode(
            _$VisitorDecisionDecisionEnumEnumMap,
            v,
            unknownValue: VisitorDecisionDecisionEnum.unknownDefaultOpenApi,
          ),
        ),
      );
      return val;
    });

Map<String, dynamic> _$VisitorDecisionToJson(VisitorDecision instance) =>
    <String, dynamic>{
      'decision': _$VisitorDecisionDecisionEnumEnumMap[instance.decision]!,
    };

const _$VisitorDecisionDecisionEnumEnumMap = {
  VisitorDecisionDecisionEnum.approve: 'approve',
  VisitorDecisionDecisionEnum.deny: 'deny',
  VisitorDecisionDecisionEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
