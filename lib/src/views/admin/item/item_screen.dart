import 'package:flutter/material.dart';
import 'package:pizzaria/src/views/admin/item/item_details_screen.dart';
import 'package:pizzaria/src/views/admin/item/widgets/additem.dart';
import 'package:pizzaria/src/shared/services/util_service.dart';
import 'package:pizzaria/src/shared/controllers/item_controller.dart';
import 'package:pizzaria/src/shared/models/item_model.dart';
import 'package:pizzaria/src/shared/themes/colors/color_schemes.g.dart';
import 'package:pizzaria/src/widgets/progress_custom.dart';

class ItemAdminScreen extends StatefulWidget {
  const ItemAdminScreen({super.key});

  @override
  State<ItemAdminScreen> createState() => _ItemAdminScreenState();
}

class _ItemAdminScreenState extends State<ItemAdminScreen> {
  final itemController = ItemController();
  final utilService = UtilService();

  @override
  void initState() {
    itemController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerenciamento de itens"),
      ),
      body: StreamBuilder(
        stream: itemController.getLikeStream(),
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

                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemAdminDetailsScreen(
                        itemModel: itemModel,
                      ),
                    ),
                  ),
                  child: ListTile(
                    title: Text(itemModel.name!),
                    subtitle: Text(
                        itemModel.description ?? "Não há descrição neste item"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //Price
                        IconButton(
                          onPressed: () {},
                          icon: Text(
                            utilService.convertToBRL(itemModel.price!),
                          ),
                        ),
                        //Delete
                        IconButton(
                          onPressed: () async {
                            await itemController.delete(itemModel.id!);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: lightColorScheme.error,
                          ),
                        )
                      ],
                    ),
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
            builder: (context) => const Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AddItemWindow(),
              ],
            ),
          );
        },
        label: const Text("Adicionar"),
      ),
    );
  }
}
