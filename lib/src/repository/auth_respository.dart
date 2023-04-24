import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/models/user_model.dart';
import 'package:pizzaria/src/screens/home/home_screen.dart';
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
