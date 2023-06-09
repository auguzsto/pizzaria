import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/shared/constants/app.dart';
import 'package:pizzaria/src/shared/controllers/order_controller.dart';
import 'package:pizzaria/src/shared/models/item_model.dart';
import 'package:pizzaria/src/shared/models/order_model.dart';
import 'package:pizzaria/src/shared/models/user_model.dart';
import 'package:pizzaria/src/views/client/orders/widget/order_card_custom.dart';
import 'package:pizzaria/src/widgets/alert_warning_custom.dart';
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
        //Waiting data.
        if (!snapshot.hasData) {
          return const ProgressCustom(
            width: 25,
            height: 25,
          );

          //If user don't authorized or logged.
        } else if (snapshot.data?[0] == AppConstants.naoAutorizado) {
          return AlertWarningCustom(
            title: AppConstants.naoAutorizado,
            message: AppConstants.msgEfetuarLogin,
          );
        }

        //Card order.
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final orderModel =
                      OrderModel.fromMap(snapshot.data?[index] ?? {});

                  final itemModel = List.generate(orderModel.item!.length,
                      (index) => ItemModel.fromMap(orderModel.item![index]));

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OrderCardCustom(
                        orderModel: orderModel, itemModel: itemModel),
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
