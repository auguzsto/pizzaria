import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/controllers/auth_controller.dart';
import 'package:pizzaria/src/controllers/menu_controller.dart';
import 'package:pizzaria/src/models/item_model.dart';
import 'package:pizzaria/src/services/util_service.dart';
import 'package:pizzaria/src/widgets/card_custom.dart';
import 'package:pizzaria/src/widgets/progress_custom.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menuController = CarteController();
    final utilService = UtilService();
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
              return CardCustom(itemModel: itemModel);
            },
          ),
        );
      },
    );
  }
}
