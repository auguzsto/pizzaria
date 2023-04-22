import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizzaria/src/controllers/menu_controller.dart';
import 'package:pizzaria/src/models/item_model.dart';
import 'package:pizzaria/src/themes/colors/color_schemes.g.dart';
import 'package:pizzaria/src/widgets/progress_custom.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menuController = CarteController();
    final screenSize = MediaQuery.of(context).size;

    //Future
    return FutureBuilder(
      future: menuController.get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const ProgressCustom(
            height: 35,
            width: 35,
          );
        }

        //Grid
        return GridView.count(
          shrinkWrap: false,
          crossAxisCount: screenSize.height < 800 ? 2 : 4,
          children: List.generate(
            snapshot.data!.length,
            (index) {
              final itemModel = ItemModel.fromMap(snapshot.data?[index] ?? {});

              //Card
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          itemModel.name!,
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
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
