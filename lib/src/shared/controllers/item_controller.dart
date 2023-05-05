import 'package:get/get.dart';
import 'package:pizzaria/src/shared/repository/item_repository.dart';

class ItemController extends GetxController {
  final itemRepository = ItemRepository();
  Future<List> get() async {
    return await itemRepository.get();
  }

  Future<List> getById({required String id}) async {
    return await itemRepository.getById(id: id);
  }

  Future<void> post(String name, double price, double? priceOffer) async {
    await itemRepository.post(name, price, priceOffer ?? 0);
    update();
  }

  Future<void> delete(String id) async {
    await itemRepository.delete(id);
    update();
  }
}
