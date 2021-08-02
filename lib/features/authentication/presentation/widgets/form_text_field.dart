import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String hintTitle;
  final IconData icon;
  final String helperText;
  final bool readOnly;
  final Function(String) onChanged;
  const FormTextField({
    required this.hintTitle,
    required this.icon,
    required this.helperText,
    required this.readOnly,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintTitle,
        helperText: helperText,
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
