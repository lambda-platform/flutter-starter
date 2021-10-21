// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'getKhorooId.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class GetKhorooId$Query$Regions extends JsonSerializable with EquatableMixin {
  GetKhorooId$Query$Regions();

  factory GetKhorooId$Query$Regions.fromJson(Map<String, dynamic> json) =>
      _$GetKhorooId$Query$RegionsFromJson(json);

  @JsonKey(name: 'district_id')
  int? districtId;

  late int id;

  int? name;

  @override
  List<Object?> get props => [districtId, id, name];
  @override
  Map<String, dynamic> toJson() => _$GetKhorooId$Query$RegionsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetKhorooId$Query extends JsonSerializable with EquatableMixin {
  GetKhorooId$Query();

  factory GetKhorooId$Query.fromJson(Map<String, dynamic> json) =>
      _$GetKhorooId$QueryFromJson(json);

  List<GetKhorooId$Query$Regions>? regions;

  @override
  List<Object?> get props => [regions];
  @override
  Map<String, dynamic> toJson() => _$GetKhorooId$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetKhorooIdArguments extends JsonSerializable with EquatableMixin {
  GetKhorooIdArguments({required this.districtID, required this.khorooName});

  @override
  factory GetKhorooIdArguments.fromJson(Map<String, dynamic> json) =>
      _$GetKhorooIdArgumentsFromJson(json);

  late String districtID;

  late String khorooName;

  @override
  List<Object?> get props => [districtID, khorooName];
  @override
  Map<String, dynamic> toJson() => _$GetKhorooIdArgumentsToJson(this);
}

final GET_KHOROO_ID_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'getKhorooId'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'districtID')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'khorooName')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'regions'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'filters'),
                  value: ListValueNode(values: [
                    ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'column'),
                          value: StringValueNode(
                              value: 'district_id', isBlock: false)),
                      ObjectFieldNode(
                          name: NameNode(value: 'condition'),
                          value:
                              EnumValueNode(name: NameNode(value: 'equals'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'value'),
                          value:
                              VariableNode(name: NameNode(value: 'districtID')))
                    ]),
                    ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'column'),
                          value:
                              StringValueNode(value: 'name', isBlock: false)),
                      ObjectFieldNode(
                          name: NameNode(value: 'condition'),
                          value:
                              EnumValueNode(name: NameNode(value: 'equals'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'value'),
                          value:
                              VariableNode(name: NameNode(value: 'khorooName')))
                    ])
                  ]))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'district_id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
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
                  selectionSet: null)
            ]))
      ]))
]);

class GetKhorooIdQuery
    extends GraphQLQuery<GetKhorooId$Query, GetKhorooIdArguments> {
  GetKhorooIdQuery({required this.variables});

  @override
  final DocumentNode document = GET_KHOROO_ID_QUERY_DOCUMENT;

  @override
  final String operationName = 'getKhorooId';

  @override
  final GetKhorooIdArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetKhorooId$Query parse(Map<String, dynamic> json) =>
      GetKhorooId$Query.fromJson(json);
}
