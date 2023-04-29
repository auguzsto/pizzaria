import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  String? Function(String?)? validator;
  final Widget prefixIcon;
  final Widget label;
  final bool obscureText;
  final TextEditingController controller;

  TextFormFieldCustom({
    super.key,
    this.validator,
    required this.prefixIcon,
    required this.label,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        label: label,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
