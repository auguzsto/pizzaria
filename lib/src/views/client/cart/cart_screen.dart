import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/shared/controllers/cart_controller.dart';
import 'package:pizzaria/src/shared/models/cart_model.dart';
import 'package:pizzaria/src/shared/models/user_model.dart';
import 'package:pizzaria/src/shared/services/util_service.dart';
import 'package:pizzaria/src/shared/themes/colors/color_schemes.g.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartController = CartController();
    final utilService = UtilService();
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

          //Generate list items in cart.
          List items = [];
          return ListView.separated(
            padding: const EdgeInsets.only(top: 5),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              //Items in cart
              items.addAll(snapshot.data![index]['item']);

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
                        items.remove(index);
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
              onPressed: () {},
              child: const Text("Confirmar"),
            ),
          ),
        ],
      ),
    );
  }
}
