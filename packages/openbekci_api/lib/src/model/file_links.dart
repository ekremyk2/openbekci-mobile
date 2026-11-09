//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file_links.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FileLinks {
  /// Returns a new [FileLinks] instance.
  FileLinks({

    required  this.original,

    required  this.variants,

    required  this.expiresAt,
  });

      /// URL of the original; null while the file is not ready.
  @JsonKey(
    
    name: r'original',
    required: true,
    includeIfNull: true,
  )


  final String? original;



      /// URLs of the image variants (`thumb`, `medium`) by name; empty for other files.
  @JsonKey(
    
    name: r'variants',
    required: true,
    includeIfNull: false,
  )


  final Map<String, String> variants;



  @JsonKey(
    
    name: r'expires_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiresAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FileLinks &&
      other.original == original &&
      other.variants == variants &&
      other.expiresAt == expiresAt;

    @override
    int get hashCode =>
        (original == null ? 0 : original.hashCode) +
        variants.hashCode +
        expiresAt.hashCode;

  factory FileLinks.fromJson(Map<String, dynamic> json) => _$FileLinksFromJson(json);

  Map<String, dynamic> toJson() => _$FileLinksToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

