import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/models/user_model.dart';
import 'package:pizzaria/src/screens/home/constants/home.dart';
import 'package:pizzaria/src/screens/menu/menu_screen.dart';
import 'package:pizzaria/src/screens/offers/offers_screen.dart';
import 'package:pizzaria/src/screens/orders/orders_screen.dart';
import 'package:pizzaria/src/widgets/appbar_custom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(Get.find<UserModel>(tag: "user").toJson());
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
