class UserModel {
  String? id;
  String? email;
  int? vendor;
  String? basicToken;

  UserModel({
    this.id,
    this.email,
    this.vendor,
    this.basicToken,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      vendor: map['vendor'],
      basicToken: map['basicToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "vendor": vendor,
      "basicToken": basicToken,
    };
  }
}
