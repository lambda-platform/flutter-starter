// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'ds_request_conflicts.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class DsRequestConflicts$Query$Paginate$DsRequestConflicts
    extends JsonSerializable with EquatableMixin {
  DsRequestConflicts$Query$Paginate$DsRequestConflicts();

  factory DsRequestConflicts$Query$Paginate$DsRequestConflicts.fromJson(
          Map<String, dynamic> json) =>
      _$DsRequestConflicts$Query$Paginate$DsRequestConflictsFromJson(json);

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
      _$DsRequestConflicts$Query$Paginate$DsRequestConflictsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DsRequestConflicts$Query$Paginate extends JsonSerializable
    with EquatableMixin {
  DsRequestConflicts$Query$Paginate();

  factory DsRequestConflicts$Query$Paginate.fromJson(
          Map<String, dynamic> json) =>
      _$DsRequestConflicts$Query$PaginateFromJson(json);

  late int total;

  @JsonKey(name: 'last_page')
  late int lastPage;

  @JsonKey(name: 'ds_request_conflicts')
  List<DsRequestConflicts$Query$Paginate$DsRequestConflicts>?
      dsRequestConflicts;

  @override
  List<Object?> get props => [total, lastPage, dsRequestConflicts];
  @override
  Map<String, dynamic> toJson() =>
      _$DsRequestConflicts$Query$PaginateToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DsRequestConflicts$Query extends JsonSerializable with EquatableMixin {
  DsRequestConflicts$Query();

  factory DsRequestConflicts$Query.fromJson(Map<String, dynamic> json) =>
      _$DsRequestConflicts$QueryFromJson(json);

  late DsRequestConflicts$Query$Paginate paginate;

  @override
  List<Object?> get props => [paginate];
  @override
  Map<String, dynamic> toJson() => _$DsRequestConflicts$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DsRequestConflictsArguments extends JsonSerializable with EquatableMixin {
  DsRequestConflictsArguments(
      {required this.requested_user_id,
      required this.page,
      required this.size});

  @override
  factory DsRequestConflictsArguments.fromJson(Map<String, dynamic> json) =>
      _$DsRequestConflictsArgumentsFromJson(json);

  late String requested_user_id;

  late int page;

  late int size;

  @override
  List<Object?> get props => [requested_user_id, page, size];
  @override
  Map<String, dynamic> toJson() => _$DsRequestConflictsArgumentsToJson(this);
}

final DS_REQUEST_CONFLICTS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'ds_request_conflicts'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'requested_user_id')),
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
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'column'),
                        value: StringValueNode(
                            value: 'requested_user_id', isBlock: false)),
                    ObjectFieldNode(
                        name: NameNode(value: 'condition'),
                        value: EnumValueNode(name: NameNode(value: 'equals'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'value'),
                        value: VariableNode(
                            name: NameNode(value: 'requested_user_id')))
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

class DsRequestConflictsQuery extends GraphQLQuery<DsRequestConflicts$Query,
    DsRequestConflictsArguments> {
  DsRequestConflictsQuery({required this.variables});

  @override
  final DocumentNode document = DS_REQUEST_CONFLICTS_QUERY_DOCUMENT;

  @override
  final String operationName = 'ds_request_conflicts';

  @override
  final DsRequestConflictsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  DsRequestConflicts$Query parse(Map<String, dynamic> json) =>
      DsRequestConflicts$Query.fromJson(json);
}
