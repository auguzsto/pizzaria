import 'package:flutter/material.dart';
import 'package:pizzaria/src/shared/controllers/item_controller.dart';
import 'package:pizzaria/src/shared/models/item_model.dart';

class ItemAdminDetailsScreen extends StatelessWidget {
  final String id;
  ItemAdminDetailsScreen({super.key, required this.id});

  final itemController = ItemController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: itemController.getById(id: id),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final itemModel = ItemModel.fromMap(snapshot.data?[0] ?? {});
        return Scaffold(
          appBar: AppBar(
            title: Text(itemModel.name!),
          ),
        );
      },
    );
  }
}
