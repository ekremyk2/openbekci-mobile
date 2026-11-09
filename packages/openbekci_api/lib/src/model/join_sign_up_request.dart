//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'join_sign_up_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class JoinSignUpRequest {
  /// Returns a new [JoinSignUpRequest] instance.
  JoinSignUpRequest({

     this.phone,

     this.email,

     this.name,

     this.locale = JoinSignUpRequestLocaleEnum.tr,

     this.client = JoinSignUpRequestClientEnum.web,
  });

      /// E.164 or national format. A six-digit code is sent by SMS.
  @JsonKey(
    
    name: r'phone',
    required: false,
    includeIfNull: false,
  )


  final String? phone;



      /// A sign-in link is sent by email.
  @JsonKey(
    
    name: r'email',
    required: false,
    includeIfNull: false,
  )


  final String? email;



      /// What the resident goes by; used for their person when they claim a unit.
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    name: r'locale',
    required: false,
    includeIfNull: false,
  unknownEnumValue: JoinSignUpRequestLocaleEnum.unknownDefaultOpenApi,
  )


  final JoinSignUpRequestLocaleEnum? locale;



      /// `mobile` makes an emailed link use the `openbekci://<host>/…` form.
  @JsonKey(
    name: r'client',
    required: false,
    includeIfNull: false,
  unknownEnumValue: JoinSignUpRequestClientEnum.unknownDefaultOpenApi,
  )


  final JoinSignUpRequestClientEnum? client;





    @override
    bool operator ==(Object other) => identical(this, other) || other is JoinSignUpRequest &&
      other.phone == phone &&
      other.email == email &&
      other.name == name &&
      other.locale == locale &&
      other.client == client;

    @override
    int get hashCode =>
        phone.hashCode +
        email.hashCode +
        name.hashCode +
        locale.hashCode +
        client.hashCode;

  factory JoinSignUpRequest.fromJson(Map<String, dynamic> json) => _$JoinSignUpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$JoinSignUpRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum JoinSignUpRequestLocaleEnum {
@JsonValue(r'tr')
tr(r'tr'),
@JsonValue(r'en')
en(r'en'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const JoinSignUpRequestLocaleEnum(this.value);

final String value;

@override
String toString() => value;
}


/// `mobile` makes an emailed link use the `openbekci://<host>/…` form.
enum JoinSignUpRequestClientEnum {
@JsonValue(r'web')
web(r'web'),
@JsonValue(r'mobile')
mobile(r'mobile'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const JoinSignUpRequestClientEnum(this.value);

final String value;

@override
String toString() => value;
}


