// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'arrived_request_detail.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArrivedRequestDetail$Query$DsRequestConflicts
    _$ArrivedRequestDetail$Query$DsRequestConflictsFromJson(
        Map<String, dynamic> json) {
  return ArrivedRequestDetail$Query$DsRequestConflicts()
    ..id = json['id'] as int?
    ..name = json['name'] as String?
    ..description = json['description'] as String?
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..fixerId = json['fixer_id'] as int?
    ..fixerDescription = json['fixer_description'] as String?
    ..reqImage = json['req_image'] as String?
    ..fixerImage = json['fixer_image'] as String?
    ..typeId = json['type_id'] as int?
    ..typeName = json['type_name'] as String?;
}

Map<String, dynamic> _$ArrivedRequestDetail$Query$DsRequestConflictsToJson(
        ArrivedRequestDetail$Query$DsRequestConflicts instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'created_at': instance.createdAt?.toIso8601String(),
      'fixer_id': instance.fixerId,
      'fixer_description': instance.fixerDescription,
      'req_image': instance.reqImage,
      'fixer_image': instance.fixerImage,
      'type_id': instance.typeId,
      'type_name': instance.typeName,
    };

ArrivedRequestDetail$Query _$ArrivedRequestDetail$QueryFromJson(
    Map<String, dynamic> json) {
  return ArrivedRequestDetail$Query()
    ..dsRequestConflicts = (json['ds_request_conflicts'] as List<dynamic>?)
        ?.map((e) => ArrivedRequestDetail$Query$DsRequestConflicts.fromJson(
            e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$ArrivedRequestDetail$QueryToJson(
        ArrivedRequestDetail$Query instance) =>
    <String, dynamic>{
      'ds_request_conflicts':
          instance.dsRequestConflicts?.map((e) => e.toJson()).toList(),
    };

ArrivedRequestDetailArguments _$ArrivedRequestDetailArgumentsFromJson(
    Map<String, dynamic> json) {
  return ArrivedRequestDetailArguments(
    requestID: json['requestID'] as String,
  );
}

Map<String, dynamic> _$ArrivedRequestDetailArgumentsToJson(
        ArrivedRequestDetailArguments instance) =>
    <String, dynamic>{
      'requestID': instance.requestID,
    };
