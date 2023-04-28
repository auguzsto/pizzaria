import 'package:flutter/material.dart';

class ProgressCustom extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;

  const ProgressCustom({super.key, this.width, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
