import 'package:get/get.dart';
import 'package:pizzaria/src/models/user_model.dart';
import 'package:pizzaria/src/repository/auth_respository.dart';

class AuthController extends GetxController {
  final authRepository = AuthRepository();
  Rx<UserModel> userModel = UserModel().obs;

  Future<void> signIn(String username, String password) async {
    await authRepository.signIn(username, password).then(
      (value) {
        if (value != null) {
          userModel.value = UserModel.fromMap(value);
          update();
          print(userModel.value.toJson());
        }
      },
    );
  }
}
