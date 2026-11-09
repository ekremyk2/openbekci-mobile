//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bank_details.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BankDetails {
  /// Returns a new [BankDetails] instance.
  BankDetails({

    required  this.version,

    required  this.iban,

    required  this.holder,

    required  this.bankName,

    required  this.referenceHint,

    required  this.suggestedReference,
  });

      /// The site `version`; send it back as `If-Match` on the next update (the settings and the bank details are written with the site).
  @JsonKey(
    
    name: r'version',
    required: true,
    includeIfNull: false,
  )


  final int version;



  @JsonKey(
    
    name: r'iban',
    required: true,
    includeIfNull: false,
  )


  final String iban;



  @JsonKey(
    
    name: r'holder',
    required: true,
    includeIfNull: false,
  )


  final String holder;



  @JsonKey(
    
    name: r'bank_name',
    required: true,
    includeIfNull: true,
  )


  final String? bankName;



      /// Text payers should put in the transfer description.
  @JsonKey(
    
    name: r'reference_hint',
    required: true,
    includeIfNull: true,
  )


  final String? referenceHint;



      /// Only when `unit_id` and `debtor_kind` were given: the reference for that unit side.
  @JsonKey(
    
    name: r'suggested_reference',
    required: true,
    includeIfNull: true,
  )


  final String? suggestedReference;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BankDetails &&
      other.version == version &&
      other.iban == iban &&
      other.holder == holder &&
      other.bankName == bankName &&
      other.referenceHint == referenceHint &&
      other.suggestedReference == suggestedReference;

    @override
    int get hashCode =>
        version.hashCode +
        iban.hashCode +
        holder.hashCode +
        (bankName == null ? 0 : bankName.hashCode) +
        (referenceHint == null ? 0 : referenceHint.hashCode) +
        (suggestedReference == null ? 0 : suggestedReference.hashCode);

  factory BankDetails.fromJson(Map<String, dynamic> json) => _$BankDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$BankDetailsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

