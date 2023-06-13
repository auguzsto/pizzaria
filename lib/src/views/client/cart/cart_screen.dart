import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/shared/controllers/cart_controller.dart';
import 'package:pizzaria/src/shared/controllers/order_controller.dart';
import 'package:pizzaria/src/shared/models/cart_model.dart';
import 'package:pizzaria/src/shared/models/user_model.dart';
import 'package:pizzaria/src/shared/services/util_service.dart';
import 'package:pizzaria/src/shared/themes/colors/color_schemes.g.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  //Generate list items in cart.
  final List items = [];
  final List cart = [];

  final cartController = CartController();
  final orderController = OrderController();
  final utilService = UtilService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrinho"),
      ),
      body: FutureBuilder(
        future: cartController.getByUserId(Get.find<UserModel>(tag: "user")),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.only(top: 5),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              //Items in cart
              items.addAll(snapshot.data![index]['item']);

              //Cart in list
              cart.add(snapshot.data![index]);

              //Cart
              final cartModel = CartModel.fromMap(snapshot.data![index]);

              //List
              return ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.local_pizza),
                ),
                title: Text(items[index]['name']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      utilService.convertToBRL(items[index]['price']),
                      style: const TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      onPressed: () async {
                        await cartController.delete(cartModel.id!);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: lightColorScheme.error,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 66,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              onPressed: () async {
                List<String> idItem =
                    List.generate(items.length, (index) => items[index]['id']);
                await orderController.post(idItem).then(
                      (value) => List.generate(
                        cart.length,
                        (index) async =>
                            await cartController.delete(cart[index]['id']),
                      ),
                    );
              },
              child: const Text("Confirmar"),
            ),
          ),
        ],
      ),
    );
  }
}
