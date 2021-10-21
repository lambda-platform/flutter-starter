// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'ds_request_filtered.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class DsRequestFiltered$Query$Paginate$DsRequestConflicts
    extends JsonSerializable with EquatableMixin {
  DsRequestFiltered$Query$Paginate$DsRequestConflicts();

  factory DsRequestFiltered$Query$Paginate$DsRequestConflicts.fromJson(
          Map<String, dynamic> json) =>
      _$DsRequestFiltered$Query$Paginate$DsRequestConflictsFromJson(json);

  int? id;

  String? name;

  String? description;

  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  @JsonKey(name: 'status_name')
  String? statusName;

  @JsonKey(name: 'name_org')
  String? nameOrg;

  @JsonKey(name: 'status_id')
  int? statusId;

  @JsonKey(name: 'type_name')
  String? typeName;

  @JsonKey(name: 'type_id')
  int? typeId;

  @JsonKey(name: 'fixer_id')
  int? fixerId;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        createdAt,
        statusName,
        nameOrg,
        statusId,
        typeName,
        typeId,
        fixerId
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$DsRequestFiltered$Query$Paginate$DsRequestConflictsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DsRequestFiltered$Query$Paginate extends JsonSerializable
    with EquatableMixin {
  DsRequestFiltered$Query$Paginate();

  factory DsRequestFiltered$Query$Paginate.fromJson(
          Map<String, dynamic> json) =>
      _$DsRequestFiltered$Query$PaginateFromJson(json);

  late int total;

  @JsonKey(name: 'last_page')
  late int lastPage;

  @JsonKey(name: 'ds_request_conflicts')
  List<DsRequestFiltered$Query$Paginate$DsRequestConflicts>? dsRequestConflicts;

  @override
  List<Object?> get props => [total, lastPage, dsRequestConflicts];
  @override
  Map<String, dynamic> toJson() =>
      _$DsRequestFiltered$Query$PaginateToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DsRequestFiltered$Query extends JsonSerializable with EquatableMixin {
  DsRequestFiltered$Query();

  factory DsRequestFiltered$Query.fromJson(Map<String, dynamic> json) =>
      _$DsRequestFiltered$QueryFromJson(json);

  late DsRequestFiltered$Query$Paginate paginate;

  @override
  List<Object?> get props => [paginate];
  @override
  Map<String, dynamic> toJson() => _$DsRequestFiltered$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DsRequestFilteredArguments extends JsonSerializable with EquatableMixin {
  DsRequestFilteredArguments(
      {required this.fixer_id,
      required this.type_id,
      required this.page,
      required this.size});

  @override
  factory DsRequestFilteredArguments.fromJson(Map<String, dynamic> json) =>
      _$DsRequestFilteredArgumentsFromJson(json);

  late String fixer_id;

  late String type_id;

  late int page;

  late int size;

  @override
  List<Object?> get props => [fixer_id, type_id, page, size];
  @override
  Map<String, dynamic> toJson() => _$DsRequestFilteredArgumentsToJson(this);
}

final DS_REQUEST_FILTERED_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'ds_request_filtered'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'fixer_id')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'type_id')),
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
                              value: 'fixer_id', isBlock: false)),
                      ObjectFieldNode(
                          name: NameNode(value: 'condition'),
                          value:
                              EnumValueNode(name: NameNode(value: 'equals'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'value'),
                          value:
                              VariableNode(name: NameNode(value: 'fixer_id')))
                    ]),
                    ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'column'),
                          value: StringValueNode(
                              value: 'type_id', isBlock: false)),
                      ObjectFieldNode(
                          name: NameNode(value: 'condition'),
                          value:
                              EnumValueNode(name: NameNode(value: 'equals'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'value'),
                          value: VariableNode(name: NameNode(value: 'type_id')))
                    ]),
                    ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'column'),
                          value: StringValueNode(
                              value: 'status_id', isBlock: false)),
                      ObjectFieldNode(
                          name: NameNode(value: 'condition'),
                          value:
                              EnumValueNode(name: NameNode(value: 'equals'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'value'),
                          value: StringValueNode(value: '2', isBlock: false))
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
                        name: NameNode(value: 'description'),
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
                        name: NameNode(value: 'status_name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'name_org'),
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
                        name: NameNode(value: 'type_name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'type_id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'fixer_id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class DsRequestFilteredQuery
    extends GraphQLQuery<DsRequestFiltered$Query, DsRequestFilteredArguments> {
  DsRequestFilteredQuery({required this.variables});

  @override
  final DocumentNode document = DS_REQUEST_FILTERED_QUERY_DOCUMENT;

  @override
  final String operationName = 'ds_request_filtered';

  @override
  final DsRequestFilteredArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  DsRequestFiltered$Query parse(Map<String, dynamic> json) =>
      DsRequestFiltered$Query.fromJson(json);
}
