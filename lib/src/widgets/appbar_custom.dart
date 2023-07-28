import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/shared/constants/app.dart';
import 'package:pizzaria/src/shared/controllers/cart_controller.dart';
import 'package:pizzaria/src/shared/models/user_model.dart';
import 'package:pizzaria/src/shared/themes/colors/color_schemes.g.dart';
import 'package:pizzaria/src/views/auth/signin_screen.dart';
import 'package:pizzaria/src/views/client/cart/cart_screen.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class AppBarCustom extends StatefulWidget {
  const AppBarCustom({super.key});

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final cartController = CartController();
  late StompClient stompClient;

  void onConnect(StompClient stompClient, StompFrame stompFrame) {
    stompClient.subscribe(
      destination: "/topic/message",
      callback: (frame) => setState(() {}),
    );
  }

  @override
  void initState() {
    super.initState();

    stompClient = StompClient(
      config: StompConfig.SockJS(
        url: "${AppConstants.baseUrl}/ws-message",
        onConnect: (stompFrame) => onConnect(stompClient, stompFrame),
      ),
    );

    stompClient.activate();
  }

  @override
  Widget build(BuildContext context) {
    final userModel = Get.find<UserModel>(tag: "user");
    return userModel.email != null
        ? IconButton(
            onPressed: () async {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CartScreen(),
              ));
            },
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
                    child: FutureBuilder(
                      future: cartController.getByUserId(userModel),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return Text("${snapshot.data?.length ?? 0}");
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

  @override
  void dispose() {
    stompClient.deactivate();

    super.dispose();
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
