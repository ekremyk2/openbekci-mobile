//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recurring_visitor.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RecurringVisitor {
  /// Returns a new [RecurringVisitor] instance.
  RecurringVisitor({

    required  this.id,

    required  this.orgId,

    required  this.siteId,

    required  this.unitId,

    required  this.name,

    required  this.plate,

    required  this.days,

    required  this.start,

    required  this.end,

    required  this.validFrom,

    required  this.validTo,

    required  this.status,

    required  this.qrToken,

    required  this.createdAt,

    required  this.updatedAt,

    required  this.version,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'org_id',
    required: true,
    includeIfNull: false,
  )


  final String orgId;



  @JsonKey(
    
    name: r'site_id',
    required: true,
    includeIfNull: false,
  )


  final String siteId;



  @JsonKey(
    
    name: r'unit_id',
    required: true,
    includeIfNull: false,
  )


  final String unitId;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'plate',
    required: true,
    includeIfNull: true,
  )


  final String? plate;



      /// ISO weekdays.
  @JsonKey(
    
    name: r'days',
    required: true,
    includeIfNull: false,
  )


  final List<int> days;



  @JsonKey(
    
    name: r'start',
    required: true,
    includeIfNull: false,
  )


  final String start;



  @JsonKey(
    
    name: r'end',
    required: true,
    includeIfNull: false,
  )


  final String end;



  @JsonKey(
    
    name: r'valid_from',
    required: true,
    includeIfNull: false,
  )


  final DateTime validFrom;



  @JsonKey(
    
    name: r'valid_to',
    required: true,
    includeIfNull: true,
  )


  final DateTime? validTo;



      /// Open enum.
  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  unknownEnumValue: RecurringVisitorStatusEnum.unknownDefaultOpenApi,
  )


  final RecurringVisitorStatusEnum status;



      /// The QR token, always including the `obk1.` prefix (the value is `obk1.<token>`, exactly what the QR encodes and what `community.scanGateVisitor` takes). Returned only to the unit's current occupants (owner, tenant, household), never to managers, board members, auditors or guards (`null` for them); a manager issues a new one to the occupants with the `rotate-qr` operation. It is also served by the `.../qr` operations.
  @JsonKey(
    
    name: r'qr_token',
    required: true,
    includeIfNull: true,
  )


  final String? qrToken;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'updated_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime updatedAt;



      /// Optimistic-lock counter; send it back as If-Match on updates.
  @JsonKey(
    
    name: r'version',
    required: true,
    includeIfNull: false,
  )


  final int version;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RecurringVisitor &&
      other.id == id &&
      other.orgId == orgId &&
      other.siteId == siteId &&
      other.unitId == unitId &&
      other.name == name &&
      other.plate == plate &&
      other.days == days &&
      other.start == start &&
      other.end == end &&
      other.validFrom == validFrom &&
      other.validTo == validTo &&
      other.status == status &&
      other.qrToken == qrToken &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.version == version;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        siteId.hashCode +
        unitId.hashCode +
        name.hashCode +
        (plate == null ? 0 : plate.hashCode) +
        days.hashCode +
        start.hashCode +
        end.hashCode +
        validFrom.hashCode +
        (validTo == null ? 0 : validTo.hashCode) +
        status.hashCode +
        (qrToken == null ? 0 : qrToken.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode +
        version.hashCode;

  factory RecurringVisitor.fromJson(Map<String, dynamic> json) => _$RecurringVisitorFromJson(json);

  Map<String, dynamic> toJson() => _$RecurringVisitorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum RecurringVisitorStatusEnum {
@JsonValue(r'active')
active(r'active'),
@JsonValue(r'revoked')
revoked(r'revoked'),
@JsonValue(r'expired')
expired(r'expired'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const RecurringVisitorStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


