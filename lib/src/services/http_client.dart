import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future<List> get({required String table, String? column});
  Future<void> post();
  Future<void> delete();
}

class HttpClient implements IHttpClient {
  String baseUrl = "http://localhost:8080";

  @override
  Future<void> delete() {
    throw UnimplementedError();
  }

  @override
  Future<List> get({required String table, String? column}) async {
    final response = await http.get(Uri.parse("$baseUrl/$table?$column"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      return ['Não autorizado'];
    }
    throw Exception("Error");
  }

  @override
  Future<void> post() {
    throw UnimplementedError();
  }
}
