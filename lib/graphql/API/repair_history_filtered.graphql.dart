// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'repair_history_filtered.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class RepairHistoryFiltered$Query$Paginate$DsRequestConflicts
    extends JsonSerializable with EquatableMixin {
  RepairHistoryFiltered$Query$Paginate$DsRequestConflicts();

  factory RepairHistoryFiltered$Query$Paginate$DsRequestConflicts.fromJson(
          Map<String, dynamic> json) =>
      _$RepairHistoryFiltered$Query$Paginate$DsRequestConflictsFromJson(json);

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
      _$RepairHistoryFiltered$Query$Paginate$DsRequestConflictsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RepairHistoryFiltered$Query$Paginate extends JsonSerializable
    with EquatableMixin {
  RepairHistoryFiltered$Query$Paginate();

  factory RepairHistoryFiltered$Query$Paginate.fromJson(
          Map<String, dynamic> json) =>
      _$RepairHistoryFiltered$Query$PaginateFromJson(json);

  late int total;

  @JsonKey(name: 'last_page')
  late int lastPage;

  @JsonKey(name: 'ds_request_conflicts')
  List<RepairHistoryFiltered$Query$Paginate$DsRequestConflicts>?
      dsRequestConflicts;

  @override
  List<Object?> get props => [total, lastPage, dsRequestConflicts];
  @override
  Map<String, dynamic> toJson() =>
      _$RepairHistoryFiltered$Query$PaginateToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RepairHistoryFiltered$Query extends JsonSerializable with EquatableMixin {
  RepairHistoryFiltered$Query();

  factory RepairHistoryFiltered$Query.fromJson(Map<String, dynamic> json) =>
      _$RepairHistoryFiltered$QueryFromJson(json);

  late RepairHistoryFiltered$Query$Paginate paginate;

  @override
  List<Object?> get props => [paginate];
  @override
  Map<String, dynamic> toJson() => _$RepairHistoryFiltered$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RepairHistoryFilteredArguments extends JsonSerializable
    with EquatableMixin {
  RepairHistoryFilteredArguments(
      {required this.fixer_id,
      required this.status_id,
      required this.page,
      required this.size});

  @override
  factory RepairHistoryFilteredArguments.fromJson(Map<String, dynamic> json) =>
      _$RepairHistoryFilteredArgumentsFromJson(json);

  late String fixer_id;

  late String status_id;

  late int page;

  late int size;

  @override
  List<Object?> get props => [fixer_id, status_id, page, size];
  @override
  Map<String, dynamic> toJson() => _$RepairHistoryFilteredArgumentsToJson(this);
}

final REPAIR_HISTORY_FILTERED_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'repair_history_filtered'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'fixer_id')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'status_id')),
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
                          value:
                              VariableNode(name: NameNode(value: 'status_id')))
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

class RepairHistoryFilteredQuery extends GraphQLQuery<
    RepairHistoryFiltered$Query, RepairHistoryFilteredArguments> {
  RepairHistoryFilteredQuery({required this.variables});

  @override
  final DocumentNode document = REPAIR_HISTORY_FILTERED_QUERY_DOCUMENT;

  @override
  final String operationName = 'repair_history_filtered';

  @override
  final RepairHistoryFilteredArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  RepairHistoryFiltered$Query parse(Map<String, dynamic> json) =>
      RepairHistoryFiltered$Query.fromJson(json);
}
