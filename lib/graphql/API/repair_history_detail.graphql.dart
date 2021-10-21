// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'repair_history_detail.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class RepairHistoryDetail$Query$DsRequestConflicts extends JsonSerializable
    with EquatableMixin {
  RepairHistoryDetail$Query$DsRequestConflicts();

  factory RepairHistoryDetail$Query$DsRequestConflicts.fromJson(
          Map<String, dynamic> json) =>
      _$RepairHistoryDetail$Query$DsRequestConflictsFromJson(json);

  int? id;

  String? name;

  @JsonKey(name: 'fixer_description')
  String? fixerDescription;

  @JsonKey(name: 'fixer_id')
  int? fixerId;

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
        fixerDescription,
        fixerId,
        fixerImage,
        endedAt,
        statusId,
        statusName
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$RepairHistoryDetail$Query$DsRequestConflictsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RepairHistoryDetail$Query extends JsonSerializable with EquatableMixin {
  RepairHistoryDetail$Query();

  factory RepairHistoryDetail$Query.fromJson(Map<String, dynamic> json) =>
      _$RepairHistoryDetail$QueryFromJson(json);

  @JsonKey(name: 'ds_request_conflicts')
  List<RepairHistoryDetail$Query$DsRequestConflicts>? dsRequestConflicts;

  @override
  List<Object?> get props => [dsRequestConflicts];
  @override
  Map<String, dynamic> toJson() => _$RepairHistoryDetail$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RepairHistoryDetailArguments extends JsonSerializable
    with EquatableMixin {
  RepairHistoryDetailArguments({required this.requestID});

  @override
  factory RepairHistoryDetailArguments.fromJson(Map<String, dynamic> json) =>
      _$RepairHistoryDetailArgumentsFromJson(json);

  late String requestID;

  @override
  List<Object?> get props => [requestID];
  @override
  Map<String, dynamic> toJson() => _$RepairHistoryDetailArgumentsToJson(this);
}

final REPAIR_HISTORY_DETAIL_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'repair_history_detail'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'requestID')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
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
                        value: StringValueNode(value: 'id', isBlock: false)),
                    ObjectFieldNode(
                        name: NameNode(value: 'condition'),
                        value: EnumValueNode(name: NameNode(value: 'equals'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'value'),
                        value: VariableNode(name: NameNode(value: 'requestID')))
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
                  name: NameNode(value: 'name'),
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
                  name: NameNode(value: 'fixer_id'),
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
]);

class RepairHistoryDetailQuery extends GraphQLQuery<RepairHistoryDetail$Query,
    RepairHistoryDetailArguments> {
  RepairHistoryDetailQuery({required this.variables});

  @override
  final DocumentNode document = REPAIR_HISTORY_DETAIL_QUERY_DOCUMENT;

  @override
  final String operationName = 'repair_history_detail';

  @override
  final RepairHistoryDetailArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  RepairHistoryDetail$Query parse(Map<String, dynamic> json) =>
      RepairHistoryDetail$Query.fromJson(json);
}
