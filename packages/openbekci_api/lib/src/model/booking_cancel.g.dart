// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_cancel.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BookingCancelCWProxy {
  BookingCancel reason(String? reason);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BookingCancel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BookingCancel(...).copyWith(id: 12, name: "My name")
  /// ````
  BookingCancel call({String? reason});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBookingCancel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBookingCancel.copyWith.fieldName(...)`
class _$BookingCancelCWProxyImpl implements _$BookingCancelCWProxy {
  const _$BookingCancelCWProxyImpl(this._value);

  final BookingCancel _value;

  @override
  BookingCancel reason(String? reason) => this(reason: reason);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BookingCancel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BookingCancel(...).copyWith(id: 12, name: "My name")
  /// ````
  BookingCancel call({Object? reason = const $CopyWithPlaceholder()}) {
    return BookingCancel(
      reason: reason == const $CopyWithPlaceholder()
          ? _value.reason
          // ignore: cast_nullable_to_non_nullable
          : reason as String?,
    );
  }
}

extension $BookingCancelCopyWith on BookingCancel {
  /// Returns a callable class that can be used as follows: `instanceOfBookingCancel.copyWith(...)` or like so:`instanceOfBookingCancel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BookingCancelCWProxy get copyWith => _$BookingCancelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingCancel _$BookingCancelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('BookingCancel', json, ($checkedConvert) {
      final val = BookingCancel(
        reason: $checkedConvert('reason', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$BookingCancelToJson(BookingCancel instance) =>
    <String, dynamic>{'reason': ?instance.reason};
