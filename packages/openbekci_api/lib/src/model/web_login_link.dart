//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'web_login_link.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WebLoginLink {
  /// Returns a new [WebLoginLink] instance.
  WebLoginLink({

    required  this.token,

    required  this.url,

    required  this.expiresAt,
  });

  @JsonKey(
    
    name: r'token',
    required: true,
    includeIfNull: false,
  )


  final String token;



      /// `{BASE_URL}/login/link/{token}`, with `?next=` when `next` was given.
  @JsonKey(
    
    name: r'url',
    required: true,
    includeIfNull: false,
  )


  final String url;



  @JsonKey(
    
    name: r'expires_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiresAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WebLoginLink &&
      other.token == token &&
      other.url == url &&
      other.expiresAt == expiresAt;

    @override
    int get hashCode =>
        token.hashCode +
        url.hashCode +
        expiresAt.hashCode;

  factory WebLoginLink.fromJson(Map<String, dynamic> json) => _$WebLoginLinkFromJson(json);

  Map<String, dynamic> toJson() => _$WebLoginLinkToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

