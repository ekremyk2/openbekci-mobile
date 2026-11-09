// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_create.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketCreateCWProxy {
  TicketCreate siteId(String siteId);

  TicketCreate unitId(String? unitId);

  TicketCreate categoryId(String categoryId);

  TicketCreate title(String title);

  TicketCreate description(String description);

  TicketCreate visibility(TicketCreateVisibilityEnum? visibility);

  TicketCreate reporterPersonId(String? reporterPersonId);

  TicketCreate attachmentFileIds(List<String>? attachmentFileIds);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketCreate call({
    String siteId,
    String? unitId,
    String categoryId,
    String title,
    String description,
    TicketCreateVisibilityEnum? visibility,
    String? reporterPersonId,
    List<String>? attachmentFileIds,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketCreate.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketCreate.copyWith.fieldName(...)`
class _$TicketCreateCWProxyImpl implements _$TicketCreateCWProxy {
  const _$TicketCreateCWProxyImpl(this._value);

  final TicketCreate _value;

  @override
  TicketCreate siteId(String siteId) => this(siteId: siteId);

  @override
  TicketCreate unitId(String? unitId) => this(unitId: unitId);

  @override
  TicketCreate categoryId(String categoryId) => this(categoryId: categoryId);

  @override
  TicketCreate title(String title) => this(title: title);

  @override
  TicketCreate description(String description) =>
      this(description: description);

  @override
  TicketCreate visibility(TicketCreateVisibilityEnum? visibility) =>
      this(visibility: visibility);

  @override
  TicketCreate reporterPersonId(String? reporterPersonId) =>
      this(reporterPersonId: reporterPersonId);

  @override
  TicketCreate attachmentFileIds(List<String>? attachmentFileIds) =>
      this(attachmentFileIds: attachmentFileIds);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketCreate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketCreate(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketCreate call({
    Object? siteId = const $CopyWithPlaceholder(),
    Object? unitId = const $CopyWithPlaceholder(),
    Object? categoryId = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? visibility = const $CopyWithPlaceholder(),
    Object? reporterPersonId = const $CopyWithPlaceholder(),
    Object? attachmentFileIds = const $CopyWithPlaceholder(),
  }) {
    return TicketCreate(
      siteId: siteId == const $CopyWithPlaceholder()
          ? _value.siteId
          // ignore: cast_nullable_to_non_nullable
          : siteId as String,
      unitId: unitId == const $CopyWithPlaceholder()
          ? _value.unitId
          // ignore: cast_nullable_to_non_nullable
          : unitId as String?,
      categoryId: categoryId == const $CopyWithPlaceholder()
          ? _value.categoryId
          // ignore: cast_nullable_to_non_nullable
          : categoryId as String,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String,
      visibility: visibility == const $CopyWithPlaceholder()
          ? _value.visibility
          // ignore: cast_nullable_to_non_nullable
          : visibility as TicketCreateVisibilityEnum?,
      reporterPersonId: reporterPersonId == const $CopyWithPlaceholder()
          ? _value.reporterPersonId
          // ignore: cast_nullable_to_non_nullable
          : reporterPersonId as String?,
      attachmentFileIds: attachmentFileIds == const $CopyWithPlaceholder()
          ? _value.attachmentFileIds
          // ignore: cast_nullable_to_non_nullable
          : attachmentFileIds as List<String>?,
    );
  }
}

extension $TicketCreateCopyWith on TicketCreate {
  /// Returns a callable class that can be used as follows: `instanceOfTicketCreate.copyWith(...)` or like so:`instanceOfTicketCreate.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketCreateCWProxy get copyWith => _$TicketCreateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketCreate _$TicketCreateFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TicketCreate',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'site_id',
            'category_id',
            'title',
            'description',
          ],
        );
        final val = TicketCreate(
          siteId: $checkedConvert('site_id', (v) => v as String),
          unitId: $checkedConvert('unit_id', (v) => v as String?),
          categoryId: $checkedConvert('category_id', (v) => v as String),
          title: $checkedConvert('title', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          visibility: $checkedConvert(
            'visibility',
            (v) => $enumDecodeNullable(
              _$TicketCreateVisibilityEnumEnumMap,
              v,
              unknownValue: TicketCreateVisibilityEnum.unknownDefaultOpenApi,
            ),
          ),
          reporterPersonId: $checkedConvert(
            'reporter_person_id',
            (v) => v as String?,
          ),
          attachmentFileIds: $checkedConvert(
            'attachment_file_ids',
            (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'siteId': 'site_id',
        'unitId': 'unit_id',
        'categoryId': 'category_id',
        'reporterPersonId': 'reporter_person_id',
        'attachmentFileIds': 'attachment_file_ids',
      },
    );

Map<String, dynamic> _$TicketCreateToJson(TicketCreate instance) =>
    <String, dynamic>{
      'site_id': instance.siteId,
      'unit_id': ?instance.unitId,
      'category_id': instance.categoryId,
      'title': instance.title,
      'description': instance.description,
      'visibility': ?_$TicketCreateVisibilityEnumEnumMap[instance.visibility],
      'reporter_person_id': ?instance.reporterPersonId,
      'attachment_file_ids': ?instance.attachmentFileIds,
    };

const _$TicketCreateVisibilityEnumEnumMap = {
  TicketCreateVisibilityEnum.private: 'private',
  TicketCreateVisibilityEnum.common: 'common',
  TicketCreateVisibilityEnum.unknownDefaultOpenApi: 'unknown_default_open_api',
};
