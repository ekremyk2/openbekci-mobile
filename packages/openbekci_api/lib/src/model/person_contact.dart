//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/address.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person_contact.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PersonContact {
  /// Returns a new [PersonContact] instance.
  PersonContact({

     this.email,

     this.phone,

     this.preferredChannel,

     this.address,
  });

  @JsonKey(
    
    name: r'email',
    required: false,
    includeIfNull: false,
  )


  final String? email;



      /// E.164.
  @JsonKey(
    
    name: r'phone',
    required: false,
    includeIfNull: false,
  )


  final String? phone;



      /// Open enum.
  @JsonKey(
    
    name: r'preferred_channel',
    required: false,
    includeIfNull: false,
  unknownEnumValue: PersonContactPreferredChannelEnum.unknownDefaultOpenApi,
  )


  final PersonContactPreferredChannelEnum? preferredChannel;



  @JsonKey(
    
    name: r'address',
    required: false,
    includeIfNull: false,
  )


  final Address? address;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PersonContact &&
      other.email == email &&
      other.phone == phone &&
      other.preferredChannel == preferredChannel &&
      other.address == address;

    @override
    int get hashCode =>
        (email == null ? 0 : email.hashCode) +
        (phone == null ? 0 : phone.hashCode) +
        (preferredChannel == null ? 0 : preferredChannel.hashCode) +
        (address == null ? 0 : address.hashCode);

  factory PersonContact.fromJson(Map<String, dynamic> json) => _$PersonContactFromJson(json);

  Map<String, dynamic> toJson() => _$PersonContactToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum PersonContactPreferredChannelEnum {
@JsonValue(r'sms')
sms(r'sms'),
@JsonValue(r'email')
email(r'email'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const PersonContactPreferredChannelEnum(this.value);

final String value;

@override
String toString() => value;
}


