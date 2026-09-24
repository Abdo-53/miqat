import 'package:flutter/material.dart';
import 'package:miqat/core/const/app_color.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
    this.size = 34,
    this.strokeWidth = 3.5,
    this.color =  AppColor.primary,
  });

  final double size;
  final double strokeWidth;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          color: color,
          strokeCap: StrokeCap.round,
        ),
      ),
    );
  }
}
