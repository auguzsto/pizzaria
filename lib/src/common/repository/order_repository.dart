import 'package:pizzaria/src/common/models/user_model.dart';
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
      authorization: {
        "Authorization": "Basic ${userModel!.basicToken}",
      },
    );
  }
}
