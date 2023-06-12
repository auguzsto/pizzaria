import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';
import 'package:pizzaria/src/shared/models/item_model.dart';

class CartController with ChangeNotifier {
  final db = Localstore.instance;

  Future<void> set(ItemModel itemModel) async {
    final id = db.collection('cart').doc().id;
    return await db.collection('cart').doc(id).set({
      "id": itemModel.id,
      "name": itemModel.name,
      "price": itemModel.price,
    });
  }

  Future<void> delAll() async {
    return await db.collection('cart').delete();
  }

  Stream<Map<String, dynamic>?> getLikeStream() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (_) {
      return db.collection('cart').get();
    }).asyncMap((event) async => await event);
  }
}
