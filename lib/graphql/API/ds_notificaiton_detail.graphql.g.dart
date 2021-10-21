// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'ds_notificaiton_detail.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DsNotificationDetail$Query$DsNotifcation
    _$DsNotificationDetail$Query$DsNotifcationFromJson(
        Map<String, dynamic> json) {
  return DsNotificationDetail$Query$DsNotifcation()
    ..notifId = json['notif_id'] as int?
    ..body = json['body'] as String?
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..link = json['link'] as String?
    ..seen = json['seen'] as int?
    ..seenTime = json['seen_time'] == null
        ? null
        : DateTime.parse(json['seen_time'] as String)
    ..sender = json['sender'] as int?
    ..title = json['title'] as String?;
}

Map<String, dynamic> _$DsNotificationDetail$Query$DsNotifcationToJson(
        DsNotificationDetail$Query$DsNotifcation instance) =>
    <String, dynamic>{
      'notif_id': instance.notifId,
      'body': instance.body,
      'created_at': instance.createdAt?.toIso8601String(),
      'link': instance.link,
      'seen': instance.seen,
      'seen_time': instance.seenTime?.toIso8601String(),
      'sender': instance.sender,
      'title': instance.title,
    };

DsNotificationDetail$Query _$DsNotificationDetail$QueryFromJson(
    Map<String, dynamic> json) {
  return DsNotificationDetail$Query()
    ..dsNotifcation = (json['ds_notifcation'] as List<dynamic>?)
        ?.map((e) => DsNotificationDetail$Query$DsNotifcation.fromJson(
            e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$DsNotificationDetail$QueryToJson(
        DsNotificationDetail$Query instance) =>
    <String, dynamic>{
      'ds_notifcation': instance.dsNotifcation?.map((e) => e.toJson()).toList(),
    };

DsNotificationDetailArguments _$DsNotificationDetailArgumentsFromJson(
    Map<String, dynamic> json) {
  return DsNotificationDetailArguments(
    not_id: json['not_id'] as String,
  );
}

Map<String, dynamic> _$DsNotificationDetailArgumentsToJson(
        DsNotificationDetailArguments instance) =>
    <String, dynamic>{
      'not_id': instance.not_id,
    };
