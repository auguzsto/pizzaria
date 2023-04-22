import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/models/user_model.dart';
import 'package:pizzaria/src/screens/auth/signin_screen.dart';

class AppBarCustom extends StatelessWidget {
  AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Avatar(),
        const Logo(),
        const Cart(),
      ],
    );
  }
}

//Logo
class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.local_pizza),
        SizedBox(
          width: 15,
        ),
        Text("PIZZARIA"),
      ],
    );
  }
}

//Avatar
class Avatar extends StatelessWidget {
  Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: IconButton(
        onPressed: () {
          Get.to(SignInScreen());
        },
        icon: const Text('T'),
      ),
    );
  }
}

//Cart
class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.shopping_cart,
        size: 28,
      ),
    );
  }
}
