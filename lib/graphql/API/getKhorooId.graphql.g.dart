// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'getKhorooId.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetKhorooId$Query$Regions _$GetKhorooId$Query$RegionsFromJson(
    Map<String, dynamic> json) {
  return GetKhorooId$Query$Regions()
    ..districtId = json['district_id'] as int?
    ..id = json['id'] as int
    ..name = json['name'] as int?;
}

Map<String, dynamic> _$GetKhorooId$Query$RegionsToJson(
        GetKhorooId$Query$Regions instance) =>
    <String, dynamic>{
      'district_id': instance.districtId,
      'id': instance.id,
      'name': instance.name,
    };

GetKhorooId$Query _$GetKhorooId$QueryFromJson(Map<String, dynamic> json) {
  return GetKhorooId$Query()
    ..regions = (json['regions'] as List<dynamic>?)
        ?.map((e) =>
            GetKhorooId$Query$Regions.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$GetKhorooId$QueryToJson(GetKhorooId$Query instance) =>
    <String, dynamic>{
      'regions': instance.regions?.map((e) => e.toJson()).toList(),
    };

GetKhorooIdArguments _$GetKhorooIdArgumentsFromJson(Map<String, dynamic> json) {
  return GetKhorooIdArguments(
    districtID: json['districtID'] as String,
    khorooName: json['khorooName'] as String,
  );
}

Map<String, dynamic> _$GetKhorooIdArgumentsToJson(
        GetKhorooIdArguments instance) =>
    <String, dynamic>{
      'districtID': instance.districtID,
      'khorooName': instance.khorooName,
    };
