import 'package:flutter/material.dart';

const String _naoAutorizado = "Não autorizado";
const String _msgEfetuarLogin =
    "É necessário acessar sua conta para efetuar esta operação.";
const IconData _error = Icons.error;
const IconData _warning = Icons.warning;
const Map<String, String> _headerContentType = {
  "Content-Type": "application/json",
};

abstract class AppConsntats {
  static String get naoAutorizado => _naoAutorizado;
  static String get msgEfetuarLogin => _msgEfetuarLogin;
  static IconData get error => _error;
  static IconData get warning => _warning;
  static Map<String, String> get headerContentType => _headerContentType;
}
