import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/shared/handlers/handlers.dart';
import 'package:pizzaria/src/views/admin/home/home_screen.dart';
import 'package:pizzaria/src/shared/models/user_model.dart';
import 'package:pizzaria/src/shared/repository/auth_respository.dart';
import 'package:pizzaria/src/views/client/home/home_screen.dart';

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
            user.address = value['address'];
            user.numberPhone = value['numberPhone'];
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

  Future<void> signUp(
      String username,
      String password,
      String rePassword,
      String address,
      String cep,
      String numberPhone,
      BuildContext context) async {
    //Check e-mail
    if (!username.isEmail) {
      throw Handlers.error(message: "E-mail inválido", context: context);
    }

    //Check password
    if (password.length < 7) {
      throw Handlers.error(
          message: "Senha deve conter mínimo de 7 caracteres",
          context: context);
    }

    if (password != rePassword) {
      throw Handlers.error(message: "As senhas não iguais", context: context);
    }

    //Check address
    if (address.length < 8) {
      throw Handlers.error(message: "Endreço inválido", context: context);
    }

    //Check cep
    if (cep.length < 9) {
      throw Handlers.error(message: "Cep inválido", context: context);
    }

    //Check number phone
    if (numberPhone.length < 16) {
      throw Handlers.error(message: "Celular inválido", context: context);
    }

    await authRepository.signUp(username, password, address, cep, numberPhone);
  }

  Future<void> signOut() async {
    UserModel userModel = Get.find<UserModel>(tag: "user");
    userModel.id = null;
    userModel.email = null;
    userModel.vendor = null;
    userModel.basicToken = null;
    userModel.obs.refresh();
    Get.offAll(() => const HomeScreen());
  }
}
