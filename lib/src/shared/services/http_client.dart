import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pizzaria/src/shared/constants/app.dart';

abstract class IHttpClient {
  Future<List> get(
      {required String table, String? column, Map<String, String>? headers});
  Future<List> getByColumn(
      {required String table,
      required String column,
      Map<String, String>? headers});
  Future<void> post(
      {required String table,
      required Object body,
      String? column,
      Map<String, String>? headers});
  Future<void> patch(
      {required String table,
      required Object body,
      String? column,
      Map<String, String>? headers});
  Future<void> delete(
      {required String table,
      required String id,
      required Map<String, String>? headers});
  Future<void> deleteByQuery(
      {required String table,
      required String id,
      required Map<String, String>? headers});
}

class HttpClient implements IHttpClient {
  String baseUrl = AppConstants.baseUrl;

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
  Future<void> deleteByQuery(
      {required String table,
      required String id,
      required Map<String, String>? headers}) async {
    await http.delete(
      Uri.parse("$baseUrl/$table?id=$id"),
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
      return jsonDecode(utf8.decode(response.body.runes.toList()));
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
      return jsonDecode(response.body.isNotEmpty
          ? utf8.decode(response.body.runes.toList())
          : "{}");
    } else if (response.statusCode == 401) {
      print("Não autorizado");
    }
  }

  @override
  Future<void> patch(
      {required String table,
      required Object body,
      String? column,
      Map<String, String>? headers}) async {
    final response = await http.patch(
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

  @override
  Future<List> getByColumn(
      {required String table,
      required String column,
      Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.parse("$baseUrl/$table/$column"),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.body.runes.toList()));
    } else if (response.statusCode == 401) {
      return ['Não autorizado'];
    }
    throw Exception("Error");
  }
}
