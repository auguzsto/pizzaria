import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/views/admin/screen/home/constants/home_admin.dart';
import 'package:pizzaria/src/views/admin/screen/item/item_screen.dart';
import 'package:pizzaria/src/shared/controllers/auth_controller.dart';
import 'package:pizzaria/src/shared/themes/colors/color_schemes.g.dart';
import 'package:pizzaria/src/shared/services/util_service.dart';

class HomeAdminScreen extends StatelessWidget {
  const HomeAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final utilService = UtilService();
    final authController = AuthController();
    return Scaffold(
      //Appbar
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Painel administrativo",
            ),
            IconButton(
              onPressed: () async {
                authController.signOut();
              },
              icon: const Icon(
                Icons.logout,
              ),
            )
          ],
        ),
      ),

      //Body
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisSpacing: 0,
              crossAxisCount: MediaQuery.of(context).size.width < 800 ? 2 : 6,
              children: List.generate(
                HomeAdmin.labels.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(6.0),

                  //Containers menu
                  child: GestureDetector(
                    onTap: () => index.isEqual(3)
                        ? Get.to(const ItemAdminScreen())
                        : null,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: lightColorScheme.primary,
                        ),
                        color: lightColorScheme.background,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      //Title, icon, description
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            maxRadius:
                                utilService.screenDeviceWidth(13, 30, context),
                            child: Icon(HomeAdmin.icons[index]),
                          ),
                          const SizedBox(height: 10),
                          Text(HomeAdmin.labels[index]),
                          Text(
                            HomeAdmin.description[index],
                            style: TextStyle(color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
