import 'package:pizzaria/src/repository/order_repository.dart';

class OrderController {
  final orderRepository = OrderRepository();
  Future<List> get() async {
    return await orderRepository.get();
  }
}
