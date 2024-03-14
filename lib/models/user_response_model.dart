class UserResponse {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? role;
  String? createdAt;
  String? updatedAt;
  String? message;
  String? password;

  UserResponse({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.message,
    this.password,
  });

  UserResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;
    data['password'] = password;
    data['role'] = role;
    return data;
  }
}
