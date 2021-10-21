// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'qrRepairHistory.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class QrRepairHistory$Query$DsRequestConflicts extends JsonSerializable
    with EquatableMixin {
  QrRepairHistory$Query$DsRequestConflicts();

  factory QrRepairHistory$Query$DsRequestConflicts.fromJson(
          Map<String, dynamic> json) =>
      _$QrRepairHistory$Query$DsRequestConflictsFromJson(json);

  int? id;

  @JsonKey(name: 'ended_at')
  DateTime? endedAt;

  @JsonKey(name: 'fixer_image')
  String? fixerImage;

  @JsonKey(name: 'fixer_last_name')
  String? fixerLastName;

  @JsonKey(name: 'fixer_first_name')
  String? fixerFirstName;

  @JsonKey(name: 'fixer_description')
  String? fixerDescription;

  @JsonKey(name: 'name_org')
  String? nameOrg;

  @override
  List<Object?> get props => [
        id,
        endedAt,
        fixerImage,
        fixerLastName,
        fixerFirstName,
        fixerDescription,
        nameOrg
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$QrRepairHistory$Query$DsRequestConflictsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class QrRepairHistory$Query extends JsonSerializable with EquatableMixin {
  QrRepairHistory$Query();

  factory QrRepairHistory$Query.fromJson(Map<String, dynamic> json) =>
      _$QrRepairHistory$QueryFromJson(json);

  @JsonKey(name: 'ds_request_conflicts')
  List<QrRepairHistory$Query$DsRequestConflicts>? dsRequestConflicts;

  @override
  List<Object?> get props => [dsRequestConflicts];
  @override
  Map<String, dynamic> toJson() => _$QrRepairHistory$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class QrRepairHistoryArguments extends JsonSerializable with EquatableMixin {
  QrRepairHistoryArguments({required this.item_id});

  @override
  factory QrRepairHistoryArguments.fromJson(Map<String, dynamic> json) =>
      _$QrRepairHistoryArgumentsFromJson(json);

  late String item_id;

  @override
  List<Object?> get props => [item_id];
  @override
  Map<String, dynamic> toJson() => _$QrRepairHistoryArgumentsToJson(this);
}

final QR_REPAIR_HISTORY_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'qrRepairHistory'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'item_id')),
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
                  value: ListValueNode(values: [
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
                          value: StringValueNode(value: '3', isBlock: false))
                    ]),
                    ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'column'),
                          value: StringValueNode(
                              value: 'requested_item_id', isBlock: false)),
                      ObjectFieldNode(
                          name: NameNode(value: 'condition'),
                          value:
                              EnumValueNode(name: NameNode(value: 'equals'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'value'),
                          value: VariableNode(name: NameNode(value: 'item_id')))
                    ])
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
                  name: NameNode(value: 'ended_at'),
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
                  name: NameNode(value: 'fixer_last_name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'fixer_first_name'),
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
                  name: NameNode(value: 'name_org'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class QrRepairHistoryQuery
    extends GraphQLQuery<QrRepairHistory$Query, QrRepairHistoryArguments> {
  QrRepairHistoryQuery({required this.variables});

  @override
  final DocumentNode document = QR_REPAIR_HISTORY_QUERY_DOCUMENT;

  @override
  final String operationName = 'qrRepairHistory';

  @override
  final QrRepairHistoryArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  QrRepairHistory$Query parse(Map<String, dynamic> json) =>
      QrRepairHistory$Query.fromJson(json);
}
