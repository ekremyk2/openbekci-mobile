//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'site_settings_payments_card.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SiteSettingsPaymentsCard {
  /// Returns a new [SiteSettingsPaymentsCard] instance.
  SiteSettingsPaymentsCard({

    required  this.available,

    required  this.provider,
  });

      /// A payment provider of an enabled pack is available for the site.
  @JsonKey(
    
    name: r'available',
    required: true,
    includeIfNull: false,
  )


  final bool available;



      /// Id of the provider checkout would use.
  @JsonKey(
    
    name: r'provider',
    required: true,
    includeIfNull: true,
  )


  final String? provider;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SiteSettingsPaymentsCard &&
      other.available == available &&
      other.provider == provider;

    @override
    int get hashCode =>
        available.hashCode +
        (provider == null ? 0 : provider.hashCode);

  factory SiteSettingsPaymentsCard.fromJson(Map<String, dynamic> json) => _$SiteSettingsPaymentsCardFromJson(json);

  Map<String, dynamic> toJson() => _$SiteSettingsPaymentsCardToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

