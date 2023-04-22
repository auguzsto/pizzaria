class UserModel {
  String? id;
  String? username;
  int? vendor;

  UserModel({
    this.id,
    this.username,
    this.vendor,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      username: map['username'],
      vendor: map['vendor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "vendor": vendor,
    };
  }
}
