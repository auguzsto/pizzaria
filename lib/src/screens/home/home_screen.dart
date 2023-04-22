import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizzaria/src/screens/home/constants/home.dart';
import 'package:pizzaria/src/screens/menu/menu_screen.dart';
import 'package:pizzaria/src/screens/offers/offers_screen.dart';
import 'package:pizzaria/src/themes/colors/color_schemes.g.dart';
import 'package:pizzaria/src/widgets/appbar_custom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
        body: const TabBarView(
          children: [
            OffersScreen(),
            MenuScreen(),
          ],
        ),
      ),
    );
  }
}
