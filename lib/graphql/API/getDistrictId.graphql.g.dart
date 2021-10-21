// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'getDistrictId.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDistrictId$Query$Districts _$GetDistrictId$Query$DistrictsFromJson(
    Map<String, dynamic> json) {
  return GetDistrictId$Query$Districts()
    ..id = json['id'] as int
    ..nameMn = json['name_mn'] as String?;
}

Map<String, dynamic> _$GetDistrictId$Query$DistrictsToJson(
        GetDistrictId$Query$Districts instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_mn': instance.nameMn,
    };

GetDistrictId$Query _$GetDistrictId$QueryFromJson(Map<String, dynamic> json) {
  return GetDistrictId$Query()
    ..districts = (json['districts'] as List<dynamic>?)
        ?.map((e) =>
            GetDistrictId$Query$Districts.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$GetDistrictId$QueryToJson(
        GetDistrictId$Query instance) =>
    <String, dynamic>{
      'districts': instance.districts?.map((e) => e.toJson()).toList(),
    };

GetDistrictIdArguments _$GetDistrictIdArgumentsFromJson(
    Map<String, dynamic> json) {
  return GetDistrictIdArguments(
    districtName: json['districtName'] as String,
  );
}

Map<String, dynamic> _$GetDistrictIdArgumentsToJson(
        GetDistrictIdArguments instance) =>
    <String, dynamic>{
      'districtName': instance.districtName,
    };
