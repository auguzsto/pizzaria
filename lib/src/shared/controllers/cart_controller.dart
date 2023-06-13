import 'package:get/get.dart';
import 'package:pizzaria/src/shared/models/user_model.dart';
import 'package:pizzaria/src/shared/repository/cart_respoitory.dart';

class CartController extends GetxController {
  final cartRepository = CartRepository();
  Future<void> add(List<String> idItem) async {
    await cartRepository.add(idItem);
    update();
  }

  Future<List> getByUserId(UserModel userModel) async {
    return await cartRepository.getByUserId(userModel);
  }

  Future<void> delete(String id) async {
    cartRepository.delete(id);
    update();
  }
}
