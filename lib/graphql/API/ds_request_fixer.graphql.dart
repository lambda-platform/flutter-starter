// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'ds_request_fixer.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class DsRequestFixer$Query$Paginate$DsRequestConflicts extends JsonSerializable
    with EquatableMixin {
  DsRequestFixer$Query$Paginate$DsRequestConflicts();

  factory DsRequestFixer$Query$Paginate$DsRequestConflicts.fromJson(
          Map<String, dynamic> json) =>
      _$DsRequestFixer$Query$Paginate$DsRequestConflictsFromJson(json);

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
      _$DsRequestFixer$Query$Paginate$DsRequestConflictsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DsRequestFixer$Query$Paginate extends JsonSerializable
    with EquatableMixin {
  DsRequestFixer$Query$Paginate();

  factory DsRequestFixer$Query$Paginate.fromJson(Map<String, dynamic> json) =>
      _$DsRequestFixer$Query$PaginateFromJson(json);

  late int total;

  @JsonKey(name: 'last_page')
  late int lastPage;

  @JsonKey(name: 'ds_request_conflicts')
  List<DsRequestFixer$Query$Paginate$DsRequestConflicts>? dsRequestConflicts;

  @override
  List<Object?> get props => [total, lastPage, dsRequestConflicts];
  @override
  Map<String, dynamic> toJson() => _$DsRequestFixer$Query$PaginateToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DsRequestFixer$Query extends JsonSerializable with EquatableMixin {
  DsRequestFixer$Query();

  factory DsRequestFixer$Query.fromJson(Map<String, dynamic> json) =>
      _$DsRequestFixer$QueryFromJson(json);

  late DsRequestFixer$Query$Paginate paginate;

  @override
  List<Object?> get props => [paginate];
  @override
  Map<String, dynamic> toJson() => _$DsRequestFixer$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DsRequestFixerArguments extends JsonSerializable with EquatableMixin {
  DsRequestFixerArguments(
      {required this.fixer_id, required this.page, required this.size});

  @override
  factory DsRequestFixerArguments.fromJson(Map<String, dynamic> json) =>
      _$DsRequestFixerArgumentsFromJson(json);

  late String fixer_id;

  late int page;

  late int size;

  @override
  List<Object?> get props => [fixer_id, page, size];
  @override
  Map<String, dynamic> toJson() => _$DsRequestFixerArgumentsToJson(this);
}

final DS_REQUEST_FIXER_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'ds_request_fixer'),
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

class DsRequestFixerQuery
    extends GraphQLQuery<DsRequestFixer$Query, DsRequestFixerArguments> {
  DsRequestFixerQuery({required this.variables});

  @override
  final DocumentNode document = DS_REQUEST_FIXER_QUERY_DOCUMENT;

  @override
  final String operationName = 'ds_request_fixer';

  @override
  final DsRequestFixerArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  DsRequestFixer$Query parse(Map<String, dynamic> json) =>
      DsRequestFixer$Query.fromJson(json);
}
