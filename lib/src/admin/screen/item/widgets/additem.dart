import 'package:flutter/material.dart';
import 'package:pizzaria/src/shared/controllers/item_controller.dart';
import 'package:pizzaria/src/shared/themes/colors/color_schemes.g.dart';
import 'package:pizzaria/src/services/util_service.dart';

class AddItemWindow extends StatelessWidget {
  const AddItemWindow({super.key});

  @override
  Widget build(BuildContext context) {
    final utilService = UtilService();
    final itemController = ItemController();

    return Container(
      padding: const EdgeInsets.all(12),
      width: utilService.screenDeviceWidth(2, 3, context),
      decoration: BoxDecoration(
        color: lightColorScheme.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Text(
            "Adicionar",
            style: TextStyle(fontSize: 36),
          ),
        ],
      ),
    );
  }
}
