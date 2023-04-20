import 'package:flutter/material.dart';

class ProgressCustom extends StatelessWidget {
  final double? width;
  final double? height;

  const ProgressCustom({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
