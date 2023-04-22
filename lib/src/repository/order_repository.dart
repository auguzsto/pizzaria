import 'package:pizzaria/src/services/http_client.dart';

class OrderRepository {
  final client = HttpClient();

  Future<List> get() async {
    return await client.get(table: "pedido");
  }
}
