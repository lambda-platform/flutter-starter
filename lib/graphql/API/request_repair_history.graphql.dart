// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'request_repair_history.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class RequestRepairHistory$Query$Paginate$DsRequestConflicts
    extends JsonSerializable with EquatableMixin {
  RequestRepairHistory$Query$Paginate$DsRequestConflicts();

  factory RequestRepairHistory$Query$Paginate$DsRequestConflicts.fromJson(
          Map<String, dynamic> json) =>
      _$RequestRepairHistory$Query$Paginate$DsRequestConflictsFromJson(json);

  int? id;

  String? name;

  @JsonKey(name: 'fixer_id')
  int? fixerId;

  @JsonKey(name: 'fixer_description')
  String? fixerDescription;

  @JsonKey(name: 'fixer_image')
  String? fixerImage;

  @JsonKey(name: 'ended_at')
  DateTime? endedAt;

  @JsonKey(name: 'status_id')
  int? statusId;

  @JsonKey(name: 'status_name')
  String? statusName;

  @override
  List<Object?> get props => [
        id,
        name,
        fixerId,
        fixerDescription,
        fixerImage,
        endedAt,
        statusId,
        statusName
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$RequestRepairHistory$Query$Paginate$DsRequestConflictsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RequestRepairHistory$Query$Paginate extends JsonSerializable
    with EquatableMixin {
  RequestRepairHistory$Query$Paginate();

  factory RequestRepairHistory$Query$Paginate.fromJson(
          Map<String, dynamic> json) =>
      _$RequestRepairHistory$Query$PaginateFromJson(json);

  late int total;

  @JsonKey(name: 'last_page')
  late int lastPage;

  @JsonKey(name: 'ds_request_conflicts')
  List<RequestRepairHistory$Query$Paginate$DsRequestConflicts>?
      dsRequestConflicts;

  @override
  List<Object?> get props => [total, lastPage, dsRequestConflicts];
  @override
  Map<String, dynamic> toJson() =>
      _$RequestRepairHistory$Query$PaginateToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RequestRepairHistory$Query extends JsonSerializable with EquatableMixin {
  RequestRepairHistory$Query();

  factory RequestRepairHistory$Query.fromJson(Map<String, dynamic> json) =>
      _$RequestRepairHistory$QueryFromJson(json);

  late RequestRepairHistory$Query$Paginate paginate;

  @override
  List<Object?> get props => [paginate];
  @override
  Map<String, dynamic> toJson() => _$RequestRepairHistory$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RequestRepairHistoryArguments extends JsonSerializable
    with EquatableMixin {
  RequestRepairHistoryArguments(
      {required this.fixer_id, required this.page, required this.size});

  @override
  factory RequestRepairHistoryArguments.fromJson(Map<String, dynamic> json) =>
      _$RequestRepairHistoryArgumentsFromJson(json);

  late String fixer_id;

  late int page;

  late int size;

  @override
  List<Object?> get props => [fixer_id, page, size];
  @override
  Map<String, dynamic> toJson() => _$RequestRepairHistoryArgumentsToJson(this);
}

final REQUEST_REPAIR_HISTORY_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'request_repair_history'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'fixer_id')),
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
                          value: StringValueNode(value: 'id', isBlock: false)),
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
                              value: 'status_id', isBlock: false)),
                      ObjectFieldNode(
                          name: NameNode(value: 'condition'),
                          value:
                              EnumValueNode(name: NameNode(value: 'whereIn'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'value'),
                          value: StringValueNode(value: '3, 4', isBlock: false))
                    ]),
                    ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'column'),
                          value: StringValueNode(
                              value: 'fixer_id', isBlock: false)),
                      ObjectFieldNode(
                          name: NameNode(value: 'condition'),
                          value:
                              EnumValueNode(name: NameNode(value: 'equals'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'value'),
                          value:
                              VariableNode(name: NameNode(value: 'fixer_id')))
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
                  name: NameNode(value: 'ds_request_conflicts'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'fixer_id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'fixer_description'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'fixer_image'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'ended_at'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'status_id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'status_name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class RequestRepairHistoryQuery extends GraphQLQuery<RequestRepairHistory$Query,
    RequestRepairHistoryArguments> {
  RequestRepairHistoryQuery({required this.variables});

  @override
  final DocumentNode document = REQUEST_REPAIR_HISTORY_QUERY_DOCUMENT;

  @override
  final String operationName = 'request_repair_history';

  @override
  final RequestRepairHistoryArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  RequestRepairHistory$Query parse(Map<String, dynamic> json) =>
      RequestRepairHistory$Query.fromJson(json);
}
