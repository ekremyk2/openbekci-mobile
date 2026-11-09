// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PersonCWProxy {
  Person id(String id);

  Person orgId(String orgId);

  Person userId(String? userId);

  Person displayName(String displayName);

  Person contact(PersonContact contact);

  Person nationalIdMasked(String? nationalIdMasked);

  Person nationalIdCountry(String? nationalIdCountry);

  Person gateContactPhone(String? gateContactPhone);

  Person notes(String? notes);

  Person joinStatus(PersonJoinStatusEnum joinStatus);

  Person directoryConsent(List<DirectoryConsent> directoryConsent);

  Person createdAt(DateTime createdAt);

  Person updatedAt(DateTime updatedAt);

  Person version(int version);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Person(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Person(...).copyWith(id: 12, name: "My name")
  /// ````
  Person call({
    String id,
    String orgId,
    String? userId,
    String displayName,
    PersonContact contact,
    String? nationalIdMasked,
    String? nationalIdCountry,
    String? gateContactPhone,
    String? notes,
    PersonJoinStatusEnum joinStatus,
    List<DirectoryConsent> directoryConsent,
    DateTime createdAt,
    DateTime updatedAt,
    int version,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPerson.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPerson.copyWith.fieldName(...)`
class _$PersonCWProxyImpl implements _$PersonCWProxy {
  const _$PersonCWProxyImpl(this._value);

  final Person _value;

  @override
  Person id(String id) => this(id: id);

  @override
  Person orgId(String orgId) => this(orgId: orgId);

  @override
  Person userId(String? userId) => this(userId: userId);

  @override
  Person displayName(String displayName) => this(displayName: displayName);

  @override
  Person contact(PersonContact contact) => this(contact: contact);

  @override
  Person nationalIdMasked(String? nationalIdMasked) =>
      this(nationalIdMasked: nationalIdMasked);

  @override
  Person nationalIdCountry(String? nationalIdCountry) =>
      this(nationalIdCountry: nationalIdCountry);

  @override
  Person gateContactPhone(String? gateContactPhone) =>
      this(gateContactPhone: gateContactPhone);

  @override
  Person notes(String? notes) => this(notes: notes);

  @override
  Person joinStatus(PersonJoinStatusEnum joinStatus) =>
      this(joinStatus: joinStatus);

  @override
  Person directoryConsent(List<DirectoryConsent> directoryConsent) =>
      this(directoryConsent: directoryConsent);

  @override
  Person createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Person updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  Person version(int version) => this(version: version);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Person(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Person(...).copyWith(id: 12, name: "My name")
  /// ````
  Person call({
    Object? id = const $CopyWithPlaceholder(),
    Object? orgId = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
    Object? displayName = const $CopyWithPlaceholder(),
    Object? contact = const $CopyWithPlaceholder(),
    Object? nationalIdMasked = const $CopyWithPlaceholder(),
    Object? nationalIdCountry = const $CopyWithPlaceholder(),
    Object? gateContactPhone = const $CopyWithPlaceholder(),
    Object? notes = const $CopyWithPlaceholder(),
    Object? joinStatus = const $CopyWithPlaceholder(),
    Object? directoryConsent = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
  }) {
    return Person(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      orgId: orgId == const $CopyWithPlaceholder()
          ? _value.orgId
          // ignore: cast_nullable_to_non_nullable
          : orgId as String,
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String?,
      displayName: displayName == const $CopyWithPlaceholder()
          ? _value.displayName
          // ignore: cast_nullable_to_non_nullable
          : displayName as String,
      contact: contact == const $CopyWithPlaceholder()
          ? _value.contact
          // ignore: cast_nullable_to_non_nullable
          : contact as PersonContact,
      nationalIdMasked: nationalIdMasked == const $CopyWithPlaceholder()
          ? _value.nationalIdMasked
          // ignore: cast_nullable_to_non_nullable
          : nationalIdMasked as String?,
      nationalIdCountry: nationalIdCountry == const $CopyWithPlaceholder()
          ? _value.nationalIdCountry
          // ignore: cast_nullable_to_non_nullable
          : nationalIdCountry as String?,
      gateContactPhone: gateContactPhone == const $CopyWithPlaceholder()
          ? _value.gateContactPhone
          // ignore: cast_nullable_to_non_nullable
          : gateContactPhone as String?,
      notes: notes == const $CopyWithPlaceholder()
          ? _value.notes
          // ignore: cast_nullable_to_non_nullable
          : notes as String?,
      joinStatus: joinStatus == const $CopyWithPlaceholder()
          ? _value.joinStatus
          // ignore: cast_nullable_to_non_nullable
          : joinStatus as PersonJoinStatusEnum,
      directoryConsent: directoryConsent == const $CopyWithPlaceholder()
          ? _value.directoryConsent
          // ignore: cast_nullable_to_non_nullable
          : directoryConsent as List<DirectoryConsent>,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
      version: version == const $CopyWithPlaceholder()
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as int,
    );
  }
}

extension $PersonCopyWith on Person {
  /// Returns a callable class that can be used as follows: `instanceOfPerson.copyWith(...)` or like so:`instanceOfPerson.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PersonCWProxy get copyWith => _$PersonCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Person',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'id',
        'org_id',
        'user_id',
        'display_name',
        'contact',
        'national_id_masked',
        'national_id_country',
        'gate_contact_phone',
        'notes',
        'join_status',
        'directory_consent',
        'created_at',
        'updated_at',
        'version',
      ],
    );
    final val = Person(
      id: $checkedConvert('id', (v) => v as String),
      orgId: $checkedConvert('org_id', (v) => v as String),
      userId: $checkedConvert('user_id', (v) => v as String?),
      displayName: $checkedConvert('display_name', (v) => v as String),
      contact: $checkedConvert(
        'contact',
        (v) => PersonContact.fromJson(v as Map<String, dynamic>),
      ),
      nationalIdMasked: $checkedConvert(
        'national_id_masked',
        (v) => v as String?,
      ),
      nationalIdCountry: $checkedConvert(
        'national_id_country',
        (v) => v as String?,
      ),
      gateContactPhone: $checkedConvert(
        'gate_contact_phone',
        (v) => v as String?,
      ),
      notes: $checkedConvert('notes', (v) => v as String?),
      joinStatus: $checkedConvert(
        'join_status',
        (v) => $enumDecode(
          _$PersonJoinStatusEnumEnumMap,
          v,
          unknownValue: PersonJoinStatusEnum.unknownDefaultOpenApi,
        ),
      ),
      directoryConsent: $checkedConvert(
        'directory_consent',
        (v) => (v as List<dynamic>)
            .map((e) => DirectoryConsent.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
      version: $checkedConvert('version', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'orgId': 'org_id',
    'userId': 'user_id',
    'displayName': 'display_name',
    'nationalIdMasked': 'national_id_masked',
    'nationalIdCountry': 'national_id_country',
    'gateContactPhone': 'gate_contact_phone',
    'joinStatus': 'join_status',
    'directoryConsent': 'directory_consent',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
  'id': instance.id,
  'org_id': instance.orgId,
  'user_id': instance.userId,
  'display_name': instance.displayName,
  'contact': instance.contact.toJson(),
  'national_id_masked': instance.nationalIdMasked,
  'national_id_country': instance.nationalIdCountry,
  'gate_contact_phone': instance.gateContactPhone,
  'notes': instance.notes,
  'join_status': _$PersonJoinStatusEnumEnumMap[instance.joinStatus]!,
  'directory_consent': instance.directoryConsent
      .map((e) => e.toJson())
      .toList(),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'version': instance.version,
};

const _$PersonJoinStatusEnumEnumMap = {
  PersonJoinStatusEnum.noAccount: 'no_account',
  PersonJoinStatusEnum.invited: 'invited',
  PersonJoinStatusEnum.joined: 'joined',
  PersonJoinStatusEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
