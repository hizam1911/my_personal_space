import 'package:flutter/material.dart';

class PasswordTEC extends StatelessWidget {
  final TextEditingController passwordTEC;
  PasswordTEC({super.key, required this.passwordTEC});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordTEC,
      decoration: InputDecoration(
        labelText: "Password",
      ),
      validator: (v) {
        if (v == null || v.isEmpty) return "Required";
        return null;
      },
    );
  }
}
