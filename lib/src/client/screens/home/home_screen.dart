import 'package:flutter/material.dart';
import 'package:pizzaria/src/client/screens/home/constants/home.dart';
import 'package:pizzaria/src/client/screens/menu/menu_screen.dart';
import 'package:pizzaria/src/client/screens/offers/offers_screen.dart';
import 'package:pizzaria/src/client/screens/orders/orders_screen.dart';
import 'package:pizzaria/src/widgets/appbar_custom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: AppBarCustom(),
          bottom: TabBar(
            tabs: List.generate(
              Home.tabBar.length,
              (index) => Home.tabBar[index],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            OffersScreen(),
            MenuScreen(),
            OrdersScreen(),
          ],
        ),
      ),
    );
  }
}
