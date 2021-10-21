// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'about_repair.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class RepairHistory$Query$DsRequestConflicts extends JsonSerializable
    with EquatableMixin {
  RepairHistory$Query$DsRequestConflicts();

  factory RepairHistory$Query$DsRequestConflicts.fromJson(
          Map<String, dynamic> json) =>
      _$RepairHistory$Query$DsRequestConflictsFromJson(json);

  int? id;

  @JsonKey(name: 'fixer_id')
  int? fixerId;

  @JsonKey(name: 'fixer_description')
  String? fixerDescription;

  @JsonKey(name: 'status_id')
  int? statusId;

  @JsonKey(name: 'status_name')
  String? statusName;

  @override
  List<Object?> get props =>
      [id, fixerId, fixerDescription, statusId, statusName];
  @override
  Map<String, dynamic> toJson() =>
      _$RepairHistory$Query$DsRequestConflictsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RepairHistory$Query extends JsonSerializable with EquatableMixin {
  RepairHistory$Query();

  factory RepairHistory$Query.fromJson(Map<String, dynamic> json) =>
      _$RepairHistory$QueryFromJson(json);

  @JsonKey(name: 'ds_request_conflicts')
  List<RepairHistory$Query$DsRequestConflicts>? dsRequestConflicts;

  @override
  List<Object?> get props => [dsRequestConflicts];
  @override
  Map<String, dynamic> toJson() => _$RepairHistory$QueryToJson(this);
}

final REPAIR_HISTORY_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'repair_history'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'ds_request_conflicts'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'filters'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'column'),
                        value: StringValueNode(
                            value: 'status_id', isBlock: false)),
                    ObjectFieldNode(
                        name: NameNode(value: 'condition'),
                        value: EnumValueNode(name: NameNode(value: 'equals'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'value'),
                        value: StringValueNode(value: '3', isBlock: false))
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
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
]);

class RepairHistoryQuery
    extends GraphQLQuery<RepairHistory$Query, JsonSerializable> {
  RepairHistoryQuery();

  @override
  final DocumentNode document = REPAIR_HISTORY_QUERY_DOCUMENT;

  @override
  final String operationName = 'repair_history';

  @override
  List<Object?> get props => [document, operationName];
  @override
  RepairHistory$Query parse(Map<String, dynamic> json) =>
      RepairHistory$Query.fromJson(json);
}
