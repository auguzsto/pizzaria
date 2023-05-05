import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/shared/models/user_model.dart';
import 'package:pizzaria/src/client/screens/auth/signin_screen.dart';
import 'package:pizzaria/src/shared/themes/colors/color_schemes.g.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Avatar(),
        Logo(),
        Cart(),
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
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    final userModel = Get.find<UserModel>(tag: "user");
    return CircleAvatar(
      child: IconButton(
        onPressed:
            userModel.email != null ? () {} : () => showScreenLogin(context),
        icon: userModel.email != null
            ? Text(userModel.email![0])
            : const Icon(Icons.person),
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

Future showScreenLogin(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
              color: lightColorScheme.onTertiary,
              borderRadius: BorderRadius.circular(8)),
          child: SignInScreen(),
        )
      ],
    ),
  );
}
