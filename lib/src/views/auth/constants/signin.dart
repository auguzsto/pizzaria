import 'package:flutter/material.dart';

List<String> _labels = [
  "Email",
  "Senha",
];

List<IconData> _icons = [
  Icons.email,
  Icons.key,
];

abstract class SignInConstants {
  static List<String> get labels => _labels;
  static List<IconData> get icons => _icons;
}
