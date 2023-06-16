import 'package:flutter/material.dart';
import 'package:pizzaria/src/shared/controllers/item_controller.dart';
import 'package:pizzaria/src/shared/handlers/handlers.dart';
import 'package:pizzaria/src/shared/models/item_model.dart';
import 'package:pizzaria/src/shared/services/util_service.dart';
import 'package:pizzaria/src/widgets/textformfield_custom.dart';

class ItemAdminDetailsScreen extends StatelessWidget {
  final ItemModel itemModel;
  ItemAdminDetailsScreen({super.key, required this.itemModel});

  final itemController = ItemController();
  final utilService = UtilService();

  final _controllerName = TextEditingController();
  final _controllerDescription = TextEditingController();
  final _controllerPrice = TextEditingController();
  final _controllerPriceOffer = TextEditingController();

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
              controller: _controllerName,
            ),

            const SizedBox(height: 10),

            //Input description
            TextFormFieldCustom(
              prefixIcon: const Icon(Icons.description),
              label: Text(itemModel.description!),
              obscureText: false,
              controller: _controllerDescription,
            ),

            const SizedBox(height: 10),

            //Input price
            TextFormFieldCustom(
              prefixIcon: const Icon(Icons.attach_money_rounded),
              label: Text(itemModel.price!.toString()),
              obscureText: false,
              controller: _controllerPrice,
              inputFormatters: [
                utilService.maskText(_controllerPrice.text),
              ],
            ),

            const SizedBox(height: 10),

            //Input price offer
            TextFormFieldCustom(
              prefixIcon: const Icon(Icons.attach_money_rounded),
              label: Text(itemModel.priceOffer!.toString()),
              obscureText: false,
              controller: _controllerPriceOffer,
              inputFormatters: [
                utilService.maskText(_controllerPriceOffer.text),
              ],
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
              onPressed: () async {
                await itemController
                    .patch(
                      itemModel.id!,
                      _controllerName.text.isEmpty
                          ? itemModel.name
                          : _controllerName.text,
                      _controllerDescription.text.isEmpty
                          ? itemModel.description
                          : _controllerDescription.text,
                      _controllerPrice.text.isEmpty
                          ? itemModel.price
                          : double.parse(_controllerPrice.text),
                      _controllerPriceOffer.text.isEmpty
                          ? itemModel.priceOffer
                          : double.parse(_controllerPriceOffer.text),
                    )
                    .then((value) => Handlers.message(
                        message: "Item atualizado",
                        iconData: Icons.check,
                        context: context));
              },
              child: const Text("Confirmar"),
            ),
          )
        ],
      ),
    );
  }
}
