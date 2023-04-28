import 'package:flutter/material.dart';
import 'package:pizzaria/src/common/constants/app.dart';

class AlertWarningCustom extends StatelessWidget {
  final String title;
  final String message;
  const AlertWarningCustom({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            maxRadius: 148,
            child: Icon(
              AppConsntats.warning,
              size: 138,
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 32),
          ),
          Text(message),
        ],
      ),
    );
  }
}
