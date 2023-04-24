import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/controllers/auth_controller.dart';
import 'package:pizzaria/src/screens/auth/constants/signin.dart';
import 'package:pizzaria/src/themes/colors/color_schemes.g.dart';
import 'package:pizzaria/src/widgets/progress_custom.dart';
import 'package:pizzaria/src/widgets/textformfield_custom.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final List<TextEditingController> controllers = List.generate(
    SignInConstants.labels.length,
    (index) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Icon title.
            CircleAvatar(
              child: Icon(
                Icons.login,
                color: lightColorScheme.onBackground,
              ),
            ),

            const SizedBox(width: 10),

            //Title
            Text(
              "Acessar conta",
              style: TextStyle(
                fontSize: 32,
                color: lightColorScheme.onBackground,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        //Input
        Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            SignInConstants.labels.length,
            (index) => Material(
              color: Colors.transparent,
              child: SizedBox(
                width: 360,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormFieldCustom(
                    controller: controllers[index],
                    obscureText: index.isEqual(1) ? true : false,
                    prefixIcon: Icon(SignInConstants.icons[index]),
                    label: Text(SignInConstants.labels[index]),
                  ),
                ),
              ),
            ),
          ),
        ),

        //Button
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: lightColorScheme.primaryContainer,
                width: 1,
              ),
            ),
            elevation: 0,
          ),
          onPressed: () async {
            await authController.signIn(
                controllers[0].text, controllers[1].text, context);
          },
          icon: const Icon(Icons.login),
          label: const Text(
            "Entrar",
          ),
        )
      ],
    );
  }
}
