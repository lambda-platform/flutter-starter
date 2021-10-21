class District {
  int? _id;
  String? _nameEn;
  String? _nameMn;
  List<Region>? _regions;

  int? get id => _id;
  String? get nameEn => _nameEn;
  String? get nameMn => _nameMn;
  List<Region>? get regions => _regions;

  District({
      int? id, 
      String? nameEn, 
      String? nameMn, 
      List<Region>? regions}){
    _id = id;
    _nameEn = nameEn;
    _nameMn = nameMn;
    _regions = regions;
}

  District.fromJson(dynamic json) {
    _id = json["id"];
    _nameEn = json["name_en"];
    _nameMn = json["name_mn"];
    if (json["regions"] != null) {
      _regions = [];
      json["regions"].forEach((v) {
        _regions?.add(Region.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name_en"] = _nameEn;
    map["name_mn"] = _nameMn;
    if (_regions != null) {
      map["regions"] = _regions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Region {
  int? _name;

  int? get name => _name;

  Regions({
      int? name}){
    _name = name;
}

  Region.fromJson(dynamic json) {
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    return map;
  }

}