// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'ds_request_filtered.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DsRequestFiltered$Query$Paginate$DsRequestConflicts
    _$DsRequestFiltered$Query$Paginate$DsRequestConflictsFromJson(
        Map<String, dynamic> json) {
  return DsRequestFiltered$Query$Paginate$DsRequestConflicts()
    ..id = json['id'] as int?
    ..name = json['name'] as String?
    ..description = json['description'] as String?
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..statusName = json['status_name'] as String?
    ..nameOrg = json['name_org'] as String?
    ..statusId = json['status_id'] as int?
    ..typeName = json['type_name'] as String?
    ..typeId = json['type_id'] as int?
    ..fixerId = json['fixer_id'] as int?;
}

Map<String, dynamic>
    _$DsRequestFiltered$Query$Paginate$DsRequestConflictsToJson(
            DsRequestFiltered$Query$Paginate$DsRequestConflicts instance) =>
        <String, dynamic>{
          'id': instance.id,
          'name': instance.name,
          'description': instance.description,
          'created_at': instance.createdAt?.toIso8601String(),
          'status_name': instance.statusName,
          'name_org': instance.nameOrg,
          'status_id': instance.statusId,
          'type_name': instance.typeName,
          'type_id': instance.typeId,
          'fixer_id': instance.fixerId,
        };

DsRequestFiltered$Query$Paginate _$DsRequestFiltered$Query$PaginateFromJson(
    Map<String, dynamic> json) {
  return DsRequestFiltered$Query$Paginate()
    ..total = json['total'] as int
    ..lastPage = json['last_page'] as int
    ..dsRequestConflicts = (json['ds_request_conflicts'] as List<dynamic>?)
        ?.map((e) =>
            DsRequestFiltered$Query$Paginate$DsRequestConflicts.fromJson(
                e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$DsRequestFiltered$Query$PaginateToJson(
        DsRequestFiltered$Query$Paginate instance) =>
    <String, dynamic>{
      'total': instance.total,
      'last_page': instance.lastPage,
      'ds_request_conflicts':
          instance.dsRequestConflicts?.map((e) => e.toJson()).toList(),
    };

DsRequestFiltered$Query _$DsRequestFiltered$QueryFromJson(
    Map<String, dynamic> json) {
  return DsRequestFiltered$Query()
    ..paginate = DsRequestFiltered$Query$Paginate.fromJson(
        json['paginate'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DsRequestFiltered$QueryToJson(
        DsRequestFiltered$Query instance) =>
    <String, dynamic>{
      'paginate': instance.paginate.toJson(),
    };

DsRequestFilteredArguments _$DsRequestFilteredArgumentsFromJson(
    Map<String, dynamic> json) {
  return DsRequestFilteredArguments(
    fixer_id: json['fixer_id'] as String,
    type_id: json['type_id'] as String,
    page: json['page'] as int,
    size: json['size'] as int,
  );
}

Map<String, dynamic> _$DsRequestFilteredArgumentsToJson(
        DsRequestFilteredArguments instance) =>
    <String, dynamic>{
      'fixer_id': instance.fixer_id,
      'type_id': instance.type_id,
      'page': instance.page,
      'size': instance.size,
    };
