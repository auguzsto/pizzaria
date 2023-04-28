import 'package:pizzaria/src/common/repository/menu_repository.dart';

class CarteController {
  final menuRepository = MenuRepository();
  Future<List> get() async {
    return await menuRepository.get();
  }

  Future<List> getById({required String id}) async {
    return await menuRepository.getById(id: id);
  }
}
