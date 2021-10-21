// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'ds_request_fixer.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DsRequestFixer$Query$Paginate$DsRequestConflicts
    _$DsRequestFixer$Query$Paginate$DsRequestConflictsFromJson(
        Map<String, dynamic> json) {
  return DsRequestFixer$Query$Paginate$DsRequestConflicts()
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

Map<String, dynamic> _$DsRequestFixer$Query$Paginate$DsRequestConflictsToJson(
        DsRequestFixer$Query$Paginate$DsRequestConflicts instance) =>
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

DsRequestFixer$Query$Paginate _$DsRequestFixer$Query$PaginateFromJson(
    Map<String, dynamic> json) {
  return DsRequestFixer$Query$Paginate()
    ..total = json['total'] as int
    ..lastPage = json['last_page'] as int
    ..dsRequestConflicts = (json['ds_request_conflicts'] as List<dynamic>?)
        ?.map((e) => DsRequestFixer$Query$Paginate$DsRequestConflicts.fromJson(
            e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$DsRequestFixer$Query$PaginateToJson(
        DsRequestFixer$Query$Paginate instance) =>
    <String, dynamic>{
      'total': instance.total,
      'last_page': instance.lastPage,
      'ds_request_conflicts':
          instance.dsRequestConflicts?.map((e) => e.toJson()).toList(),
    };

DsRequestFixer$Query _$DsRequestFixer$QueryFromJson(Map<String, dynamic> json) {
  return DsRequestFixer$Query()
    ..paginate = DsRequestFixer$Query$Paginate.fromJson(
        json['paginate'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DsRequestFixer$QueryToJson(
        DsRequestFixer$Query instance) =>
    <String, dynamic>{
      'paginate': instance.paginate.toJson(),
    };

DsRequestFixerArguments _$DsRequestFixerArgumentsFromJson(
    Map<String, dynamic> json) {
  return DsRequestFixerArguments(
    fixer_id: json['fixer_id'] as String,
    page: json['page'] as int,
    size: json['size'] as int,
  );
}

Map<String, dynamic> _$DsRequestFixerArgumentsToJson(
        DsRequestFixerArguments instance) =>
    <String, dynamic>{
      'fixer_id': instance.fixer_id,
      'page': instance.page,
      'size': instance.size,
    };
