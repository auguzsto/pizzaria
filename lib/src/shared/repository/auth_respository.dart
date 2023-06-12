import 'package:pizzaria/src/shared/services/http_client.dart';

abstract class IAuth {
  Future signIn(String username, String passsword);
  Future signUp(String username, String password, String address, String cep,
      String numberPhone);
}

class AuthRepository implements IAuth {
  final client = HttpClient();
  @override
  Future signIn(String username, String password) async {
    return await client.post(
      table: "auth",
      body: {
        "email": username,
        "password": password,
      },
      headers: {
        "Content-Type": "application/json",
      },
    );
  }

  @override
  Future signUp(String username, String password, String address, String cep,
      String numberPhone) async {
    return await client.post(
      table: "user",
      body: {
        "email": username,
        "password": password,
        "address": "$address - $cep",
        "numberPhone": numberPhone,
      },
      headers: {
        "Content-Type": "application/json",
      },
    );
  }
}
