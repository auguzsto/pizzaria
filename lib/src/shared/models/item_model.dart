class ItemModel {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  double? price;
  double? priceOffer;
  String? idUser;

  ItemModel({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.price,
    this.priceOffer,
    this.idUser,
  });

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      imageUrl:
          "https://i0.wp.com/www.multarte.com.br/wp-content/uploads/2019/03/pizza-png-transparente.png?resize=600%2C600&ssl=1",
      price: map['price'],
      priceOffer: map['priceOffer'],
      idUser: map['idUser'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "imageUrl": imageUrl,
      "price": price,
      "priceOffer": priceOffer,
      "idUser": idUser,
    };
  }
}
