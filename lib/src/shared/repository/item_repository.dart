import 'package:get/get.dart';
import 'package:pizzaria/src/services/http_client.dart';
import 'package:pizzaria/src/shared/models/user_model.dart';

class ItemRepository {
  final client = HttpClient();

  Future<List> get() async {
    return await client.get(table: "item");
  }

  Future<List> getById({required String id}) async {
    return await client.get(table: "item", column: "id=$id");
  }

  Future<void> post(String name, double price, double priceOffer) async {
    return await client.post(
      table: 'item',
      body: {
        "name": name,
        "price": price,
        "priceOffer": priceOffer,
        "idUser": "${Get.find<UserModel>(tag: "user").id}"
      },
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Basic ${Get.find<UserModel>(tag: "user").basicToken}",
      },
    );
  }

  Future<void> delete(String id) async {
    return await client.delete(
      table: 'item',
      id: id,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Basic ${Get.find<UserModel>(tag: "user").basicToken}",
      },
    );
  }
}
