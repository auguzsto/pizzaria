class CartModel {
  String? id;
  List? items;
  String? idUser;

  CartModel({
    this.id,
    this.items,
    this.idUser,
  });

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'],
      items: map['item'],
      idUser: map['idUser'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "items": items,
      "idUser": idUser,
    };
  }
}
