//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openbekci_api/src/model/join_block.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'join_info.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class JoinInfo {
  /// Returns a new [JoinInfo] instance.
  JoinInfo({

    required  this.siteName,

    required  this.orgName,

    required  this.blocks,
  });

  @JsonKey(
    
    name: r'site_name',
    required: true,
    includeIfNull: false,
  )


  final String siteName;



  @JsonKey(
    
    name: r'org_name',
    required: true,
    includeIfNull: false,
  )


  final String orgName;



  @JsonKey(
    
    name: r'blocks',
    required: true,
    includeIfNull: false,
  )


  final List<JoinBlock> blocks;





    @override
    bool operator ==(Object other) => identical(this, other) || other is JoinInfo &&
      other.siteName == siteName &&
      other.orgName == orgName &&
      other.blocks == blocks;

    @override
    int get hashCode =>
        siteName.hashCode +
        orgName.hashCode +
        blocks.hashCode;

  factory JoinInfo.fromJson(Map<String, dynamic> json) => _$JoinInfoFromJson(json);

  Map<String, dynamic> toJson() => _$JoinInfoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

