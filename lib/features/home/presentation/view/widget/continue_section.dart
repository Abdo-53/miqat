import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/features/home/presentation/view/widget/continue_listen.dart';
import 'package:miqat/features/home/presentation/view/widget/continue_read.dart';

class ContinueSection extends StatelessWidget {
  const ContinueSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        children: [
          Expanded(child: ContinueListen()),

          SizedBox(width: 10.w),

          Expanded(child: ContinueRead()),
        ],
      ),
    );
  }
}
