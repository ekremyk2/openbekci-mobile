//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'magic_link_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MagicLinkRequest {
  /// Returns a new [MagicLinkRequest] instance.
  MagicLinkRequest({

    required  this.email,

     this.client = MagicLinkRequestClientEnum.web,
  });

  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: false,
  )


  final String email;



      /// `mobile` makes the link use the `openbekci://` scheme instead of the web URL.
  @JsonKey(
    name: r'client',
    required: false,
    includeIfNull: false,
  unknownEnumValue: MagicLinkRequestClientEnum.unknownDefaultOpenApi,
  )


  final MagicLinkRequestClientEnum? client;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MagicLinkRequest &&
      other.email == email &&
      other.client == client;

    @override
    int get hashCode =>
        email.hashCode +
        client.hashCode;

  factory MagicLinkRequest.fromJson(Map<String, dynamic> json) => _$MagicLinkRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MagicLinkRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// `mobile` makes the link use the `openbekci://` scheme instead of the web URL.
enum MagicLinkRequestClientEnum {
@JsonValue(r'web')
web(r'web'),
@JsonValue(r'mobile')
mobile(r'mobile'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const MagicLinkRequestClientEnum(this.value);

final String value;

@override
String toString() => value;
}


