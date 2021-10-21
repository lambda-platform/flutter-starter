// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'request_repair_history.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestRepairHistory$Query$Paginate$DsRequestConflicts
    _$RequestRepairHistory$Query$Paginate$DsRequestConflictsFromJson(
        Map<String, dynamic> json) {
  return RequestRepairHistory$Query$Paginate$DsRequestConflicts()
    ..id = json['id'] as int?
    ..name = json['name'] as String?
    ..fixerId = json['fixer_id'] as int?
    ..fixerDescription = json['fixer_description'] as String?
    ..fixerImage = json['fixer_image'] as String?
    ..endedAt = json['ended_at'] == null
        ? null
        : DateTime.parse(json['ended_at'] as String)
    ..statusId = json['status_id'] as int?
    ..statusName = json['status_name'] as String?;
}

Map<String, dynamic>
    _$RequestRepairHistory$Query$Paginate$DsRequestConflictsToJson(
            RequestRepairHistory$Query$Paginate$DsRequestConflicts instance) =>
        <String, dynamic>{
          'id': instance.id,
          'name': instance.name,
          'fixer_id': instance.fixerId,
          'fixer_description': instance.fixerDescription,
          'fixer_image': instance.fixerImage,
          'ended_at': instance.endedAt?.toIso8601String(),
          'status_id': instance.statusId,
          'status_name': instance.statusName,
        };

RequestRepairHistory$Query$Paginate
    _$RequestRepairHistory$Query$PaginateFromJson(Map<String, dynamic> json) {
  return RequestRepairHistory$Query$Paginate()
    ..total = json['total'] as int
    ..lastPage = json['last_page'] as int
    ..dsRequestConflicts = (json['ds_request_conflicts'] as List<dynamic>?)
        ?.map((e) =>
            RequestRepairHistory$Query$Paginate$DsRequestConflicts.fromJson(
                e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$RequestRepairHistory$Query$PaginateToJson(
        RequestRepairHistory$Query$Paginate instance) =>
    <String, dynamic>{
      'total': instance.total,
      'last_page': instance.lastPage,
      'ds_request_conflicts':
          instance.dsRequestConflicts?.map((e) => e.toJson()).toList(),
    };

RequestRepairHistory$Query _$RequestRepairHistory$QueryFromJson(
    Map<String, dynamic> json) {
  return RequestRepairHistory$Query()
    ..paginate = RequestRepairHistory$Query$Paginate.fromJson(
        json['paginate'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RequestRepairHistory$QueryToJson(
        RequestRepairHistory$Query instance) =>
    <String, dynamic>{
      'paginate': instance.paginate.toJson(),
    };

RequestRepairHistoryArguments _$RequestRepairHistoryArgumentsFromJson(
    Map<String, dynamic> json) {
  return RequestRepairHistoryArguments(
    fixer_id: json['fixer_id'] as String,
    page: json['page'] as int,
    size: json['size'] as int,
  );
}

Map<String, dynamic> _$RequestRepairHistoryArgumentsToJson(
        RequestRepairHistoryArguments instance) =>
    <String, dynamic>{
      'fixer_id': instance.fixer_id,
      'page': instance.page,
      'size': instance.size,
    };
