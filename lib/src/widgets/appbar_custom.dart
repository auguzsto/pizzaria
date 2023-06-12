import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/shared/controllers/cart_controller.dart';
import 'package:pizzaria/src/shared/models/user_model.dart';
import 'package:pizzaria/src/shared/themes/colors/color_schemes.g.dart';
import 'package:pizzaria/src/views/auth/signin_screen.dart';

class AppBarCustom extends StatefulWidget {
  const AppBarCustom({super.key});

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Avatar(),
        const Logo(),
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
    return const Row(
      children: [
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
    return userModel.email != null
        ? const SizedBox()
        : CircleAvatar(
            child: IconButton(
              onPressed: () => showScreenLogin(context),
              icon: const Icon(Icons.person),
            ),
          );
  }
}

//Cart
class Cart extends StatelessWidget {
  Cart({super.key});

  final cartController = CartController();

  @override
  Widget build(BuildContext context) {
    final userModel = Get.find<UserModel>(tag: "user");
    return userModel.email != null
        ? IconButton(
            onPressed: () {},
            icon: Stack(
              children: [
                const Positioned(
                  child: Icon(
                    Icons.shopping_cart,
                    size: 32,
                  ),
                ),
                Positioned(
                  child: CircleAvatar(
                    radius: 11,
                    child: StreamBuilder(
                      stream: cartController.getLikeStream(),
                      builder: (context, snapshot) {
                        print(snapshot.data);
                        return Text("${snapshot.data?.length}" ?? "0");
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        : const Icon(
            Icons.shopping_cart,
            size: 32,
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
