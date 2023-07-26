import 'package:get/get.dart';
import 'package:pizzaria/src/shared/models/user_model.dart';
import 'package:pizzaria/src/shared/repository/cart_respoitory.dart';

class CartController extends GetxController {
  final cartRepository = CartRepository();

  RxBool isLoading = false.obs;

  Future<void> add(List<String> idItem) async {
    await cartRepository.add(idItem);
  }

  Stream<List> getByLikeStream(UserModel userModel) async* {
    yield* Stream.periodic(const Duration(seconds: 1),
            (_) => cartRepository.getByUserId(userModel))
        .asyncMap((event) async => await event);
  }

  Future<List> getByUserId(UserModel userModel) async {
    return await cartRepository.getByUserId(userModel);
  }

  Future<void> delete(String id) async {
    await cartRepository.delete(id);
  }
}
