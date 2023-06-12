import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/shared/controllers/auth_controller.dart';
import 'package:pizzaria/src/shared/themes/colors/color_schemes.g.dart';
import 'package:pizzaria/src/views/auth/constants/signin.dart';
import 'package:pizzaria/src/views/auth/register_screen.dart';
import 'package:pizzaria/src/widgets/progress_custom.dart';
import 'package:pizzaria/src/widgets/textformfield_custom.dart';
import 'package:pizzaria/src/shared/services/util_service.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final List<TextEditingController> controllers = List.generate(
    SignInConstants.labels.length,
    (index) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    final utilService = UtilService();
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
                width: utilService.screenDeviceWidth(1, 4, context),
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
        SizedBox(
          width: utilService.screenDeviceWidth(1, 4, context),
          height: 48,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: lightColorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            onPressed: () async {
              await authController.signIn(
                  controllers[0].text, controllers[1].text, context);
            },
            icon: Obx(
              () => !authController.isLoading.value
                  ? Icon(Icons.login, color: lightColorScheme.background)
                  : ProgressCustom(
                      width: 25,
                      height: 25,
                      color: lightColorScheme.background,
                    ),
            ),
            label: Obx(
              () => Text(
                !authController.isLoading.value ? "Entrar" : "",
                style: TextStyle(color: lightColorScheme.background),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: utilService.screenDeviceWidth(1, 4, context),
          height: 48,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: lightColorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterScreen(),
                ),
              );
            },
            icon: Icon(Icons.person, color: lightColorScheme.background),
            label: Text(
              "Desejo criar minha conta",
              style: TextStyle(color: lightColorScheme.background),
            ),
          ),
        ),
      ],
    );
  }
}
