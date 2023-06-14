import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/shared/constants/app.dart';
import 'package:pizzaria/src/shared/controllers/cart_controller.dart';
import 'package:pizzaria/src/shared/handlers/handlers.dart';
import 'package:pizzaria/src/shared/models/item_model.dart';
import 'package:pizzaria/src/shared/models/user_model.dart';
import 'package:pizzaria/src/shared/services/util_service.dart';
import 'package:pizzaria/src/shared/themes/colors/color_schemes.g.dart';
import 'package:pizzaria/src/widgets/alert_signin_custom.dart';

class DialogItem extends StatelessWidget {
  final ItemModel itemModel;

  const DialogItem({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    final userModel = Get.find<UserModel>(tag: "user");
    final cartController = CartController();
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width < 800 ? null : 480,
        decoration: BoxDecoration(
          color: lightColorScheme.onError,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Title
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Text(
                itemModel.name ?? "Não há informaões",
                style: TextStyle(fontSize: 29, color: lightColorScheme.error),
              ),
            ),

            //Divider
            Divider(
              color: lightColorScheme.error,
            ),

            const SizedBox(height: 25),

            //Image
            Image.network(
              itemModel.imageUrl ?? "",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width < 800 ? 290 : 435,
            ),

            //Description
            Text(itemModel.description ?? "Não há informações"),

            const SizedBox(height: 25),

            //Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Text(
                    utilService.convertToBRL(itemModel.price!),
                    style: const TextStyle(fontSize: 22),
                  ),
                ),

                //Button
                Obx(
                  () => SizedBox(
                    height: 77,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 177, 30, 19),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(12)),
                          ),
                        ),
                        onPressed: () async {
                          if (userModel.basicToken == null) {
                            showDialog(
                              context: context,
                              builder: (context) => const Padding(
                                padding: EdgeInsets.all(18),
                                child: AlertSignInCustom(),
                              ),
                            );
                          } else {
                            cartController.isLoading.value = true;

                            await Future.delayed(const Duration(seconds: 3));

                            //Adding item cart.
                            await cartController.add([itemModel.id!]).then(
                              (_) {
                                Handlers.message(
                                    message: AppConstants.adicionadoCarrinho,
                                    iconData: Icons.shopping_bag,
                                    context: context);

                                Navigator.pop(context);
                              },
                            );

                            cartController.isLoading.value = false;
                          }
                        },
                        child: !cartController.isLoading.value
                            ? const Text(
                                "Adicionar ao carrinho",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

final utilService = UtilService();
