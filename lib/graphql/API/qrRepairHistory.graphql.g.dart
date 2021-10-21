// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'qrRepairHistory.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrRepairHistory$Query$DsRequestConflicts
    _$QrRepairHistory$Query$DsRequestConflictsFromJson(
        Map<String, dynamic> json) {
  return QrRepairHistory$Query$DsRequestConflicts()
    ..id = json['id'] as int?
    ..endedAt = json['ended_at'] == null
        ? null
        : DateTime.parse(json['ended_at'] as String)
    ..fixerImage = json['fixer_image'] as String?
    ..fixerLastName = json['fixer_last_name'] as String?
    ..fixerFirstName = json['fixer_first_name'] as String?
    ..fixerDescription = json['fixer_description'] as String?
    ..nameOrg = json['name_org'] as String?;
}

Map<String, dynamic> _$QrRepairHistory$Query$DsRequestConflictsToJson(
        QrRepairHistory$Query$DsRequestConflicts instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ended_at': instance.endedAt?.toIso8601String(),
      'fixer_image': instance.fixerImage,
      'fixer_last_name': instance.fixerLastName,
      'fixer_first_name': instance.fixerFirstName,
      'fixer_description': instance.fixerDescription,
      'name_org': instance.nameOrg,
    };

QrRepairHistory$Query _$QrRepairHistory$QueryFromJson(
    Map<String, dynamic> json) {
  return QrRepairHistory$Query()
    ..dsRequestConflicts = (json['ds_request_conflicts'] as List<dynamic>?)
        ?.map((e) => QrRepairHistory$Query$DsRequestConflicts.fromJson(
            e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$QrRepairHistory$QueryToJson(
        QrRepairHistory$Query instance) =>
    <String, dynamic>{
      'ds_request_conflicts':
          instance.dsRequestConflicts?.map((e) => e.toJson()).toList(),
    };

QrRepairHistoryArguments _$QrRepairHistoryArgumentsFromJson(
    Map<String, dynamic> json) {
  return QrRepairHistoryArguments(
    item_id: json['item_id'] as String,
  );
}

Map<String, dynamic> _$QrRepairHistoryArgumentsToJson(
        QrRepairHistoryArguments instance) =>
    <String, dynamic>{
      'item_id': instance.item_id,
    };
