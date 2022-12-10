import 'package:flutter/material.dart';

class SnackMessenger {
  void showSuccessSnack(BuildContext ctx, String msg) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(msg),
      ),
    );
  }

  void showErrorSnack(BuildContext ctx, String msg) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(msg),
      ),
    );
  }
}
