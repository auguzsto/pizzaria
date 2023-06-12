import 'package:pizzaria/src/shared/models/user_model.dart';
import 'package:pizzaria/src/shared/repository/order_repository.dart';

class OrderController {
  final orderRepository = OrderRepository();
  Future<List> get() async {
    return await orderRepository.get();
  }

  Future<void> post(List<String> idItem) async {
    await orderRepository.post(idItem);
  }

  Future<List> getByUserId(UserModel? userModel) async {
    return await orderRepository.getByUserId(userModel);
  }
}
