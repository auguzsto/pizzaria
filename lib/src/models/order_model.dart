import 'package:pizzaria/src/models/item_model.dart';

class OrderModel {
  String? id;
  List? item;
  String? createdOrder;
  double? total;

  OrderModel({
    this.id,
    this.item,
    this.createdOrder,
    this.total,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'],
      item: map['item'],
      createdOrder: map['createdOrder'],
      total: map['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "item": item,
      "createdOrder": createdOrder,
      "total": total,
    };
  }
}
