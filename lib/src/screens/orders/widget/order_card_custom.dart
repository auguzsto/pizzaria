import 'package:flutter/material.dart';
import 'package:pizzaria/src/models/item_model.dart';
import 'package:pizzaria/src/models/order_model.dart';
import 'package:pizzaria/src/services/util_service.dart';
import 'package:pizzaria/src/themes/colors/color_schemes.g.dart';

class OrderCardCustom extends StatelessWidget {
  final OrderModel orderModel;
  final List<ItemModel> itemModel;
  const OrderCardCustom({
    super.key,
    required this.orderModel,
    required this.itemModel,
  });

  @override
  Widget build(BuildContext context) {
    final utilService = UtilService();
    //Card
    return Card(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Title
            const Text(
              "Pedido",
              style: TextStyle(fontSize: 18),
            ),

            //Date order.
            Text(
              utilService.formatterDate(orderModel.createdOrder!),
            )
          ],
        ),

        //List items from order.
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              //Itens
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                  itemModel.length,
                  (index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Name
                      Text(itemModel[index].name!),

                      //Price
                      Text(
                        utilService.convertToBRL(itemModel[index].price!),
                      )
                    ],
                  ),
                ),
              ),
            ),

            //Total price
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("TOTAL"),
                  Text(utilService.convertToBRL(orderModel.total!))
                ],
              ),
            ),
            const Divider(thickness: 0.5),

            //Status order
            Container(
              padding: const EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: lightColorScheme.primaryContainer,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.run_circle,
                    color: lightColorScheme.primary,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Em andamento",
                    style: TextStyle(color: lightColorScheme.primary),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
