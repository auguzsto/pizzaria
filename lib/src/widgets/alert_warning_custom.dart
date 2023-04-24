import 'package:flutter/material.dart';
import 'package:pizzaria/src/constants/app.dart';

class AlertWarningCustom extends StatelessWidget {
  const AlertWarningCustom({super.key});

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
            AppConsntats.naoAutorizado,
            style: const TextStyle(fontSize: 32),
          ),
          Text(AppConsntats.msgEfetuarLogin),
        ],
      ),
    );
  }
}
