import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/views/client/home/constants/home.dart';
import 'package:pizzaria/src/views/client/menu/menu_screen.dart';
import 'package:pizzaria/src/views/client/offers/offers_screen.dart';
import 'package:pizzaria/src/shared/controllers/auth_controller.dart';
import 'package:pizzaria/src/shared/models/user_model.dart';
import 'package:pizzaria/src/views/client/orders/orders_screen.dart';
import 'package:pizzaria/src/widgets/appbar_custom.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userModel = Get.find<UserModel>(tag: "user");
    final authController = AuthController();
    return DefaultTabController(
      initialIndex: 1,
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
                  const SizedBox(height: 25),
                  CircleAvatar(
                    radius: 90,
                    child: Text(
                      userModel.email![0].toUpperCase(),
                      style: const TextStyle(fontSize: 44),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Row(
                        children: [
                          Icon(Icons.person),
                          Text("Meu perfil"),
                        ],
                      )),
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
