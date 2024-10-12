import 'package:flutter/material.dart';

class customTextFeild extends StatelessWidget {
  customTextFeild({
    super.key,
    this.hint,
    this.onChanged,
    this.obscureText = false,
  });
 bool obscureText;
  String? hint;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Feild is required';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
