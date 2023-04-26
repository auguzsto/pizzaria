import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/constants/app.dart';
import 'package:pizzaria/src/controllers/order_controller.dart';
import 'package:pizzaria/src/models/item_model.dart';
import 'package:pizzaria/src/models/order_model.dart';
import 'package:pizzaria/src/models/user_model.dart';
import 'package:pizzaria/src/screens/orders/widget/order_card_custom.dart';
import 'package:pizzaria/src/services/util_service.dart';
import 'package:pizzaria/src/themes/colors/color_schemes.g.dart';
import 'package:pizzaria/src/widgets/alert_warning_custom.dart';
import 'package:pizzaria/src/widgets/progress_custom.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = OrderController();
    final userModel = Get.find<UserModel>(tag: "user");
    final utilService = UtilService();

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
        } else if (snapshot.data![0] == AppConsntats.naoAutorizado) {
          return AlertWarningCustom(
            title: AppConsntats.naoAutorizado,
            message: AppConsntats.msgEfetuarLogin,
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
