import 'package:flutter/material.dart';
import 'package:pizzaria/src/shared/controllers/item_controller.dart';
import 'package:pizzaria/src/shared/models/item_model.dart';
import 'package:pizzaria/src/widgets/textformfield_custom.dart';

class ItemAdminDetailsScreen extends StatelessWidget {
  final ItemModel itemModel;
  ItemAdminDetailsScreen({super.key, required this.itemModel});

  final itemController = ItemController();

  final _controllers = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemModel.name!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Icon header
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 80,
                child: Icon(
                  Icons.shopping_bag,
                  size: 80,
                ),
              ),
            ),

            //Input name
            TextFormFieldCustom(
              prefixIcon: const Icon(Icons.shopping_bag),
              label: Text(itemModel.name!),
              obscureText: false,
              controller: _controllers,
            ),

            const SizedBox(height: 10),

            //Input description
            TextFormFieldCustom(
              prefixIcon: const Icon(Icons.description),
              label: Text(
                  itemModel.description ?? "Não há descrição neste produto"),
              obscureText: false,
              controller: _controllers,
            ),

            const SizedBox(height: 10),

            //Input price
            TextFormFieldCustom(
              prefixIcon: const Icon(Icons.attach_money_rounded),
              label: Text(itemModel.price!.toString()),
              obscureText: false,
              controller: _controllers,
            ),

            const SizedBox(height: 10),

            //Input price offer
            TextFormFieldCustom(
              prefixIcon: const Icon(Icons.attach_money_rounded),
              label: Text(itemModel.priceOffer?.toString() ?? "0"),
              obscureText: false,
              controller: _controllers,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 65,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              onPressed: () {},
              child: const Text("Confirmar"),
            ),
          )
        ],
      ),
    );
  }
}
