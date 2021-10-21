// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'getDistrictId.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class GetDistrictId$Query$Districts extends JsonSerializable
    with EquatableMixin {
  GetDistrictId$Query$Districts();

  factory GetDistrictId$Query$Districts.fromJson(Map<String, dynamic> json) =>
      _$GetDistrictId$Query$DistrictsFromJson(json);

  late int id;

  @JsonKey(name: 'name_mn')
  String? nameMn;

  @override
  List<Object?> get props => [id, nameMn];
  @override
  Map<String, dynamic> toJson() => _$GetDistrictId$Query$DistrictsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDistrictId$Query extends JsonSerializable with EquatableMixin {
  GetDistrictId$Query();

  factory GetDistrictId$Query.fromJson(Map<String, dynamic> json) =>
      _$GetDistrictId$QueryFromJson(json);

  List<GetDistrictId$Query$Districts>? districts;

  @override
  List<Object?> get props => [districts];
  @override
  Map<String, dynamic> toJson() => _$GetDistrictId$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDistrictIdArguments extends JsonSerializable with EquatableMixin {
  GetDistrictIdArguments({required this.districtName});

  @override
  factory GetDistrictIdArguments.fromJson(Map<String, dynamic> json) =>
      _$GetDistrictIdArgumentsFromJson(json);

  late String districtName;

  @override
  List<Object?> get props => [districtName];
  @override
  Map<String, dynamic> toJson() => _$GetDistrictIdArgumentsToJson(this);
}

final GET_DISTRICT_ID_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'getDistrictId'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'districtName')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'districts'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'filters'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'column'),
                        value:
                            StringValueNode(value: 'name_mn', isBlock: false)),
                    ObjectFieldNode(
                        name: NameNode(value: 'condition'),
                        value: EnumValueNode(name: NameNode(value: 'equals'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'value'),
                        value:
                            VariableNode(name: NameNode(value: 'districtName')))
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
                  name: NameNode(value: 'name_mn'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class GetDistrictIdQuery
    extends GraphQLQuery<GetDistrictId$Query, GetDistrictIdArguments> {
  GetDistrictIdQuery({required this.variables});

  @override
  final DocumentNode document = GET_DISTRICT_ID_QUERY_DOCUMENT;

  @override
  final String operationName = 'getDistrictId';

  @override
  final GetDistrictIdArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetDistrictId$Query parse(Map<String, dynamic> json) =>
      GetDistrictId$Query.fromJson(json);
}
