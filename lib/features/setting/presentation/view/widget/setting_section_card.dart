import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingSectionCard extends StatelessWidget {
  const SettingSectionCard({super.key, required this.tiles});
  final List<Widget> tiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            spreadRadius: 2,
            blurRadius: 5,
            // changes position of shadow
          ),
        ],
      ),
      child: Column(children: tiles),
    );
  }
}
