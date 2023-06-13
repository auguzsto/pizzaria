import 'package:flutter/material.dart';

List<Widget> _tabBar = const [
  Column(
    children: [
      Icon(Icons.local_offer_rounded),
      Text("Ofertas"),
    ],
  ),
  Column(
    children: [
      Icon(Icons.shopping_bag),
      Text("Cardápio"),
    ],
  ),
  Column(
    children: [
      Icon(Icons.view_list),
      Text("Pedidos"),
    ],
  ),
];

abstract class Home {
  static List<Widget> get tabBar => _tabBar;
}
