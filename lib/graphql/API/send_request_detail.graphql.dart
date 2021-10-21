// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'send_request_detail.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class SendRequestDetail$Query$DsRequestConflicts extends JsonSerializable
    with EquatableMixin {
  SendRequestDetail$Query$DsRequestConflicts();

  factory SendRequestDetail$Query$DsRequestConflicts.fromJson(
          Map<String, dynamic> json) =>
      _$SendRequestDetail$Query$DsRequestConflictsFromJson(json);

  int? id;

  String? name;

  String? description;

  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  @JsonKey(name: 'status_id')
  int? statusId;

  @JsonKey(name: 'status_name')
  String? statusName;

  @JsonKey(name: 'fixer_id')
  int? fixerId;

  @JsonKey(name: 'fixer_description')
  String? fixerDescription;

  @JsonKey(name: 'req_image')
  String? reqImage;

  @JsonKey(name: 'fixer_image')
  String? fixerImage;

  @JsonKey(name: 'ended_at')
  DateTime? endedAt;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        createdAt,
        statusId,
        statusName,
        fixerId,
        fixerDescription,
        reqImage,
        fixerImage,
        endedAt
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$SendRequestDetail$Query$DsRequestConflictsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SendRequestDetail$Query extends JsonSerializable with EquatableMixin {
  SendRequestDetail$Query();

  factory SendRequestDetail$Query.fromJson(Map<String, dynamic> json) =>
      _$SendRequestDetail$QueryFromJson(json);

  @JsonKey(name: 'ds_request_conflicts')
  List<SendRequestDetail$Query$DsRequestConflicts>? dsRequestConflicts;

  @override
  List<Object?> get props => [dsRequestConflicts];
  @override
  Map<String, dynamic> toJson() => _$SendRequestDetail$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SendRequestDetailArguments extends JsonSerializable with EquatableMixin {
  SendRequestDetailArguments({required this.requestID});

  @override
  factory SendRequestDetailArguments.fromJson(Map<String, dynamic> json) =>
      _$SendRequestDetailArgumentsFromJson(json);

  late String requestID;

  @override
  List<Object?> get props => [requestID];
  @override
  Map<String, dynamic> toJson() => _$SendRequestDetailArgumentsToJson(this);
}

final SEND_REQUEST_DETAIL_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'send_request_detail'),
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
                  name: NameNode(value: 'req_image'),
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
                  selectionSet: null)
            ]))
      ]))
]);

class SendRequestDetailQuery
    extends GraphQLQuery<SendRequestDetail$Query, SendRequestDetailArguments> {
  SendRequestDetailQuery({required this.variables});

  @override
  final DocumentNode document = SEND_REQUEST_DETAIL_QUERY_DOCUMENT;

  @override
  final String operationName = 'send_request_detail';

  @override
  final SendRequestDetailArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  SendRequestDetail$Query parse(Map<String, dynamic> json) =>
      SendRequestDetail$Query.fromJson(json);
}
