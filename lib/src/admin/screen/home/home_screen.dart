import 'package:flutter/material.dart';
import 'package:pizzaria/src/admin/screen/home/constants/home_admin.dart';
import 'package:pizzaria/src/common/controllers/auth_controller.dart';
import 'package:pizzaria/src/common/themes/colors/color_schemes.g.dart';
import 'package:pizzaria/src/services/util_service.dart';

class HomeAdminScreen extends StatelessWidget {
  const HomeAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final utilService = UtilService();
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
              onPressed: () {},
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
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: lightColorScheme.primary,
                      ),
                      color: lightColorScheme.background,
                      borderRadius: BorderRadius.circular(12),
                    ),
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
        ],
      ),
    );
  }
}
