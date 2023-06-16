import 'package:flutter/material.dart';
import 'package:pizzaria/src/shared/repository/item_repository.dart';

class ItemController extends ChangeNotifier {
  final itemRepository = ItemRepository();
  Future<List> get() async {
    return await itemRepository.get();
  }

  Stream<List> getLikeStream() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (_) {
      return itemRepository.get();
    }).asyncMap((event) async => await event);
  }

  Future<List> getById({required String id}) async {
    return await itemRepository.getById(id: id);
  }

  Future<void> post(String name, double price, double priceOffer) async {
    await itemRepository.post(name, price, priceOffer);
    notifyListeners();
  }

  Future<void> delete(String id) async {
    await itemRepository.delete(id);
    notifyListeners();
  }

  Future<void> patch(String id, String? name, String? description,
      double? price, double? priceOffer) async {
    await itemRepository.patch(id, name, description, price, priceOffer);
    notifyListeners();
  }
}
