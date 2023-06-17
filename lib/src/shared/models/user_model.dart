class UserModel {
  String? id;
  String? email;
  String? password;
  String? numberPhone;
  String? address;
  int? vendor;
  String? basicToken;

  UserModel({
    this.id,
    this.email,
    this.password,
    this.numberPhone,
    this.address,
    this.vendor,
    this.basicToken,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      password: map['password'],
      numberPhone: map['numberPhone'],
      address: map['address'],
      vendor: map['vendor'],
      basicToken: map['basicToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "password": password,
      "numberPhone": numberPhone,
      "address": address,
      "vendor": vendor,
      "basicToken": basicToken,
    };
  }
}
