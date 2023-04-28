import 'package:flutter/material.dart';
import 'package:pizzaria/src/common/controllers/menu_controller.dart';
import 'package:pizzaria/src/common/models/item_model.dart';
import 'package:pizzaria/src/services/util_service.dart';
import 'package:pizzaria/src/common/widgets/card_custom.dart';
import 'package:pizzaria/src/common/widgets/progress_custom.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
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
              final itemModel = ItemModel.fromMap(snapshot.data![index] ?? {});

              if (itemModel.priceOffer! > 1) {
                //Card
                return CardCustom(itemModel: itemModel);
              }

              return const SizedBox();
            },
          ),
        );
      },
    );
  }
}