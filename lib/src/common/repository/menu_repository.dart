import 'package:pizzaria/src/services/http_client.dart';

class MenuRepository {
  final client = HttpClient();

  Future<List> get() async {
    return await client.get(table: "item");
  }

  Future<List> getById({required String id}) async {
    return await client.get(table: "item?", column: "id=$id");
  }
}
