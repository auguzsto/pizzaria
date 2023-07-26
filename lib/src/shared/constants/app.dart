import 'package:flutter/material.dart';

const String _baseUrl = "http://54.211.132.203:8080";
const String _naoAutorizado = "Não autorizado";
const String _adicionadoCarrinho = "Adicionado ao carrinho";
const String _pedidoRealizado = "Seu pedido foi realizado";
const String _msgEfetuarLogin =
    "É necessário acessar sua conta para efetuar esta operação.";
const IconData _error = Icons.error;
const IconData _warning = Icons.warning;
const Map<String, String> _headerContentType = {
  "Content-Type": "application/json",
};

abstract class AppConstants {
  static String get baseUrl => _baseUrl;
  static String get naoAutorizado => _naoAutorizado;
  static String get pedidoRealizado => _pedidoRealizado;
  static String get adicionadoCarrinho => _adicionadoCarrinho;
  static String get msgEfetuarLogin => _msgEfetuarLogin;
  static IconData get error => _error;
  static IconData get warning => _warning;
  static Map<String, String> get headerContentType => _headerContentType;
}
