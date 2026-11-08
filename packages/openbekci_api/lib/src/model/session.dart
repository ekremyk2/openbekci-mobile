//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Session {
  /// Returns a new [Session] instance.
  Session({

    required  this.id,

    required  this.client,

    required  this.deviceName,

    required  this.ip,

    required  this.userAgent,

    required  this.createdAt,

    required  this.lastUsedAt,

    required  this.expiresAt,

    required  this.current,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



      /// Open enum.
  @JsonKey(
    
    name: r'client',
    required: true,
    includeIfNull: false,
  unknownEnumValue: SessionClientEnum.unknownDefaultOpenApi,
  )


  final SessionClientEnum client;



  @JsonKey(
    
    name: r'device_name',
    required: true,
    includeIfNull: true,
  )


  final String? deviceName;



      /// Address the session was created from.
  @JsonKey(
    
    name: r'ip',
    required: true,
    includeIfNull: true,
  )


  final String? ip;



  @JsonKey(
    
    name: r'user_agent',
    required: true,
    includeIfNull: true,
  )


  final String? userAgent;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'last_used_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? lastUsedAt;



  @JsonKey(
    
    name: r'expires_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiresAt;



      /// True for the session that made this request.
  @JsonKey(
    
    name: r'current',
    required: true,
    includeIfNull: false,
  )


  final bool current;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Session &&
      other.id == id &&
      other.client == client &&
      other.deviceName == deviceName &&
      other.ip == ip &&
      other.userAgent == userAgent &&
      other.createdAt == createdAt &&
      other.lastUsedAt == lastUsedAt &&
      other.expiresAt == expiresAt &&
      other.current == current;

    @override
    int get hashCode =>
        id.hashCode +
        client.hashCode +
        (deviceName == null ? 0 : deviceName.hashCode) +
        (ip == null ? 0 : ip.hashCode) +
        (userAgent == null ? 0 : userAgent.hashCode) +
        createdAt.hashCode +
        (lastUsedAt == null ? 0 : lastUsedAt.hashCode) +
        expiresAt.hashCode +
        current.hashCode;

  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Open enum.
enum SessionClientEnum {
@JsonValue(r'web')
web(r'web'),
@JsonValue(r'mobile')
mobile(r'mobile'),
@JsonValue(r'unknown_default_open_api')
unknownDefaultOpenApi(r'unknown_default_open_api');

const SessionClientEnum(this.value);

final String value;

@override
String toString() => value;
}


