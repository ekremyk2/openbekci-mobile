//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated_from.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GeneratedFrom {
  /// Returns a new [GeneratedFrom] instance.
  GeneratedFrom({

    required  this.type,

    required  this.id,
  });

      /// For example statement, receipt, certificate, closing_statement, minutes.
  @JsonKey(
    
    name: r'type',
    required: true,
    includeIfNull: false,
  )


  final String type;



  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GeneratedFrom &&
      other.type == type &&
      other.id == id;

    @override
    int get hashCode =>
        type.hashCode +
        id.hashCode;

  factory GeneratedFrom.fromJson(Map<String, dynamic> json) => _$GeneratedFromFromJson(json);

  Map<String, dynamic> toJson() => _$GeneratedFromToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

