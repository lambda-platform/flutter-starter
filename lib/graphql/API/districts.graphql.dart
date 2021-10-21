// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'districts.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Districts$Query$Districts$Regions extends JsonSerializable
    with EquatableMixin {
  Districts$Query$Districts$Regions();

  factory Districts$Query$Districts$Regions.fromJson(
          Map<String, dynamic> json) =>
      _$Districts$Query$Districts$RegionsFromJson(json);

  int? name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() =>
      _$Districts$Query$Districts$RegionsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Districts$Query$Districts extends JsonSerializable with EquatableMixin {
  Districts$Query$Districts();

  factory Districts$Query$Districts.fromJson(Map<String, dynamic> json) =>
      _$Districts$Query$DistrictsFromJson(json);

  late int id;

  @JsonKey(name: 'name_en')
  String? nameEn;

  @JsonKey(name: 'name_mn')
  String? nameMn;

  List<Districts$Query$Districts$Regions>? regions;

  @override
  List<Object?> get props => [id, nameEn, nameMn, regions];
  @override
  Map<String, dynamic> toJson() => _$Districts$Query$DistrictsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Districts$Query extends JsonSerializable with EquatableMixin {
  Districts$Query();

  factory Districts$Query.fromJson(Map<String, dynamic> json) =>
      _$Districts$QueryFromJson(json);

  List<Districts$Query$Districts>? districts;

  @override
  List<Object?> get props => [districts];
  @override
  Map<String, dynamic> toJson() => _$Districts$QueryToJson(this);
}

final DISTRICTS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'districts'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'districts'),
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
                  name: NameNode(value: 'name_en'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'name_mn'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'regions'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class DistrictsQuery extends GraphQLQuery<Districts$Query, JsonSerializable> {
  DistrictsQuery();

  @override
  final DocumentNode document = DISTRICTS_QUERY_DOCUMENT;

  @override
  final String operationName = 'districts';

  @override
  List<Object?> get props => [document, operationName];
  @override
  Districts$Query parse(Map<String, dynamic> json) =>
      Districts$Query.fromJson(json);
}
