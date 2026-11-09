//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/person_contact.dart';
import 'package:openbekci_api/src/model/directory_consent.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Person {
  /// Returns a new [Person] instance.
  Person({

    required  this.id,

    required  this.orgId,

    required  this.userId,

    required  this.displayName,

    required  this.contact,

    required  this.nationalIdMasked,

    required  this.nationalIdCountry,

    required  this.gateContactPhone,

    required  this.notes,

    required  this.joinStatus,

    required  this.directoryConsent,

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



      /// The linked sign-in account, once the person joined.
  @JsonKey(
    
    name: r'user_id',
    required: true,
    includeIfNull: true,
  )


  final String? userId;



  @JsonKey(
    
    name: r'display_name',
    required: true,
    includeIfNull: false,
  )


  final String displayName;



  @JsonKey(
    
    name: r'contact',
    required: true,
    includeIfNull: false,
  )


  final PersonContact contact;



      /// Only for callers with `people.national_id`; for example `*******1234`. Never returned in full and never in audit diffs.
  @JsonKey(
    
    name: r'national_id_masked',
    required: true,
    includeIfNull: true,
  )


  final String? nationalIdMasked;



  @JsonKey(
    
    name: r'national_id_country',
    required: true,
    includeIfNull: true,
  )


  final String? nationalIdCountry;



      /// E.164.
  @JsonKey(
    
    name: r'gate_contact_phone',
    required: true,
    includeIfNull: true,
  )


  final String? gateContactPhone;



  @JsonKey(
    
    name: r'notes',
    required: true,
    includeIfNull: true,
  )


  final String? notes;



      /// Open enum.
  @JsonKey(
    
    name: r'join_status',
    required: true,
    includeIfNull: false,
  unknownEnumValue: PersonJoinStatusEnum.unknownDefaultOpenApi,
  )


  final PersonJoinStatusEnum joinStatus;



  @JsonKey(
    
    name: r'directory_consent',
    required: true,
    includeIfNull: false,
  )


  final List<DirectoryConsent> directoryConsent;



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
    bool operator ==(Object other) => identical(this, other) || other is Person &&
      other.id == id &&
      other.orgId == orgId &&
      other.userId == userId &&
      other.displayName == displayName &&
      other.contact == contact &&
      other.nationalIdMasked == nationalIdMasked &&
      other.nationalIdCountry == nationalIdCountry &&
      other.gateContactPhone == gateContactPhone &&
      other.notes == notes &&
      other.joinStatus == joinStatus &&
      other.directoryConsent == directoryConsent &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.version == version;

    @override
    int get hashCode =>
        id.hashCode +
        orgId.hashCode +
        (userId == null ? 0 : userId.hashCode) +
        displayName.hashCode +
        contact.hashCode +
        (nationalIdMasked == null ? 0 : nationalIdMasked.hashCode) +
        (nationalIdCountry == null ? 0 : nationalIdCountry.hashCode) +
        (gateContactPhone == null ? 0 : gateContactPhone.hashCode) +
        (notes == null ? 0 : notes.hashCode) +
        joinStatus.hashCode +
        directoryConsent.hashCode +
        createdAt.hashCode +
        updatedAt.hashCode +
        version.hashCode;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum PersonJoinStatusEnum {
@JsonValue(r'no_account')
noAccount(r'no_account'),
@JsonValue(r'invited')
invited(r'invited'),
@JsonValue(r'joined')
joined(r'joined'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const PersonJoinStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


