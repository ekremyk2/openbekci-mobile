//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'push_info.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PushInfo {
  /// Returns a new [PushInfo] instance.
  PushInfo({

    required  this.relayIds,

    required  this.unifiedPush,
  });

  @JsonKey(
    
    name: r'relay_ids',
    required: true,
    includeIfNull: false,
  )


  final List<String> relayIds;



  @JsonKey(
    
    name: r'unified_push',
    required: true,
    includeIfNull: false,
  )


  final bool unifiedPush;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PushInfo &&
      other.relayIds == relayIds &&
      other.unifiedPush == unifiedPush;

    @override
    int get hashCode =>
        relayIds.hashCode +
        unifiedPush.hashCode;

  factory PushInfo.fromJson(Map<String, dynamic> json) => _$PushInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PushInfoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

