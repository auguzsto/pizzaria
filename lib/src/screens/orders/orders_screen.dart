import 'package:flutter/material.dart';
import 'package:pizzaria/src/constants/app.dart';
import 'package:pizzaria/src/controllers/order_controller.dart';
import 'package:pizzaria/src/widgets/progress_custom.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = OrderController();
    return FutureBuilder(
      future: orderController.get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const ProgressCustom(
            width: 25,
            height: 25,
          );
        } else if (snapshot.data![0] != AppConsntats.naoAutorizado) {
          return const Center();
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                maxRadius: 148,
                child: Icon(
                  AppConsntats.warning,
                  size: 138,
                ),
              ),
              Text(
                AppConsntats.naoAutorizado,
                style: const TextStyle(fontSize: 32),
              ),
              Text(AppConsntats.msgEfetuarLogin),
            ],
          ),
        );
      },
    );
  }
}
