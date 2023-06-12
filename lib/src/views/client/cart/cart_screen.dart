import 'package:flutter/material.dart';
import 'package:pizzaria/src/shared/controllers/cart_controller.dart';
import 'package:pizzaria/src/shared/controllers/order_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController();
    final orderController = OrderController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrinho"),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 180,
              child: Icon(
                Icons.shopping_cart,
                size: 180,
              ),
            ),
          ),
          SizedBox(height: 50),
          Text(
              "Ainda estou em desenvolvimento. Confirme seu pedido no botão abaixo")
        ],
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
              onPressed: () {
                orderController
                    .post(['7ae0504f-a95c-47fd-9904-1bb12b9f2027']); //Alter!!!
              },
              child: const Text("Confirmar"),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 36,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange.shade100,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              onPressed: () async {
                await cartController.delAll();
              },
              child: const Text("Limpar meu carrinho"),
            ),
          )
        ],
      ),
    );
  }
}
