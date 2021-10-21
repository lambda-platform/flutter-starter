// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'ds_notifications.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class DsNotifications$Query$Paginate$DsNotifcation extends JsonSerializable
    with EquatableMixin {
  DsNotifications$Query$Paginate$DsNotifcation();

  factory DsNotifications$Query$Paginate$DsNotifcation.fromJson(
          Map<String, dynamic> json) =>
      _$DsNotifications$Query$Paginate$DsNotifcationFromJson(json);

  @JsonKey(name: 'notif_id')
  int? notifId;

  String? title;

  String? body;

  int? seen;

  @JsonKey(name: 'seen_time')
  DateTime? seenTime;

  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  @override
  List<Object?> get props => [notifId, title, body, seen, seenTime, createdAt];
  @override
  Map<String, dynamic> toJson() =>
      _$DsNotifications$Query$Paginate$DsNotifcationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DsNotifications$Query$Paginate extends JsonSerializable
    with EquatableMixin {
  DsNotifications$Query$Paginate();

  factory DsNotifications$Query$Paginate.fromJson(Map<String, dynamic> json) =>
      _$DsNotifications$Query$PaginateFromJson(json);

  late int total;

  @JsonKey(name: 'last_page')
  late int lastPage;

  @JsonKey(name: 'ds_notifcation')
  List<DsNotifications$Query$Paginate$DsNotifcation>? dsNotifcation;

  @override
  List<Object?> get props => [total, lastPage, dsNotifcation];
  @override
  Map<String, dynamic> toJson() => _$DsNotifications$Query$PaginateToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DsNotifications$Query extends JsonSerializable with EquatableMixin {
  DsNotifications$Query();

  factory DsNotifications$Query.fromJson(Map<String, dynamic> json) =>
      _$DsNotifications$QueryFromJson(json);

  late DsNotifications$Query$Paginate paginate;

  @override
  List<Object?> get props => [paginate];
  @override
  Map<String, dynamic> toJson() => _$DsNotifications$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DsNotificationsArguments extends JsonSerializable with EquatableMixin {
  DsNotificationsArguments(
      {required this.userId, required this.page, required this.size});

  @override
  factory DsNotificationsArguments.fromJson(Map<String, dynamic> json) =>
      _$DsNotificationsArgumentsFromJson(json);

  late String userId;

  late int page;

  late int size;

  @override
  List<Object?> get props => [userId, page, size];
  @override
  Map<String, dynamic> toJson() => _$DsNotificationsArgumentsToJson(this);
}

final DS_NOTIFICATIONS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'ds_notifications'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'userId')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'page')),
            type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'size')),
            type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'paginate'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'sorts'),
                  value: ListValueNode(values: [
                    ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'column'),
                          value: StringValueNode(
                              value: 'notif_id', isBlock: false)),
                      ObjectFieldNode(
                          name: NameNode(value: 'order'),
                          value: EnumValueNode(name: NameNode(value: 'desc')))
                    ])
                  ])),
              ArgumentNode(
                  name: NameNode(value: 'filters'),
                  value: ListValueNode(values: [
                    ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'column'),
                          value: StringValueNode(
                              value: 'receiver_id', isBlock: false)),
                      ObjectFieldNode(
                          name: NameNode(value: 'condition'),
                          value:
                              EnumValueNode(name: NameNode(value: 'equals'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'value'),
                          value: VariableNode(name: NameNode(value: 'userId')))
                    ])
                  ])),
              ArgumentNode(
                  name: NameNode(value: 'page'),
                  value: VariableNode(name: NameNode(value: 'page'))),
              ArgumentNode(
                  name: NameNode(value: 'size'),
                  value: VariableNode(name: NameNode(value: 'size')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'total'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'last_page'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'ds_notifcation'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'notif_id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'title'),
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
                        name: NameNode(value: 'created_at'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class DsNotificationsQuery
    extends GraphQLQuery<DsNotifications$Query, DsNotificationsArguments> {
  DsNotificationsQuery({required this.variables});

  @override
  final DocumentNode document = DS_NOTIFICATIONS_QUERY_DOCUMENT;

  @override
  final String operationName = 'ds_notifications';

  @override
  final DsNotificationsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  DsNotifications$Query parse(Map<String, dynamic> json) =>
      DsNotifications$Query.fromJson(json);
}
