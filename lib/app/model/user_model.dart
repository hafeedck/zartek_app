class UserModel {
  String? username;
  String? name;
  String? id;
  String? role;
  String? status;
  String? type;
  String? encKey;

  UserModel({
    this.username,
    this.name,
    this.id,
    this.role,
    this.status,
    this.encKey,
    this.type,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"],
        name: json["name"],
        id: json["id"],
        role: json["role"],
        status: json["status"],
        encKey: json["enc_key"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "Name": name,
        "id": id,
        "role": role,
        "status": status,
        "enc_key": encKey,
      };
}