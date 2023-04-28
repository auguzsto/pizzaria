import 'package:flutter/material.dart';
import 'package:pizzaria/src/common/screens/auth/constants/register.dart';
import 'package:pizzaria/src/common/widgets/textformfield_custom.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final List<TextEditingController> controllers = List.generate(
    RegisterConstants.labels.length,
    (index) => TextEditingController(),
  );

  final List<GlobalKey<FormState>> _formKey = List.generate(
      RegisterConstants.labels.length, (index) => GlobalKey<FormState>());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar conta"),
      ),
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Campo obrigatório";
                            }
                          },
                          prefixIcon: Icon(RegisterConstants.icons[index]),
                          label: Text(RegisterConstants.labels[index]),
                          obscureText: index == 1
                              ? true
                              : index == 2
                                  ? true
                                  : false,
                          controller: controllers[index]),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
              child: OutlinedButton(
                onPressed: () {
                  List.generate(RegisterConstants.labels.length, (index) {
                    if (_formKey[index].currentState!.validate()) {
                      Text("Data");
                    }
                  });
                },
                child: const Text("Criar minha conta"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
