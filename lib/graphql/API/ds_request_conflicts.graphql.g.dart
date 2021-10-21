// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'ds_request_conflicts.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DsRequestConflicts$Query$Paginate$DsRequestConflicts
    _$DsRequestConflicts$Query$Paginate$DsRequestConflictsFromJson(
        Map<String, dynamic> json) {
  return DsRequestConflicts$Query$Paginate$DsRequestConflicts()
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
    _$DsRequestConflicts$Query$Paginate$DsRequestConflictsToJson(
            DsRequestConflicts$Query$Paginate$DsRequestConflicts instance) =>
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

DsRequestConflicts$Query$Paginate _$DsRequestConflicts$Query$PaginateFromJson(
    Map<String, dynamic> json) {
  return DsRequestConflicts$Query$Paginate()
    ..total = json['total'] as int
    ..lastPage = json['last_page'] as int
    ..dsRequestConflicts = (json['ds_request_conflicts'] as List<dynamic>?)
        ?.map((e) =>
            DsRequestConflicts$Query$Paginate$DsRequestConflicts.fromJson(
                e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$DsRequestConflicts$Query$PaginateToJson(
        DsRequestConflicts$Query$Paginate instance) =>
    <String, dynamic>{
      'total': instance.total,
      'last_page': instance.lastPage,
      'ds_request_conflicts':
          instance.dsRequestConflicts?.map((e) => e.toJson()).toList(),
    };

DsRequestConflicts$Query _$DsRequestConflicts$QueryFromJson(
    Map<String, dynamic> json) {
  return DsRequestConflicts$Query()
    ..paginate = DsRequestConflicts$Query$Paginate.fromJson(
        json['paginate'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DsRequestConflicts$QueryToJson(
        DsRequestConflicts$Query instance) =>
    <String, dynamic>{
      'paginate': instance.paginate.toJson(),
    };

DsRequestConflictsArguments _$DsRequestConflictsArgumentsFromJson(
    Map<String, dynamic> json) {
  return DsRequestConflictsArguments(
    requested_user_id: json['requested_user_id'] as String,
    page: json['page'] as int,
    size: json['size'] as int,
  );
}

Map<String, dynamic> _$DsRequestConflictsArgumentsToJson(
        DsRequestConflictsArguments instance) =>
    <String, dynamic>{
      'requested_user_id': instance.requested_user_id,
      'page': instance.page,
      'size': instance.size,
    };
