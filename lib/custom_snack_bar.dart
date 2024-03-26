import 'package:flutter/material.dart';

class CustomSnackBar {
  static void showErrorSnackBar(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        content: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static void showSuccessSnackBar(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        content: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static void showWarningSnackBar(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.yellow,
        content: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static void showDefaultSnackBar(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(text),
      ),
    );
  }
}
