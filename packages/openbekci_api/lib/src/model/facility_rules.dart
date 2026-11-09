//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/money.dart';
import 'package:openbekci_api/src/model/opening_hours.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'facility_rules.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FacilityRules {
  /// Returns a new [FacilityRules] instance.
  FacilityRules({

    required  this.openingHours,

    required  this.maxDurationMinutes,

    required  this.maxDaysAhead,

    required  this.minNoticeMinutes,

    required  this.quotaPerUnit,

    required  this.quotaPeriod,

    required  this.whoMayBook,

    required  this.fee,

    required  this.cancelRefundCutoffHours,
  });

      /// Site timezone.
  @JsonKey(
    
    name: r'opening_hours',
    required: true,
    includeIfNull: false,
  )


  final List<OpeningHours> openingHours;



  @JsonKey(
    
    name: r'max_duration_minutes',
    required: true,
    includeIfNull: false,
  )


  final int maxDurationMinutes;



      /// How far ahead a booking may be made.
  @JsonKey(
    
    name: r'max_days_ahead',
    required: true,
    includeIfNull: false,
  )


  final int maxDaysAhead;



  @JsonKey(
    
    name: r'min_notice_minutes',
    required: true,
    includeIfNull: true,
  )


  final int? minNoticeMinutes;



  @JsonKey(
    
    name: r'quota_per_unit',
    required: true,
    includeIfNull: true,
  )


  final int? quotaPerUnit;



      /// Open enum.
  @JsonKey(
    
    name: r'quota_period',
    required: true,
    includeIfNull: true,
  unknownEnumValue: FacilityRulesQuotaPeriodEnum.unknownDefaultOpenApi,
  )


  final FacilityRulesQuotaPeriodEnum? quotaPeriod;



  @JsonKey(
    
    name: r'who_may_book',
    required: true,
    includeIfNull: false,
  unknownEnumValue: FacilityRulesWhoMayBookEnum.unknownDefaultOpenApi,
  )


  final List<FacilityRulesWhoMayBookEnum> whoMayBook;



      /// Becomes a charge on the unit side when the booking is confirmed (default: the side of whoever booked).
  @JsonKey(
    
    name: r'fee',
    required: true,
    includeIfNull: true,
  )


  final Money? fee;



      /// A fee is refunded automatically when cancelled earlier than this.
  @JsonKey(
    
    name: r'cancel_refund_cutoff_hours',
    required: true,
    includeIfNull: true,
  )


  final int? cancelRefundCutoffHours;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FacilityRules &&
      other.openingHours == openingHours &&
      other.maxDurationMinutes == maxDurationMinutes &&
      other.maxDaysAhead == maxDaysAhead &&
      other.minNoticeMinutes == minNoticeMinutes &&
      other.quotaPerUnit == quotaPerUnit &&
      other.quotaPeriod == quotaPeriod &&
      other.whoMayBook == whoMayBook &&
      other.fee == fee &&
      other.cancelRefundCutoffHours == cancelRefundCutoffHours;

    @override
    int get hashCode =>
        openingHours.hashCode +
        maxDurationMinutes.hashCode +
        maxDaysAhead.hashCode +
        (minNoticeMinutes == null ? 0 : minNoticeMinutes.hashCode) +
        (quotaPerUnit == null ? 0 : quotaPerUnit.hashCode) +
        (quotaPeriod == null ? 0 : quotaPeriod.hashCode) +
        whoMayBook.hashCode +
        (fee == null ? 0 : fee.hashCode) +
        (cancelRefundCutoffHours == null ? 0 : cancelRefundCutoffHours.hashCode);

  factory FacilityRules.fromJson(Map<String, dynamic> json) => _$FacilityRulesFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityRulesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum FacilityRulesQuotaPeriodEnum {
@JsonValue(r'week')
week(r'week'),
@JsonValue(r'month')
month(r'month'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const FacilityRulesQuotaPeriodEnum(this.value);

final String value;

@override
String toString() => value;
}


enum FacilityRulesWhoMayBookEnum {
@JsonValue(r'owner')
owner(r'owner'),
@JsonValue(r'tenant')
tenant(r'tenant'),
@JsonValue(r'household')
household(r'household'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const FacilityRulesWhoMayBookEnum(this.value);

final String value;

@override
String toString() => value;
}


