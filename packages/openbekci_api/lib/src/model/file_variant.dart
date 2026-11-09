//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file_variant.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FileVariant {
  /// Returns a new [FileVariant] instance.
  FileVariant({

    required  this.width,

    required  this.height,

    required  this.size,

    required  this.mime,
  });

  @JsonKey(
    
    name: r'width',
    required: true,
    includeIfNull: false,
  )


  final int width;



  @JsonKey(
    
    name: r'height',
    required: true,
    includeIfNull: false,
  )


  final int height;



      /// Bytes.
  @JsonKey(
    
    name: r'size',
    required: true,
    includeIfNull: false,
  )


  final int size;



  @JsonKey(
    
    name: r'mime',
    required: true,
    includeIfNull: false,
  )


  final String mime;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FileVariant &&
      other.width == width &&
      other.height == height &&
      other.size == size &&
      other.mime == mime;

    @override
    int get hashCode =>
        width.hashCode +
        height.hashCode +
        size.hashCode +
        mime.hashCode;

  factory FileVariant.fromJson(Map<String, dynamic> json) => _$FileVariantFromJson(json);

  Map<String, dynamic> toJson() => _$FileVariantToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

