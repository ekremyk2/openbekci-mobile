//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invitation_preview.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InvitationPreview {
  /// Returns a new [InvitationPreview] instance.
  InvitationPreview({

    required  this.kind,

    required  this.orgName,

    required  this.siteName,

    required  this.unitDoorNumber,

    required  this.personDisplayName,

    required  this.channel,

    required  this.expiresAt,

    required  this.existingAccount,
  });

      /// Open enum.
  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  unknownEnumValue: InvitationPreviewKindEnum.unknownDefaultOpenApi,
  )


  final InvitationPreviewKindEnum kind;



  @JsonKey(
    
    name: r'org_name',
    required: true,
    includeIfNull: false,
  )


  final String orgName;



  @JsonKey(
    
    name: r'site_name',
    required: true,
    includeIfNull: false,
  )


  final String siteName;



  @JsonKey(
    
    name: r'unit_door_number',
    required: true,
    includeIfNull: true,
  )


  final String? unitDoorNumber;



  @JsonKey(
    
    name: r'person_display_name',
    required: true,
    includeIfNull: true,
  )


  final String? personDisplayName;



      /// Open enum.
  @JsonKey(
    
    name: r'channel',
    required: true,
    includeIfNull: false,
  unknownEnumValue: InvitationPreviewChannelEnum.unknownDefaultOpenApi,
  )


  final InvitationPreviewChannelEnum channel;



  @JsonKey(
    
    name: r'expires_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiresAt;



      /// An account with the destination exists: accepting links it, no password needed.
  @JsonKey(
    
    name: r'existing_account',
    required: true,
    includeIfNull: false,
  )


  final bool existingAccount;





    @override
    bool operator ==(Object other) => identical(this, other) || other is InvitationPreview &&
      other.kind == kind &&
      other.orgName == orgName &&
      other.siteName == siteName &&
      other.unitDoorNumber == unitDoorNumber &&
      other.personDisplayName == personDisplayName &&
      other.channel == channel &&
      other.expiresAt == expiresAt &&
      other.existingAccount == existingAccount;

    @override
    int get hashCode =>
        kind.hashCode +
        orgName.hashCode +
        siteName.hashCode +
        (unitDoorNumber == null ? 0 : unitDoorNumber.hashCode) +
        (personDisplayName == null ? 0 : personDisplayName.hashCode) +
        channel.hashCode +
        expiresAt.hashCode +
        existingAccount.hashCode;

  factory InvitationPreview.fromJson(Map<String, dynamic> json) => _$InvitationPreviewFromJson(json);

  Map<String, dynamic> toJson() => _$InvitationPreviewToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum InvitationPreviewKindEnum {
@JsonValue(r'manager')
manager(r'manager'),
@JsonValue(r'site_code')
siteCode(r'site_code'),
@JsonValue(r'household')
household(r'household'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const InvitationPreviewKindEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Open enum.
enum InvitationPreviewChannelEnum {
@JsonValue(r'sms')
sms(r'sms'),
@JsonValue(r'email')
email(r'email'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const InvitationPreviewChannelEnum(this.value);

final String value;

@override
String toString() => value;
}


