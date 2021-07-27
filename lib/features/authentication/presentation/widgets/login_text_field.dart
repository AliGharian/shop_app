import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String hintTitle;
  final IconData icon;
  final Function(String) onChanged;
  const LoginTextField({
    required this.hintTitle,
    required this.icon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintTitle,
        helperText: '',
        prefixIcon: Icon(
          icon,
        ),
        prefixText: ' ',
        helperStyle: TextStyle(
          color: Colors.red,
        ),
      ),
      onChanged: onChanged,
    );
  }
}