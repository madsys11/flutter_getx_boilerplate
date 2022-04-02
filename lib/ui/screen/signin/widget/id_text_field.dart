import 'package:flutter/material.dart';

class IdTextField extends StatelessWidget {
  final TextEditingController controller;
  final Icon? icon;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;

  const IdTextField(
      {Key? key,
      required this.controller,
      this.icon,
      this.hintText,
      this.validator,
      this.keyboardType,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.black54),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black54),
        icon: icon,
        border: InputBorder.none,
        errorStyle: const TextStyle(height: 0),
      ),
      validator: validator,
      keyboardType: keyboardType,
      onChanged: onChanged,
    );
  }
}
