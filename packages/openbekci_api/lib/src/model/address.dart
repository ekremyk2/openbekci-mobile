//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Address {
  /// Returns a new [Address] instance.
  Address({

    required  this.line1,

    required  this.line2,

    required  this.district,

    required  this.city,

    required  this.postalCode,

    required  this.countryCode,
  });

  @JsonKey(
    
    name: r'line1',
    required: true,
    includeIfNull: false,
  )


  final String line1;



  @JsonKey(
    
    name: r'line2',
    required: true,
    includeIfNull: true,
  )


  final String? line2;



  @JsonKey(
    
    name: r'district',
    required: true,
    includeIfNull: true,
  )


  final String? district;



  @JsonKey(
    
    name: r'city',
    required: true,
    includeIfNull: true,
  )


  final String? city;



  @JsonKey(
    
    name: r'postal_code',
    required: true,
    includeIfNull: true,
  )


  final String? postalCode;



      /// ISO 3166-1 alpha-2
  @JsonKey(
    
    name: r'country_code',
    required: true,
    includeIfNull: false,
  )


  final String countryCode;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Address &&
      other.line1 == line1 &&
      other.line2 == line2 &&
      other.district == district &&
      other.city == city &&
      other.postalCode == postalCode &&
      other.countryCode == countryCode;

    @override
    int get hashCode =>
        line1.hashCode +
        (line2 == null ? 0 : line2.hashCode) +
        (district == null ? 0 : district.hashCode) +
        (city == null ? 0 : city.hashCode) +
        (postalCode == null ? 0 : postalCode.hashCode) +
        countryCode.hashCode;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

