import 'package:get/get.dart';
import 'package:pizzaria/src/shared/models/user_model.dart';
import 'package:pizzaria/src/shared/services/http_client.dart';

abstract class ICart {
  Future<void> add(List<String> idItem);
  Future<List> getByUserId(UserModel userModel);
  Future<void> delete(String id);
}

class CartRepository implements ICart {
  final client = HttpClient();
  @override
  Future<void> add(List<String> idItem) async {
    await client.post(
      table: 'cart',
      body: {
        "idItem": idItem,
        "idUser": Get.find<UserModel>(tag: "user").id,
      },
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Basic ${Get.find<UserModel>(tag: "user").basicToken}",
      },
    );
  }

  @override
  Future<List> getByUserId(UserModel userModel) async {
    return await client.get(
      table: "cart",
      column: "idUser=${userModel.id}",
    );
  }

  @override
  Future<void> delete(String id) async {
    return await client.deleteByQuery(
      table: 'cart',
      id: id,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Basic ${Get.find<UserModel>(tag: "user").basicToken}",
      },
    );
  }
}
