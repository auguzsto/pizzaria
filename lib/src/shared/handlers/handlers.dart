import 'package:flutter/material.dart';

class Handlers {
  //Error
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> error({
    required String message,
    required BuildContext context,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(message),
            ],
          ),
        ),
      ),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> message({
    required String message,
    required BuildContext context,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(message),
            ],
          ),
        ),
      ),
    );
  }
}
