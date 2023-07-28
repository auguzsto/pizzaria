import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/shared/controllers/user_controller.dart';
import 'package:pizzaria/src/shared/handlers/handlers.dart';
import 'package:pizzaria/src/shared/models/user_model.dart';
import 'package:pizzaria/src/shared/themes/colors/color_schemes.g.dart';
import 'package:pizzaria/src/views/admin/user/user_details_screen.dart';
import 'package:pizzaria/src/views/auth/register_screen.dart';
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
            padding: const EdgeInsets.only(top: 10),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final userModel = UserModel.fromMap(snapshot.data?[index] ?? {});
              return GestureDetector(
                onTap: () => Get.to(UserDetailsScreen(userModel: userModel)),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(userModel.email!),
                  trailing: IconButton(
                    onPressed: () async {
                      await userController.delete(id: userModel.id!).then(
                          (value) => Handlers.message(
                              message: "Usuário deletado",
                              iconData: Icons.check,
                              context: context));
                    },
                    icon: Icon(
                      Icons.delete,
                      color: lightColorScheme.error,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(RegisterScreen());
        },
        icon: const Icon(Icons.person_add),
        label: const Text("Registrar usuário"),
      ),
    );
  }
}
