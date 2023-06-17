import 'package:flutter/material.dart';
import 'package:pizzaria/src/shared/controllers/user_controller.dart';
import 'package:pizzaria/src/shared/handlers/handlers.dart';
import 'package:pizzaria/src/shared/models/user_model.dart';
import 'package:pizzaria/src/shared/services/util_service.dart';
import 'package:pizzaria/src/widgets/textformfield_custom.dart';

class ComomUserDetailsScreen extends StatelessWidget {
  final UserModel userModel;
  ComomUserDetailsScreen({super.key, required this.userModel});

  final _controllerEmail = TextEditingController();
  final _controllerAddress = TextEditingController();
  final _controllerNumberPhone = TextEditingController();

  final utilService = UtilService();
  final userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userModel.email!),
      ),

      //Body
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Icon header
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 80,
                child: Icon(
                  Icons.person,
                  size: 80,
                ),
              ),
            ),

            //Input email
            TextFormFieldCustom(
              prefixIcon: const Icon(Icons.shopping_bag),
              label: Text(userModel.email!),
              obscureText: false,
              controller: _controllerEmail,
            ),

            const SizedBox(height: 10),

            //Input number phone
            TextFormFieldCustom(
              prefixIcon: const Icon(Icons.phone),
              label: Text(userModel.numberPhone!),
              obscureText: false,
              controller: _controllerNumberPhone,
              inputFormatters: [
                utilService.maskNumberPhone(_controllerNumberPhone.text),
              ],
            ),

            const SizedBox(height: 10),

            //Input address
            TextFormFieldCustom(
              prefixIcon: const Icon(Icons.edit_location_alt),
              label: Text(userModel.address!),
              obscureText: false,
              controller: _controllerAddress,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 65,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              onPressed: () async {
                await userController
                    .update(
                      id: userModel.id!,
                      numberPhone: _controllerNumberPhone.text.isEmpty
                          ? userModel.numberPhone
                          : _controllerNumberPhone.text,
                      address: _controllerAddress.text.isEmpty
                          ? userModel.address
                          : _controllerAddress.text,
                    )
                    .then((value) => Handlers.message(
                        message: "Usuário atualizado",
                        iconData: Icons.check,
                        context: context));
              },
              child: const Text("Confirmar"),
            ),
          )
        ],
      ),
    );
  }
}
