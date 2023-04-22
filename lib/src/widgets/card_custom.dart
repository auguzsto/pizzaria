import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizzaria/src/models/item_model.dart';
import 'package:pizzaria/src/screens/menu/constants/menu.dart';
import 'package:pizzaria/src/services/util_service.dart';
import 'package:pizzaria/src/themes/colors/color_schemes.g.dart';

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

          //Picture
          Image.network(
            "https://i0.wp.com/www.multarte.com.br/wp-content/uploads/2019/03/pizza-png-transparente.png?resize=600%2C600&ssl=1",
            height: screenSize.height < 800 ? 100 : 200,
            fit: BoxFit.contain,
          ),

          //Price
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: screenSize.width < 800 ? 60 : 98,
                height: screenSize.width < 800 ? 30 : 50,
                decoration: BoxDecoration(
                  color: lightColorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    utilService.convertToBRL(itemModel.price!),
                    style: GoogleFonts.robotoCondensed(
                        color: lightColorScheme.onTertiary,
                        fontSize: screenSize.width < 800 ? null : 22),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ],
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
                onPressed: () {},
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
