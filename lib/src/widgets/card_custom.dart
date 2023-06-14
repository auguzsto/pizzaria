import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizzaria/src/shared/constants/app.dart';
import 'package:pizzaria/src/shared/controllers/cart_controller.dart';
import 'package:pizzaria/src/shared/handlers/handlers.dart';
import 'package:pizzaria/src/shared/models/item_model.dart';
import 'package:pizzaria/src/shared/models/user_model.dart';
import 'package:pizzaria/src/shared/services/util_service.dart';
import 'package:pizzaria/src/shared/themes/colors/color_schemes.g.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/views/client/menu/constants/menu.dart';
import 'package:pizzaria/src/widgets/alert_signin_custom.dart';

class CardCustom extends StatelessWidget {
  final ItemModel itemModel;

  const CardCustom({
    super.key,
    required this.itemModel,
  });

  @override
  Widget build(BuildContext context) {
    final utilService = UtilService();
    final screenSize = MediaQuery.of(context).size;
    final userModel = Get.find<UserModel>(tag: "user");
    final cartController = CartController();
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Title
          Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              color: lightColorScheme.primary,
            ),
            child: Center(
              child: Text(
                itemModel.name!.toUpperCase(),
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: lightColorScheme.background,
                  ),
                ),
              ),
            ),
          ),

          //Price
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Image.network(
                    "https://i0.wp.com/www.multarte.com.br/wp-content/uploads/2019/03/pizza-png-transparente.png?resize=600%2C600&ssl=1",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: screenSize.width < 800 ? 60 : 60,
                        height: screenSize.width < 800 ? 30 : 40,
                        decoration: BoxDecoration(
                          color: lightColorScheme.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            utilService.convertToBRL(itemModel.price!),
                            style: GoogleFonts.robotoCondensed(
                                color: lightColorScheme.onTertiary,
                                fontSize: screenSize.width < 800 ? null : 15),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 3,
          ),

          //Buttom
          Container(
            width: screenSize.width,
            height: screenSize.width < 800 ? 42 : 60,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              color: lightColorScheme.primary,
            ),
            child: Center(
              child: IconButton(
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
                    await cartController.add([itemModel.id!]).then((_) =>
                        Handlers.message(
                            message: AppConstants.adicionadoCarrinho,
                            context: context));
                  }
                },
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      maxRadius: screenSize.width < 800 ? null : 18,
                      child: Icon(
                        MeuConstants.iconPedirAgora,
                        size: screenSize.width < 800 ? 18 : null,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      MeuConstants.pedirAgora.toUpperCase(),
                      style: GoogleFonts.robotoCondensed(
                          color: lightColorScheme.onTertiary,
                          fontSize: screenSize.width < 800 ? null : 22),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
