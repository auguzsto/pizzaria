import 'package:pizzaria/src/shared/repository/menu_repository.dart';

class ItemController {
  final itemController = ItemRepository();
  Future<List> get() async {
    return await itemController.get();
  }

  Future<List> getById({required String id}) async {
    return await itemController.getById(id: id);
  }
}
