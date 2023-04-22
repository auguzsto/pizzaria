import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/controllers/auth_controller.dart';
import 'package:pizzaria/src/screens/auth/constants/signin.dart';
import 'package:pizzaria/src/widgets/progress_custom.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final List<TextEditingController> controllers = List.generate(
    SignInConstants.labels.length,
    (index) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    return Scaffold(
      //Appbar
      appBar: AppBar(
        title: const Text("Acessar conta"),
      ),

      //Body
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CircleAvatar(
              maxRadius: 140,
              child: Icon(
                Icons.person,
                size: 130,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(44),
                itemCount: SignInConstants.labels.length,
                itemBuilder: (context, index) {
                  return TextFormField(
                    controller: controllers[index],
                    decoration: InputDecoration(
                      hintText: SignInConstants.labels[index],
                      prefixIcon: Icon(SignInConstants.icons[index]),
                    ),
                  );
                },
              ),
            ),
            Obx(
              () => !authController.isLoading.value
                  ? ElevatedButton.icon(
                      onPressed: () async {
                        await authController.signIn(
                          controllers[0].text,
                          controllers[1].text,
                          context,
                        );
                      },
                      icon: const Icon(Icons.login),
                      label: const Text("Acessar"),
                    )
                  : const Center(
                      child: ProgressCustom(),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
