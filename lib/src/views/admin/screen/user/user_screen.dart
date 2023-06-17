import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/shared/controllers/user_controller.dart';
import 'package:pizzaria/src/shared/models/user_model.dart';
import 'package:pizzaria/src/views/admin/screen/user/user_details_screen.dart';
import 'package:pizzaria/src/widgets/progress_custom.dart';

class UserAdminScreen extends StatelessWidget {
  const UserAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerenciamento de usuários"),
      ),

      //Body
      body: StreamBuilder(
        stream: userController.getByLikeStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const ProgressCustom();
          }

          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final userModel = UserModel.fromMap(snapshot.data?[index] ?? {});
              return GestureDetector(
                onTap: () => Get.to(UserDetailsScreen(userModel: userModel)),
                child: ListTile(
                  title: Text(userModel.email!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
