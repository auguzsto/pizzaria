import 'package:get/get.dart';
import 'package:pizzaria/src/shared/models/user_model.dart';
import 'package:pizzaria/src/shared/services/http_client.dart';

abstract class IUser {
  Future<List> get();
  Future<void> add();
  Future<void> update(
      {required String id,
      String? password,
      String? numberPhone,
      String? address,
      int? vendor});
  Future<void> delete({required String id});
}

class UserRepository implements IUser {
  final client = HttpClient();
  @override
  Future<void> add() async {}

  @override
  Future<void> delete({required String id}) async {
    await client.deleteByQuery(
      table: 'user',
      id: id,
      headers: {
        "Authorization": "Basic ${Get.find<UserModel>(tag: "user").basicToken}"
      },
    );
  }

  @override
  Future<void> update(
      {required String id,
      String? password,
      String? numberPhone,
      String? address,
      int? vendor}) async {
    await client.patch(
      table: 'user',
      body: {
        "id": id,
        "password": password,
        "numberPhone": numberPhone,
        "address": address,
      },
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Basic ${Get.find<UserModel>(tag: "user").basicToken}"
      },
    );
  }

  @override
  Future<List> get() async {
    return await client.get(table: "user");
  }
}
