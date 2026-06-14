import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

enum FlushbarType { success, error, info }

void showFlushbar(
  BuildContext context, {
  required String message,
  required FlushbarType type,
}) {
  Color backgroundColor;
  IconData icon;

  switch (type) {
    case FlushbarType.success:
      backgroundColor = Colors.green.shade700;
      icon = Icons.check_circle;
      break;
    case FlushbarType.error:
      backgroundColor = Colors.red.shade700;
      icon = Icons.error;
      break;
    case FlushbarType.info:
      backgroundColor = Colors.blue.shade700;
      icon = Icons.info;
      break;
  }

  Flushbar(
    message: message,
    icon: Icon(icon, color: Colors.white),
    backgroundColor: backgroundColor,
    duration: const Duration(seconds: 3),
    borderRadius: BorderRadius.circular(12),
    margin: const EdgeInsets.all(16), // ✅ floating effect
    flushbarPosition: FlushbarPosition.TOP, // ✅ upar se aaye
    animationDuration: const Duration(milliseconds: 400),
  ).show(context);
}
