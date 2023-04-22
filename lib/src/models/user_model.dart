class UserModel {
  String? id;
  String? username;
  int? vendor;
  String? basicToken;

  UserModel({
    this.id,
    this.username,
    this.vendor,
    this.basicToken,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      username: map['username'],
      vendor: map['vendor'],
      basicToken: map['basicToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "vendor": vendor,
      "basicToken": basicToken,
    };
  }
}
