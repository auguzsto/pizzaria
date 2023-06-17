import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pizzaria/src/shared/controllers/auth_controller.dart';
import 'package:pizzaria/src/shared/handlers/handlers.dart';
import 'package:pizzaria/src/views/auth/constants/register.dart';
import 'package:pizzaria/src/widgets/dialog_item.dart';
import 'package:pizzaria/src/widgets/textformfield_custom.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final List<TextEditingController> _controllers = List.generate(
    RegisterConstants.labels.length,
    (index) => TextEditingController(),
  );

  final List<GlobalKey<FormState>> _formKey = List.generate(
      RegisterConstants.labels.length, (index) => GlobalKey<FormState>());
  final authController = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar conta"),
      ),

      //Content
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: List.generate(
                  RegisterConstants.labels.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey[index],
                      child: TextFormFieldCustom(
                        prefixIcon: Icon(RegisterConstants.icons[index]),
                        label: Text(RegisterConstants.labels[index]),
                        obscureText: index == 1
                            ? true
                            : index == 2
                                ? true
                                : false,
                        controller: _controllers[index],
                        inputFormatters: [
                          index.isEqual(5)
                              ? utilService
                                  .maskNumberPhone(_controllers[5].text)
                              : index.isEqual(4)
                                  ? utilService.maskCep(_controllers[4].text)
                                  : MaskTextInputFormatter()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      //Confirm button.
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 66,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0))),
              onPressed: () async {
                await authController
                    .signUp(
                        _controllers[0].text, //Username
                        _controllers[1].text, //Password
                        _controllers[2].text, //RePassword
                        _controllers[3].text, //Address
                        _controllers[4].text, //CEP
                        _controllers[5].text, //Number Phone
                        context)
                    .then((value) => Handlers.message(
                        message: "Sua conta foi criada com sucesso",
                        iconData: Icons.check,
                        context: context));
              },
              child: const Text("Confirmar"),
            ),
          ),
        ],
      ),
    );
  }
}
