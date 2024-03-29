import 'package:get/get.dart';
import 'package:pizzaria/src/shared/models/user_model.dart';
import 'package:pizzaria/src/shared/repository/order_repository.dart';

class OrderController {
  final orderRepository = OrderRepository();
  Future<List> get() async {
    return await orderRepository.get();
  }

  Stream<List> getLikeStream() async* {
    yield* Stream.periodic(3.seconds, (_) => orderRepository.get())
        .asyncMap((event) async => await event);
  }

  Stream<List> getByUserLikeStream(UserModel userModel) async* {
    yield* Stream.periodic(const Duration(seconds: 3),
            (_) => orderRepository.getByUserId(userModel))
        .asyncMap((event) async => await event);
  }

  Future<void> post(List<String> idItem) async {
    await orderRepository
        .post(idItem)
        .then((value) => orderRepository.client.post(table: 'event'));
  }

  Future<List> getByUserId(UserModel? userModel) async {
    return await orderRepository.getByUserId(userModel);
  }

  Future<void> delete({required String id}) async {
    await orderRepository.delete(id: id);
  }
}
