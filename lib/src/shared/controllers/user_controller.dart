import 'package:get/get.dart';
import 'package:pizzaria/src/shared/repository/user_repository.dart';

class UserController implements IUser {
  final userRepository = UserRepository();
  @override
  Future<void> add() async {}

  @override
  Future<void> delete({required String id}) async {
    await userRepository.delete(id: id);
  }

  Stream<List> getByLikeStream() async* {
    yield* Stream.periodic(3.seconds, (_) => userRepository.get())
        .asyncMap((event) async => await event);
  }

  @override
  Future<List> get() async {
    return await userRepository.get();
  }

  @override
  Future<void> update(
      {required String id,
      String? password,
      String? numberPhone,
      String? address,
      int? vendor}) async {
    await userRepository.update(
      id: id,
      address: address,
      numberPhone: numberPhone,
      password: password,
      vendor: vendor,
    );
  }
}
