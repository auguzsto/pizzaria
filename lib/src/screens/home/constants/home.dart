import 'package:flutter/material.dart';

List<Widget> _tabBar = [
  Column(
    children: const [
      Icon(Icons.local_offer_rounded),
      Text("Ofertas"),
    ],
  ),
  Column(
    children: const [
      Icon(Icons.shopping_bag),
      Text("Cardápio"),
    ],
  ),
  Column(
    children: const [
      Icon(Icons.view_list),
      Text("Pedidos"),
    ],
  ),
];

abstract class Home {
  static List<Widget> get tabBar => _tabBar;
}
