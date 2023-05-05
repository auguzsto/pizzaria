import 'package:pizzaria/src/shared/models/user_model.dart';
import 'package:pizzaria/src/services/http_client.dart';

class OrderRepository {
  final client = HttpClient();

  Future<List> get() async {
    return await client.get(table: "pedido");
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
