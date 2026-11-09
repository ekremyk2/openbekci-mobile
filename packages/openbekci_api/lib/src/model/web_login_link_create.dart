//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'web_login_link_create.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WebLoginLinkCreate {
  /// Returns a new [WebLoginLinkCreate] instance.
  WebLoginLinkCreate({

     this.next,
  });

      /// An in-app path under `/orgs/{org_id}/...` the web app opens after signing in; any other value (another host, a scheme, a path outside `/orgs/`) is 422.
  @JsonKey(
    
    name: r'next',
    required: false,
    includeIfNull: false,
  )


  final String? next;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WebLoginLinkCreate &&
      other.next == next;

    @override
    int get hashCode =>
        next.hashCode;

  factory WebLoginLinkCreate.fromJson(Map<String, dynamic> json) => _$WebLoginLinkCreateFromJson(json);

  Map<String, dynamic> toJson() => _$WebLoginLinkCreateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

