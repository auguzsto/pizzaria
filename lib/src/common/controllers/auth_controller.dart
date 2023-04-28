import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/admin/screen/home/home_screen.dart';
import 'package:pizzaria/src/app_widget.dart';
import 'package:pizzaria/src/common/models/user_model.dart';
import 'package:pizzaria/src/common/repository/auth_respository.dart';
import 'package:pizzaria/src/common/screens/home/home_screen.dart';

class AuthController extends GetxController {
  final authRepository = AuthRepository();
  RxBool isLoading = false.obs;

  Future<void> signIn(
      String username, String password, BuildContext context) async {
    await authRepository.signIn(username, password).then(
      (value) async {
        isLoading.value = true;
        await Future.delayed(const Duration(seconds: 3));
        if (value != null) {
          Get.find<UserModel>(tag: "user").obs.update((user) {
            user!.id = value['id'];
            user.email = value['email'];
            user.vendor = value['vendor'];
            user.basicToken = value['basicToken'];
          });

          if (Get.find<UserModel>(tag: "user").vendor == 1) {
            return Get.offAll(const HomeAdminScreen());
          }

          Get.offAll(const HomeScreen());
        }
        isLoading.value = false;
      },
    );
  }
}