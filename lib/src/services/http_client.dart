import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pizzaria/src/shared/constants/app.dart';

abstract class IHttpClient {
  Future<List> get(
      {required String table,
      String? column,
      Map<String, String>? authorization});
  Future post({required String table, required Object body, String? column});
  Future<void> delete();
}

class HttpClient implements IHttpClient {
  String baseUrl = "http://localhost:8080";

  @override
  Future<void> delete() {
    throw UnimplementedError();
  }

  @override
  Future<List> get(
      {required String table,
      String? column,
      Map<String, String>? authorization}) async {
    final response = await http.get(
      Uri.parse("$baseUrl/$table?$column"),
      headers: authorization,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      return ['Não autorizado'];
    }
    throw Exception("Error");
  }

  @override
  Future post({required String table, Object? body, String? column}) async {
    final response = await http.post(
      Uri.parse("$baseUrl/$table?$column"),
      body: jsonEncode(body),
      headers: AppConsntats.headerContentType,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      print("Não autorizado");
    }
  }
}
