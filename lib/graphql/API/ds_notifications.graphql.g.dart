// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'ds_notifications.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DsNotifications$Query$Paginate$DsNotifcation
    _$DsNotifications$Query$Paginate$DsNotifcationFromJson(
        Map<String, dynamic> json) {
  return DsNotifications$Query$Paginate$DsNotifcation()
    ..notifId = json['notif_id'] as int?
    ..title = json['title'] as String?
    ..body = json['body'] as String?
    ..seen = json['seen'] as int?
    ..seenTime = json['seen_time'] == null
        ? null
        : DateTime.parse(json['seen_time'] as String)
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String);
}

Map<String, dynamic> _$DsNotifications$Query$Paginate$DsNotifcationToJson(
        DsNotifications$Query$Paginate$DsNotifcation instance) =>
    <String, dynamic>{
      'notif_id': instance.notifId,
      'title': instance.title,
      'body': instance.body,
      'seen': instance.seen,
      'seen_time': instance.seenTime?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };

DsNotifications$Query$Paginate _$DsNotifications$Query$PaginateFromJson(
    Map<String, dynamic> json) {
  return DsNotifications$Query$Paginate()
    ..total = json['total'] as int
    ..lastPage = json['last_page'] as int
    ..dsNotifcation = (json['ds_notifcation'] as List<dynamic>?)
        ?.map((e) => DsNotifications$Query$Paginate$DsNotifcation.fromJson(
            e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$DsNotifications$Query$PaginateToJson(
        DsNotifications$Query$Paginate instance) =>
    <String, dynamic>{
      'total': instance.total,
      'last_page': instance.lastPage,
      'ds_notifcation': instance.dsNotifcation?.map((e) => e.toJson()).toList(),
    };

DsNotifications$Query _$DsNotifications$QueryFromJson(
    Map<String, dynamic> json) {
  return DsNotifications$Query()
    ..paginate = DsNotifications$Query$Paginate.fromJson(
        json['paginate'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DsNotifications$QueryToJson(
        DsNotifications$Query instance) =>
    <String, dynamic>{
      'paginate': instance.paginate.toJson(),
    };

DsNotificationsArguments _$DsNotificationsArgumentsFromJson(
    Map<String, dynamic> json) {
  return DsNotificationsArguments(
    userId: json['userId'] as String,
    page: json['page'] as int,
    size: json['size'] as int,
  );
}

Map<String, dynamic> _$DsNotificationsArgumentsToJson(
        DsNotificationsArguments instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'page': instance.page,
      'size': instance.size,
    };
