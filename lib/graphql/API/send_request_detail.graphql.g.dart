// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'send_request_detail.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendRequestDetail$Query$DsRequestConflicts
    _$SendRequestDetail$Query$DsRequestConflictsFromJson(
        Map<String, dynamic> json) {
  return SendRequestDetail$Query$DsRequestConflicts()
    ..id = json['id'] as int?
    ..name = json['name'] as String?
    ..description = json['description'] as String?
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..statusId = json['status_id'] as int?
    ..statusName = json['status_name'] as String?
    ..fixerId = json['fixer_id'] as int?
    ..fixerDescription = json['fixer_description'] as String?
    ..reqImage = json['req_image'] as String?
    ..fixerImage = json['fixer_image'] as String?
    ..endedAt = json['ended_at'] == null
        ? null
        : DateTime.parse(json['ended_at'] as String);
}

Map<String, dynamic> _$SendRequestDetail$Query$DsRequestConflictsToJson(
        SendRequestDetail$Query$DsRequestConflicts instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'created_at': instance.createdAt?.toIso8601String(),
      'status_id': instance.statusId,
      'status_name': instance.statusName,
      'fixer_id': instance.fixerId,
      'fixer_description': instance.fixerDescription,
      'req_image': instance.reqImage,
      'fixer_image': instance.fixerImage,
      'ended_at': instance.endedAt?.toIso8601String(),
    };

SendRequestDetail$Query _$SendRequestDetail$QueryFromJson(
    Map<String, dynamic> json) {
  return SendRequestDetail$Query()
    ..dsRequestConflicts = (json['ds_request_conflicts'] as List<dynamic>?)
        ?.map((e) => SendRequestDetail$Query$DsRequestConflicts.fromJson(
            e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$SendRequestDetail$QueryToJson(
        SendRequestDetail$Query instance) =>
    <String, dynamic>{
      'ds_request_conflicts':
          instance.dsRequestConflicts?.map((e) => e.toJson()).toList(),
    };

SendRequestDetailArguments _$SendRequestDetailArgumentsFromJson(
    Map<String, dynamic> json) {
  return SendRequestDetailArguments(
    requestID: json['requestID'] as String,
  );
}

Map<String, dynamic> _$SendRequestDetailArgumentsToJson(
        SendRequestDetailArguments instance) =>
    <String, dynamic>{
      'requestID': instance.requestID,
    };
