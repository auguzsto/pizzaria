import 'package:pizzaria/src/models/user_model.dart';
import 'package:pizzaria/src/repository/order_repository.dart';

class OrderController {
  final orderRepository = OrderRepository();
  Future<List> get() async {
    return await orderRepository.get();
  }

  Future<List> getByUserId(UserModel? userModel) async {
    return await orderRepository.getByUserId(userModel);
  }
}
