import 'package:get/get.dart';
import 'package:pizzaria/src/shared/models/user_model.dart';
import 'package:pizzaria/src/shared/services/http_client.dart';

class OrderRepository {
  final client = HttpClient();

  Future<List> get() async {
    return await client.get(
      table: "pedido",
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Basic ${Get.find<UserModel>(tag: "user").basicToken}",
      },
    );
  }

  Future<void> post(List<String> idItem) async {
    return await client.post(
      table: "pedido",
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

  Future<List> getByUserId(UserModel? userModel) async {
    return await client.get(
      table: "pedido",
      column: "idUser=${userModel?.id}",
      headers: {
        "Authorization": "Basic ${userModel!.basicToken}",
      },
    );
  }
}
