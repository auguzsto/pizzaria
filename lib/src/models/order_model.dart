import 'package:pizzaria/src/models/item_model.dart';

class OrderModel {
  String? id;
  List? item;

  OrderModel({
    this.id,
    this.item,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'],
      item: map['item'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "item": item,
    };
  }
}
