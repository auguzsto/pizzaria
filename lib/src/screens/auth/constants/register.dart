import 'package:flutter/material.dart';

List<String> _labels = [
  "E-mail",
  "Senha",
  "Confirmar senha",
  "Endereço",
  "CEP",
  "Celular",
];

List<IconData> _icons = [
  Icons.email,
  Icons.key,
  Icons.key,
  Icons.map,
  Icons.local_activity,
  Icons.phone,
];

abstract class RegisterConstants {
  static List<String> get labels => _labels;
  static List<IconData> get icons => _icons;
}
