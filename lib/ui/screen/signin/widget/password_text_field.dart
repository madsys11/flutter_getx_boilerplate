import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final Icon? icon;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;

  const PasswordTextField(
      {Key? key,
      required this.controller,
      this.icon,
      this.hintText,
      this.validator,
      this.keyboardType,
      this.onChanged})
      : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: const TextStyle(color: Colors.black54),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.black54),
        icon: widget.icon,
        border: InputBorder.none,
        errorStyle: const TextStyle(height: 0),
        suffixIcon: InkWell(
          child: const Icon(
            Icons.visibility,
            color: Colors.black54,
          ),
          onTap: _togglePasswordView,
        ),
      ),
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      obscureText: _hidePassword,
    );
  }

  _togglePasswordView() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }
}
