// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'repair_history_detail.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairHistoryDetail$Query$DsRequestConflicts
    _$RepairHistoryDetail$Query$DsRequestConflictsFromJson(
        Map<String, dynamic> json) {
  return RepairHistoryDetail$Query$DsRequestConflicts()
    ..id = json['id'] as int?
    ..name = json['name'] as String?
    ..fixerDescription = json['fixer_description'] as String?
    ..fixerId = json['fixer_id'] as int?
    ..fixerImage = json['fixer_image'] as String?
    ..endedAt = json['ended_at'] == null
        ? null
        : DateTime.parse(json['ended_at'] as String)
    ..statusId = json['status_id'] as int?
    ..statusName = json['status_name'] as String?;
}

Map<String, dynamic> _$RepairHistoryDetail$Query$DsRequestConflictsToJson(
        RepairHistoryDetail$Query$DsRequestConflicts instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fixer_description': instance.fixerDescription,
      'fixer_id': instance.fixerId,
      'fixer_image': instance.fixerImage,
      'ended_at': instance.endedAt?.toIso8601String(),
      'status_id': instance.statusId,
      'status_name': instance.statusName,
    };

RepairHistoryDetail$Query _$RepairHistoryDetail$QueryFromJson(
    Map<String, dynamic> json) {
  return RepairHistoryDetail$Query()
    ..dsRequestConflicts = (json['ds_request_conflicts'] as List<dynamic>?)
        ?.map((e) => RepairHistoryDetail$Query$DsRequestConflicts.fromJson(
            e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$RepairHistoryDetail$QueryToJson(
        RepairHistoryDetail$Query instance) =>
    <String, dynamic>{
      'ds_request_conflicts':
          instance.dsRequestConflicts?.map((e) => e.toJson()).toList(),
    };

RepairHistoryDetailArguments _$RepairHistoryDetailArgumentsFromJson(
    Map<String, dynamic> json) {
  return RepairHistoryDetailArguments(
    requestID: json['requestID'] as String,
  );
}

Map<String, dynamic> _$RepairHistoryDetailArgumentsToJson(
        RepairHistoryDetailArguments instance) =>
    <String, dynamic>{
      'requestID': instance.requestID,
    };
