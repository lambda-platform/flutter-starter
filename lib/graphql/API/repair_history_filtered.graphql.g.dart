// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'repair_history_filtered.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairHistoryFiltered$Query$Paginate$DsRequestConflicts
    _$RepairHistoryFiltered$Query$Paginate$DsRequestConflictsFromJson(
        Map<String, dynamic> json) {
  return RepairHistoryFiltered$Query$Paginate$DsRequestConflicts()
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
    _$RepairHistoryFiltered$Query$Paginate$DsRequestConflictsToJson(
            RepairHistoryFiltered$Query$Paginate$DsRequestConflicts instance) =>
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

RepairHistoryFiltered$Query$Paginate
    _$RepairHistoryFiltered$Query$PaginateFromJson(Map<String, dynamic> json) {
  return RepairHistoryFiltered$Query$Paginate()
    ..total = json['total'] as int
    ..lastPage = json['last_page'] as int
    ..dsRequestConflicts = (json['ds_request_conflicts'] as List<dynamic>?)
        ?.map((e) =>
            RepairHistoryFiltered$Query$Paginate$DsRequestConflicts.fromJson(
                e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$RepairHistoryFiltered$Query$PaginateToJson(
        RepairHistoryFiltered$Query$Paginate instance) =>
    <String, dynamic>{
      'total': instance.total,
      'last_page': instance.lastPage,
      'ds_request_conflicts':
          instance.dsRequestConflicts?.map((e) => e.toJson()).toList(),
    };

RepairHistoryFiltered$Query _$RepairHistoryFiltered$QueryFromJson(
    Map<String, dynamic> json) {
  return RepairHistoryFiltered$Query()
    ..paginate = RepairHistoryFiltered$Query$Paginate.fromJson(
        json['paginate'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RepairHistoryFiltered$QueryToJson(
        RepairHistoryFiltered$Query instance) =>
    <String, dynamic>{
      'paginate': instance.paginate.toJson(),
    };

RepairHistoryFilteredArguments _$RepairHistoryFilteredArgumentsFromJson(
    Map<String, dynamic> json) {
  return RepairHistoryFilteredArguments(
    fixer_id: json['fixer_id'] as String,
    status_id: json['status_id'] as String,
    page: json['page'] as int,
    size: json['size'] as int,
  );
}

Map<String, dynamic> _$RepairHistoryFilteredArgumentsToJson(
        RepairHistoryFilteredArguments instance) =>
    <String, dynamic>{
      'fixer_id': instance.fixer_id,
      'status_id': instance.status_id,
      'page': instance.page,
      'size': instance.size,
    };
