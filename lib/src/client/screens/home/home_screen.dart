import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/client/screens/home/constants/home.dart';
import 'package:pizzaria/src/client/screens/menu/menu_screen.dart';
import 'package:pizzaria/src/client/screens/offers/offers_screen.dart';
import 'package:pizzaria/src/client/screens/orders/orders_screen.dart';
import 'package:pizzaria/src/shared/controllers/auth_controller.dart';
import 'package:pizzaria/src/shared/models/user_model.dart';
import 'package:pizzaria/src/widgets/appbar_custom.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userModel = Get.find<UserModel>(tag: "user");
    final authController = AuthController();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const AppBarCustom(),
          bottom: TabBar(
            tabs: List.generate(
              Home.tabBar.length,
              (index) => Home.tabBar[index],
            ),
          ),
        ),
        drawer: userModel.email != null
            ? NavigationDrawer(
                children: [
                  IconButton(
                      onPressed: () => authController.signOut(),
                      icon: const Text("Sair"))
                ],
              )
            : null,
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
