import 'package:flutter/material.dart';
import 'package:pizzaria/src/admin/screen/item/widgets/additem.dart';
import 'package:pizzaria/src/shared/controllers/item_controller.dart';
import 'package:pizzaria/src/shared/models/item_model.dart';
import 'package:pizzaria/src/shared/themes/colors/color_schemes.g.dart';
import 'package:pizzaria/src/widgets/progress_custom.dart';

class ItemAdminScreen extends StatelessWidget {
  const ItemAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itemController = ItemController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerenciamento de itens"),
      ),
      body: FutureBuilder(
        future: itemController.get(),
        builder: (context, snapshot) {
          //Progress data.
          if (!snapshot.hasData) {
            return const ProgressCustom(
              height: 25,
              width: 25,
            );
          }

          //List items
          return ListView.separated(
              itemBuilder: (context, index) {
                //Constructor item model.
                final itemModel =
                    ItemModel.fromMap(snapshot.data?[index] ?? {});

                return ListTile(
                  title: Text(itemModel.name!),
                  subtitle: Text(
                      itemModel.description ?? "Não há descrição neste item"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //Delete
                      IconButton(
                        onPressed: () async {
                          await itemController.delete(itemModel.id!);
                        },
                        icon: const Icon(Icons.delete),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: snapshot.data?.length ?? 0);
        },
      ),

      //Add items
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  child: AddItemWindow(),
                ),
              ],
            ),
          );
        },
        label: const Text("Adicionar"),
      ),
    );
  }
}
