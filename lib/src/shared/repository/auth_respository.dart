import 'package:pizzaria/src/services/http_client.dart';

class AuthRepository {
  final client = HttpClient();
  Future signIn(String username, String password) async {
    return await client.post(
      table: "auth",
      body: {
        "email": username,
        "password": password,
      },
    );
  }
}
