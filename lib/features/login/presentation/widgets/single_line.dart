import 'package:flutter/material.dart';

class SingleLine extends StatelessWidget {
  const SingleLine({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      width: size.width * 0.4,
      color: Colors.grey.shade500,
    );
  }
}
