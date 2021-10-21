// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'ds_notificaiton_detail.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class DsNotificationDetail$Query$DsNotifcation extends JsonSerializable
    with EquatableMixin {
  DsNotificationDetail$Query$DsNotifcation();

  factory DsNotificationDetail$Query$DsNotifcation.fromJson(
          Map<String, dynamic> json) =>
      _$DsNotificationDetail$Query$DsNotifcationFromJson(json);

  @JsonKey(name: 'notif_id')
  int? notifId;

  String? body;

  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  String? link;

  int? seen;

  @JsonKey(name: 'seen_time')
  DateTime? seenTime;

  int? sender;

  String? title;

  @override
  List<Object?> get props =>
      [notifId, body, createdAt, link, seen, seenTime, sender, title];
  @override
  Map<String, dynamic> toJson() =>
      _$DsNotificationDetail$Query$DsNotifcationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DsNotificationDetail$Query extends JsonSerializable with EquatableMixin {
  DsNotificationDetail$Query();

  factory DsNotificationDetail$Query.fromJson(Map<String, dynamic> json) =>
      _$DsNotificationDetail$QueryFromJson(json);

  @JsonKey(name: 'ds_notifcation')
  List<DsNotificationDetail$Query$DsNotifcation>? dsNotifcation;

  @override
  List<Object?> get props => [dsNotifcation];
  @override
  Map<String, dynamic> toJson() => _$DsNotificationDetail$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DsNotificationDetailArguments extends JsonSerializable
    with EquatableMixin {
  DsNotificationDetailArguments({required this.not_id});

  @override
  factory DsNotificationDetailArguments.fromJson(Map<String, dynamic> json) =>
      _$DsNotificationDetailArgumentsFromJson(json);

  late String not_id;

  @override
  List<Object?> get props => [not_id];
  @override
  Map<String, dynamic> toJson() => _$DsNotificationDetailArgumentsToJson(this);
}

final DS_NOTIFICATION_DETAIL_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'ds_notification_detail'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'not_id')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'ds_notifcation'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'filters'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'column'),
                        value:
                            StringValueNode(value: 'notif_id', isBlock: false)),
                    ObjectFieldNode(
                        name: NameNode(value: 'condition'),
                        value: EnumValueNode(name: NameNode(value: 'equals'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'value'),
                        value: VariableNode(name: NameNode(value: 'not_id')))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'notif_id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'body'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'created_at'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'link'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'seen'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'seen_time'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'sender'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'title'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class DsNotificationDetailQuery extends GraphQLQuery<DsNotificationDetail$Query,
    DsNotificationDetailArguments> {
  DsNotificationDetailQuery({required this.variables});

  @override
  final DocumentNode document = DS_NOTIFICATION_DETAIL_QUERY_DOCUMENT;

  @override
  final String operationName = 'ds_notification_detail';

  @override
  final DsNotificationDetailArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  DsNotificationDetail$Query parse(Map<String, dynamic> json) =>
      DsNotificationDetail$Query.fromJson(json);
}
