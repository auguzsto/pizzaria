import 'package:flutter/material.dart';

String _pedirAgora = "Pedir agora";
IconData _iconPedirAgora = Icons.shopping_bag;

abstract class MeuConstants {
  static String get pedirAgora => _pedirAgora;
  static IconData get iconPedirAgora => _iconPedirAgora;
}
