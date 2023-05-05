import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future<List> get(
      {required String table, String? column, Map<String, String>? headers});
  Future post({required String table, required Object body, String? column});
  Future<void> delete(
      {required String table,
      required String id,
      required Map<String, String>? headers});
}

class HttpClient implements IHttpClient {
  String baseUrl = "http://localhost:8080";

  @override
  Future<void> delete(
      {required String table,
      required String id,
      required Map<String, String>? headers}) async {
    await http.delete(
      Uri.parse("$baseUrl/$table/$id"),
      headers: headers,
    );
  }

  @override
  Future<List> get(
      {required String table,
      String? column,
      Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.parse("$baseUrl/$table?$column"),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      return ['Não autorizado'];
    }
    throw Exception("Error");
  }

  @override
  Future post(
      {required String table,
      Object? body,
      String? column,
      Map<String, String>? headers}) async {
    final response = await http.post(
      Uri.parse("$baseUrl/$table?$column"),
      body: jsonEncode(body),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body.isNotEmpty ? response.body : "{}");
    } else if (response.statusCode == 401) {
      print("Não autorizado");
    }
  }
}
