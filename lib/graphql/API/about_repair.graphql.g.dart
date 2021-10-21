// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'about_repair.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairHistory$Query$DsRequestConflicts
    _$RepairHistory$Query$DsRequestConflictsFromJson(
        Map<String, dynamic> json) {
  return RepairHistory$Query$DsRequestConflicts()
    ..id = json['id'] as int?
    ..fixerId = json['fixer_id'] as int?
    ..fixerDescription = json['fixer_description'] as String?
    ..statusId = json['status_id'] as int?
    ..statusName = json['status_name'] as String?;
}

Map<String, dynamic> _$RepairHistory$Query$DsRequestConflictsToJson(
        RepairHistory$Query$DsRequestConflicts instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fixer_id': instance.fixerId,
      'fixer_description': instance.fixerDescription,
      'status_id': instance.statusId,
      'status_name': instance.statusName,
    };

RepairHistory$Query _$RepairHistory$QueryFromJson(Map<String, dynamic> json) {
  return RepairHistory$Query()
    ..dsRequestConflicts = (json['ds_request_conflicts'] as List<dynamic>?)
        ?.map((e) => RepairHistory$Query$DsRequestConflicts.fromJson(
            e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$RepairHistory$QueryToJson(
        RepairHistory$Query instance) =>
    <String, dynamic>{
      'ds_request_conflicts':
          instance.dsRequestConflicts?.map((e) => e.toJson()).toList(),
    };
