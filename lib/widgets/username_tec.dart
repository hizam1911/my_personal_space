import 'package:flutter/material.dart';

class UsernameTEC extends StatelessWidget {
  final TextEditingController usernameTEC;
  UsernameTEC({super.key, required this.usernameTEC});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: usernameTEC,
      decoration: InputDecoration(
        labelText: "Username",
      ),
      validator: (v) {
        if (v == null || v.isEmpty) return "Required";
        return null;
      },
    );
  }
}
