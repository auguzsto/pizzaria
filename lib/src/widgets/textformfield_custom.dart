import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String? Function(String?)? validator;
  final Widget prefixIcon;
  final Widget label;
  final bool obscureText;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;

  const TextFormFieldCustom({
    super.key,
    this.validator,
    required this.prefixIcon,
    required this.label,
    required this.obscureText,
    required this.controller,
    this.inputFormatters,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
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
