import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pizzaria/src/shared/controllers/item_controller.dart';
import 'package:pizzaria/src/shared/themes/colors/color_schemes.g.dart';
import 'package:pizzaria/src/shared/services/util_service.dart';
import 'package:pizzaria/src/widgets/textformfield_custom.dart';

final List<String> _labels = [
  'Nome',
  'Preço',
  'Preço oferta',
];

final List<IconData> _icons = [
  Icons.text_fields,
  Icons.monetization_on,
  Icons.monetization_on,
];

class AddItemWindow extends StatelessWidget {
  AddItemWindow({super.key});

  final _formsKey =
      List.generate(_labels.length, (index) => GlobalKey<FormState>());

  final controllers =
      List.generate(_labels.length, (index) => TextEditingController());

  final itemController = ItemController();

  @override
  Widget build(BuildContext context) {
    final utilService = UtilService();

    return Container(
      padding: const EdgeInsets.all(12),
      width: utilService.screenDeviceWidth(1.1, 3, context),
      decoration: BoxDecoration(
        color: lightColorScheme.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Title
          const Text(
            "Adicionar",
            style: TextStyle(fontSize: 36),
          ),

          //Inputs
          Column(
            children: List.generate(
              _labels.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8),
                child: Form(
                  key: _formsKey[index],
                  child: TextFormFieldCustom(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Este campo é obrigatório";
                      }

                      return null;
                    },
                    inputFormatters: [
                      index.isEqual(1)
                          ? utilService.maskText(controllers[1].text)
                          : index.isEqual(2)
                              ? utilService.maskText(controllers[2].text)
                              : MaskTextInputFormatter(),
                    ],
                    controller: controllers[index],
                    label: Text(_labels[index]),
                    obscureText: false,
                    prefixIcon: Icon(_icons[index]),
                  ),
                ),
              ),
            ),
          ),

          //Button
          SizedBox(
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: lightColorScheme.primary,
                foregroundColor: lightColorScheme.onTertiary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                List.generate(_formsKey.length, (index) async {
                  if (_formsKey[index].currentState!.validate()) {
                    return await itemController.post(
                      controllers[0].text,
                      double.parse(controllers[1].text),
                      double.parse(controllers[2].text),
                    );
                  }
                });
              },
              child: const Text("Confirmar"),
            ),
          ),
        ],
      ),
    );
  }
}
