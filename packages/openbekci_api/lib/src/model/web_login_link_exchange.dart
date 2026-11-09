//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'web_login_link_exchange.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WebLoginLinkExchange {
  /// Returns a new [WebLoginLinkExchange] instance.
  WebLoginLinkExchange({

    required  this.token,

     this.deviceName,
  });

  @JsonKey(
    
    name: r'token',
    required: true,
    includeIfNull: false,
  )


  final String token;



  @JsonKey(
    
    name: r'device_name',
    required: false,
    includeIfNull: false,
  )


  final String? deviceName;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WebLoginLinkExchange &&
      other.token == token &&
      other.deviceName == deviceName;

    @override
    int get hashCode =>
        token.hashCode +
        deviceName.hashCode;

  factory WebLoginLinkExchange.fromJson(Map<String, dynamic> json) => _$WebLoginLinkExchangeFromJson(json);

  Map<String, dynamic> toJson() => _$WebLoginLinkExchangeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

