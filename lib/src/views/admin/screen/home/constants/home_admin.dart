import 'package:flutter/material.dart';

List<String> _labels = [
  // "Financeiro",
  // "Relatórios",
  // "Clientes",
  "Itens",
];

List<String> _description = [
  // "Acompanhe suas finanças",
  // "Acompanhe com relatórios",
  // "Gerencie seus clientes",
  "Gerencie seus itens",
];

List<IconData> _icons = [
  // Icons.monetization_on,
  // Icons.list,
  // Icons.person,
  Icons.shopping_bag,
];

abstract class HomeAdmin {
  static List<String> get labels => _labels;
  static List<String> get description => _description;
  static List<IconData> get icons => _icons;
}
