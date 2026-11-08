//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'me_site.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MeSite {
  /// Returns a new [MeSite] instance.
  MeSite({

    required  this.id,

    required  this.name,

    required  this.timezone,

    required  this.currency,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'timezone',
    required: true,
    includeIfNull: false,
  )


  final String timezone;



  @JsonKey(
    
    name: r'currency',
    required: true,
    includeIfNull: false,
  )


  final String currency;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MeSite &&
      other.id == id &&
      other.name == name &&
      other.timezone == timezone &&
      other.currency == currency;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        timezone.hashCode +
        currency.hashCode;

  factory MeSite.fromJson(Map<String, dynamic> json) => _$MeSiteFromJson(json);

  Map<String, dynamic> toJson() => _$MeSiteToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

