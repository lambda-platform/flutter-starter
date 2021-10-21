// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'arrived_request_detail.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class ArrivedRequestDetail$Query$DsRequestConflicts extends JsonSerializable
    with EquatableMixin {
  ArrivedRequestDetail$Query$DsRequestConflicts();

  factory ArrivedRequestDetail$Query$DsRequestConflicts.fromJson(
          Map<String, dynamic> json) =>
      _$ArrivedRequestDetail$Query$DsRequestConflictsFromJson(json);

  int? id;

  String? name;

  String? description;

  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  @JsonKey(name: 'fixer_id')
  int? fixerId;

  @JsonKey(name: 'fixer_description')
  String? fixerDescription;

  @JsonKey(name: 'req_image')
  String? reqImage;

  @JsonKey(name: 'fixer_image')
  String? fixerImage;

  @JsonKey(name: 'type_id')
  int? typeId;

  @JsonKey(name: 'type_name')
  String? typeName;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        createdAt,
        fixerId,
        fixerDescription,
        reqImage,
        fixerImage,
        typeId,
        typeName
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$ArrivedRequestDetail$Query$DsRequestConflictsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ArrivedRequestDetail$Query extends JsonSerializable with EquatableMixin {
  ArrivedRequestDetail$Query();

  factory ArrivedRequestDetail$Query.fromJson(Map<String, dynamic> json) =>
      _$ArrivedRequestDetail$QueryFromJson(json);

  @JsonKey(name: 'ds_request_conflicts')
  List<ArrivedRequestDetail$Query$DsRequestConflicts>? dsRequestConflicts;

  @override
  List<Object?> get props => [dsRequestConflicts];
  @override
  Map<String, dynamic> toJson() => _$ArrivedRequestDetail$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ArrivedRequestDetailArguments extends JsonSerializable
    with EquatableMixin {
  ArrivedRequestDetailArguments({required this.requestID});

  @override
  factory ArrivedRequestDetailArguments.fromJson(Map<String, dynamic> json) =>
      _$ArrivedRequestDetailArgumentsFromJson(json);

  late String requestID;

  @override
  List<Object?> get props => [requestID];
  @override
  Map<String, dynamic> toJson() => _$ArrivedRequestDetailArgumentsToJson(this);
}

final ARRIVED_REQUEST_DETAIL_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'arrived_request_detail'),
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
                  name: NameNode(value: 'type_id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'type_name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class ArrivedRequestDetailQuery extends GraphQLQuery<ArrivedRequestDetail$Query,
    ArrivedRequestDetailArguments> {
  ArrivedRequestDetailQuery({required this.variables});

  @override
  final DocumentNode document = ARRIVED_REQUEST_DETAIL_QUERY_DOCUMENT;

  @override
  final String operationName = 'arrived_request_detail';

  @override
  final ArrivedRequestDetailArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  ArrivedRequestDetail$Query parse(Map<String, dynamic> json) =>
      ArrivedRequestDetail$Query.fromJson(json);
}
