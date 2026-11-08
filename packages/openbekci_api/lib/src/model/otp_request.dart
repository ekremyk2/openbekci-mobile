//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OtpRequest {
  /// Returns a new [OtpRequest] instance.
  OtpRequest({

    required  this.phone,
  });

      /// E.164 or national format.
  @JsonKey(
    
    name: r'phone',
    required: true,
    includeIfNull: false,
  )


  final String phone;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OtpRequest &&
      other.phone == phone;

    @override
    int get hashCode =>
        phone.hashCode;

  factory OtpRequest.fromJson(Map<String, dynamic> json) => _$OtpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OtpRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

