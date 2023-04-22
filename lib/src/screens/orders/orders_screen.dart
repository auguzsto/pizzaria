import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/constants/app.dart';
import 'package:pizzaria/src/controllers/order_controller.dart';
import 'package:pizzaria/src/models/item_model.dart';
import 'package:pizzaria/src/models/order_model.dart';
import 'package:pizzaria/src/models/user_model.dart';
import 'package:pizzaria/src/widgets/progress_custom.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = OrderController();
    final userModel = Get.find<UserModel>(tag: "user");
    return FutureBuilder(
      future: orderController.getByUserId(userModel),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const ProgressCustom(
            width: 25,
            height: 25,
          );
        } else if (snapshot.data![0] == AppConsntats.naoAutorizado) {
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
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  print(snapshot.data![index]);

                  final orderModel =
                      OrderModel.fromMap(snapshot.data?[index] ?? {});

                  return ListTile(
                    title: Text(orderModel.id!),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
