//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'minutes_result.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MinutesResult {
  /// Returns a new [MinutesResult] instance.
  MinutesResult({

    required  this.meetingId,

    required  this.documentId,

    required  this.fileId,
  });

  @JsonKey(
    
    name: r'meeting_id',
    required: true,
    includeIfNull: false,
  )


  final String meetingId;



  @JsonKey(
    
    name: r'document_id',
    required: true,
    includeIfNull: false,
  )


  final String documentId;



  @JsonKey(
    
    name: r'file_id',
    required: true,
    includeIfNull: false,
  )


  final String fileId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MinutesResult &&
      other.meetingId == meetingId &&
      other.documentId == documentId &&
      other.fileId == fileId;

    @override
    int get hashCode =>
        meetingId.hashCode +
        documentId.hashCode +
        fileId.hashCode;

  factory MinutesResult.fromJson(Map<String, dynamic> json) => _$MinutesResultFromJson(json);

  Map<String, dynamic> toJson() => _$MinutesResultToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

