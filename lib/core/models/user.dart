class User {
  String? avatar;
  String? bio;
  String? birthday;
  String? createdAt;
  String? deletedAt;
  int? districtId;
  String? email;
  String? fcmToken;
  String? firstName;
  String? gender;
  int? id;
  String? lastName;
  String? login;
  String? orgId;

  int? regionId;
  String? registerNumber;
  int? role;
  int? sectionId;
  String? status;
  String? updatedAt;
  User({
    this.avatar,
    this.bio,
    this.birthday,
    this.createdAt,
    this.deletedAt,
    this.districtId,
    this.email,
    this.fcmToken,
    this.firstName,
    this.gender,
    this.id,
    this.lastName,
    this.login,
    this.orgId,

    this.regionId,
    this.registerNumber,
    this.role,
    this.sectionId,
    this.status,
    this.updatedAt
  });

  User.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    bio = json['bio'];
    birthday = json['birthday'];
    createdAt = json['created_at'];
    deletedAt = json['deleted_at'];
    districtId = json['district_id'];
    email = json['email'];
    fcmToken = json['fcm_token'];
    firstName = json['first_name'];
    gender = json['gender'];
    id = json['id'];
    lastName = json['last_name'];
    login = json['login'];
    orgId = json['org_id'];

    regionId = json['region_id'];
    registerNumber = json['register_number'];
    role = json['role'];
    sectionId = json['section_id'];
    status = json['status'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['bio'] = this.bio;
    data['birthday'] = this.birthday;
    data['created_at'] = this.createdAt;
    data['deleted_at'] = this.deletedAt;
    data['district_id'] = this.districtId;
    data['email'] = this.email;
    data['fcm_token'] = this.fcmToken;
    data['first_name'] = this.firstName;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['last_name'] = this.lastName;
    data['login'] = this.login;
    data['org_id'] = this.orgId;

    data['region_id'] = this.regionId;
    data['register_number'] = this.registerNumber;
    data['role'] = this.role;
    data['section_id'] = this.sectionId;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
