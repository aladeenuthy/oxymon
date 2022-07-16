import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType? keyBoardType;
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  const InputField(
      {Key? key,
      required this.labelText,
      this.controller,
      this.keyBoardType,
      this.validator,
      this.onChanged,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      key: Key(labelText),
      controller: controller,
      validator: validator,
      keyboardType: keyBoardType ?? TextInputType.text,
      obscureText: labelText == "Password" ? true : false,
      decoration: InputDecoration(
        label: Text(labelText),
      ),
    );
  }
}
