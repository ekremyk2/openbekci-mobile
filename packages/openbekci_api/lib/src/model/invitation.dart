//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invitation.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Invitation {
  /// Returns a new [Invitation] instance.
  Invitation({

    required  this.id,

    required  this.orgId,

    required  this.kind,

    required  this.siteId,

    required  this.personId,

    required  this.unitId,

    required  this.channel,

    required  this.destination,

    required  this.status,

    required  this.expiresAt,

    required  this.acceptedAt,

    required  this.invitedBy,

    required  this.createdAt,

    required  this.updatedAt,
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



      /// Open enum.
  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  unknownEnumValue: InvitationKindEnum.unknownDefaultOpenApi,
  )


  final InvitationKindEnum kind;



  @JsonKey(
    
    name: r'site_id',
    required: true,
    includeIfNull: false,
  )


  final String siteId;



  @JsonKey(
    
    name: r'person_id',
    required: true,
    includeIfNull: true,
  )


  final String? personId;



  @JsonKey(
    
    name: r'unit_id',
    required: true,
    includeIfNull: true,
  )


  final String? unitId;



      /// Open enum.
  @JsonKey(
    
    name: r'channel',
    required: true,
    includeIfNull: false,
  unknownEnumValue: InvitationChannelEnum.unknownDefaultOpenApi,
  )


  final InvitationChannelEnum channel;



      /// Masked phone or email.
  @JsonKey(
    
    name: r'destination',
    required: true,
    includeIfNull: false,
  )


  final String destination;



      /// Open enum.
  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  unknownEnumValue: InvitationStatusEnum.unknownDefaultOpenApi,
  )


  final InvitationStatusEnum status;



  @JsonKey(
    
    name: r'expires_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiresAt;



  @JsonKey(
    
    name: r'accepted_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? acceptedAt;



  @JsonKey(
    
    name: r'invited_by',
    required: true,
    includeIfNull: true,
  )


  final String? invitedBy;



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





    @override
    bool operator ==(Object other) => identical(this, other) || other is Invitation &&
      other.id == id &&
      other.orgId == orgId &&
      other.kind == kind &&
      other.siteId == siteId &&
      other.personId == personId &&
      other.unitId == unitId &&
      other.channel == channel &&
      other.destination == destination &&
      other.status == status &&
      other.expiresAt == expiresAt &&
      other.acceptedAt == acceptedAt &&
      other.invitedBy == invitedBy &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        kind.hashCode +
        siteId.hashCode +
        (personId == null ? 0 : personId.hashCode) +
        (unitId == null ? 0 : unitId.hashCode) +
        channel.hashCode +
        destination.hashCode +
        status.hashCode +
        expiresAt.hashCode +
        (acceptedAt == null ? 0 : acceptedAt.hashCode) +
        (invitedBy == null ? 0 : invitedBy.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode;

  factory Invitation.fromJson(Map<String, dynamic> json) => _$InvitationFromJson(json);

  Map<String, dynamic> toJson() => _$InvitationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum InvitationKindEnum {
@JsonValue(r'manager')
manager(r'manager'),
@JsonValue(r'site_code')
siteCode(r'site_code'),
@JsonValue(r'household')
household(r'household'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const InvitationKindEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Open enum.
enum InvitationChannelEnum {
@JsonValue(r'sms')
sms(r'sms'),
@JsonValue(r'email')
email(r'email'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const InvitationChannelEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Open enum.
enum InvitationStatusEnum {
@JsonValue(r'pending')
pending(r'pending'),
@JsonValue(r'accepted')
accepted(r'accepted'),
@JsonValue(r'expired')
expired(r'expired'),
@JsonValue(r'revoked')
revoked(r'revoked'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const InvitationStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


