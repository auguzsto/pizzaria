import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/shared/models/user_model.dart';

import 'package:pizzaria/src/shared/themes/themes.dart';
import 'package:pizzaria/src/views/client/home/home_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightColorTheme,
      //darkTheme: darkColorTheme,
      home: const HomeScreen(),
      onInit: () => Get.put<UserModel>(UserModel(), tag: "user"),
    );
  }
}
