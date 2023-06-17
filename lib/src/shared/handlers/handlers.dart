import 'package:flutter/material.dart';

class Handlers {
  //Error
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> error({
    required String message,
    required BuildContext context,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Container(
          height: 66,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.red.shade100,
                    foregroundColor: Colors.red.shade900,
                    child: const Icon(Icons.error),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    message,
                    style: const TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> message({
    required String message,
    required IconData iconData,
    required BuildContext context,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Container(
          height: 66,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.green.shade100,
                    foregroundColor: Colors.green.shade900,
                    child: Icon(iconData),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    message,
                    style: const TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
