import 'package:flutter/material.dart';

class LoginWithButton extends StatelessWidget {
  final Size size;
  final String title;
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onPressed;
  const LoginWithButton({
    required this.size,
    required this.title,
    required this.icon,
    required this.iconColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      disabledTextColor: Colors.grey.shade100,
      elevation: 5.0,
      minWidth: size.width,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
