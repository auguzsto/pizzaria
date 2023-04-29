import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizzaria/src/common/screens/auth/register_screen.dart';
import 'package:pizzaria/src/common/screens/auth/signin_screen.dart';
import 'package:pizzaria/src/common/themes/colors/color_schemes.g.dart';
import 'package:pizzaria/src/widgets/alert_warning_custom.dart';

class AlertSignInCustom extends StatelessWidget {
  const AlertSignInCustom({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenDevice = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: lightColorScheme.background,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AlertWarningCustom(
                  title: "Acesse sua conta",
                  message: "É necessário estar logado para efetuar um pedido",
                ),
                const SizedBox(height: 10),
                //Button SignIn
                SizedBox(
                  width: screenDevice.width < 800
                      ? screenDevice.width
                      : screenDevice.width / 5,
                  height: 42,
                  child: OutlinedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      showDialog(
                        context: context,
                        builder: (context) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(32),
                              decoration: BoxDecoration(
                                color: lightColorScheme.onTertiary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: SignInScreen(),
                            )
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.login),
                    label: const Text(
                      "Acessar minha conta",
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Divider(),
                const SizedBox(height: 5),
                SizedBox(
                  width: screenDevice.width < 800
                      ? screenDevice.width
                      : screenDevice.width / 5,
                  height: 42,
                  child: OutlinedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Get.to(RegisterScreen());
                    },
                    icon: const Icon(Icons.person),
                    label: const Text(
                      "Criar uma conta",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
