//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/person_contact.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_person_update.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MyPersonUpdate {
  /// Returns a new [MyPersonUpdate] instance.
  MyPersonUpdate({

     this.displayName,

     this.contact,

     this.gateContactPhone,
  });

  @JsonKey(
    
    name: r'display_name',
    required: false,
    includeIfNull: false,
  )


  final String? displayName;



  @JsonKey(
    
    name: r'contact',
    required: false,
    includeIfNull: false,
  )


  final PersonContact? contact;



      /// E.164.
  @JsonKey(
    
    name: r'gate_contact_phone',
    required: false,
    includeIfNull: false,
  )


  final String? gateContactPhone;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MyPersonUpdate &&
      other.displayName == displayName &&
      other.contact == contact &&
      other.gateContactPhone == gateContactPhone;

    @override
    int get hashCode =>
        displayName.hashCode +
        contact.hashCode +
        (gateContactPhone == null ? 0 : gateContactPhone.hashCode);

  factory MyPersonUpdate.fromJson(Map<String, dynamic> json) => _$MyPersonUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$MyPersonUpdateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

