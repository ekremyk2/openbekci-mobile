//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_method.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AuthMethod {
  /// Returns a new [AuthMethod] instance.
  AuthMethod({

    required  this.id,

     this.labelKey,

     this.icon,
  });

      /// Open string. Known: `password`, `sms_otp`, `magic_link`, `oidc:<provider>`. 
  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'label_key',
    required: false,
    includeIfNull: false,
  )


  final String? labelKey;



  @JsonKey(
    
    name: r'icon',
    required: false,
    includeIfNull: false,
  )


  final String? icon;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AuthMethod &&
      other.id == id &&
      other.labelKey == labelKey &&
      other.icon == icon;

    @override
    int get hashCode =>
        id.hashCode +
        labelKey.hashCode +
        icon.hashCode;

  factory AuthMethod.fromJson(Map<String, dynamic> json) => _$AuthMethodFromJson(json);

  Map<String, dynamic> toJson() => _$AuthMethodToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

