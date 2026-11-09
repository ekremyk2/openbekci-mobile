//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// Whether a status counts as open work or as finished. Open enum.
enum TicketSemantic {
  @JsonValue(r'open_like')
  openLike(r'open_like'),
  @JsonValue(r'closed_like')
  closedLike(r'closed_like'),
  @JsonValue(r'unknown_default_open_api')
  unknownDefaultOpenApi(r'unknown_default_open_api');

  const TicketSemantic(this.value);

  final String value;

  @override
  String toString() => value;
}
