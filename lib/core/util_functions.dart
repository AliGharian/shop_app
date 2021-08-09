//this method just show a snackbar
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(content: Text(message.toString()));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
