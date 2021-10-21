// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'districts.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Districts$Query$Districts$Regions _$Districts$Query$Districts$RegionsFromJson(
    Map<String, dynamic> json) {
  return Districts$Query$Districts$Regions()..name = json['name'] as int?;
}

Map<String, dynamic> _$Districts$Query$Districts$RegionsToJson(
        Districts$Query$Districts$Regions instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

Districts$Query$Districts _$Districts$Query$DistrictsFromJson(
    Map<String, dynamic> json) {
  return Districts$Query$Districts()
    ..id = json['id'] as int
    ..nameEn = json['name_en'] as String?
    ..nameMn = json['name_mn'] as String?
    ..regions = (json['regions'] as List<dynamic>?)
        ?.map((e) => Districts$Query$Districts$Regions.fromJson(
            e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$Districts$Query$DistrictsToJson(
        Districts$Query$Districts instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_mn': instance.nameMn,
      'regions': instance.regions?.map((e) => e.toJson()).toList(),
    };

Districts$Query _$Districts$QueryFromJson(Map<String, dynamic> json) {
  return Districts$Query()
    ..districts = (json['districts'] as List<dynamic>?)
        ?.map((e) =>
            Districts$Query$Districts.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$Districts$QueryToJson(Districts$Query instance) =>
    <String, dynamic>{
      'districts': instance.districts?.map((e) => e.toJson()).toList(),
    };
