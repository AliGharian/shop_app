import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    required this.size,
    required this.title,
    this.onPressed,
  });

  final Size size;
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      disabledColor: Colors.grey.shade400,
      elevation: 5.0,
      minWidth: size.width,
      height: 50.0,
      color: Colors.blue,
      child: Text(
        title,
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
      onPressed: onPressed,
    );
  }
}
