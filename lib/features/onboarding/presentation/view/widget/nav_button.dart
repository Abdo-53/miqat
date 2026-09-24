import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';

class NavButton extends StatefulWidget {
  const NavButton({
    super.key,
    required this.text,
    this.onTap,
    this.color,
    this.isOutlined = false,
    this.icon,
    this.iconAtStart = false,
  });

  final String text;
  final VoidCallback? onTap;
  final Color? color;
  final bool isOutlined;
  final IconData? icon;
  final bool iconAtStart;

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final primaryColor = widget.color ?? AppColor.primary;

    return AnimatedScale(
      scale: _isPressed ? 0.96 : 1.0,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
      child: Material(
        color: widget.isOutlined ? Colors.transparent : primaryColor,
        borderRadius: BorderRadius.circular(14.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(14.r),
          onTap: widget.onTap,
          onTapDown: (_) {
            setState(() {
              _isPressed = true;
            });
          },
          onTapUp: (_) {
            setState(() {
              _isPressed = false;
            });
          },
          onTapCancel: () {
            setState(() {
              _isPressed = false;
            });
          },
          child: Container(
            width: 100.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              border: widget.isOutlined
                  ? Border.all(color: primaryColor, width: 1.6)
                  : null,
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.icon != null && widget.iconAtStart) ...[
                    Icon(
                      widget.icon,
                      size: 18.sp,
                      color: widget.isOutlined
                          ? primaryColor
                          : AppColor.background1,
                    ),
                    SizedBox(width: 6.w),
                  ],

                  Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.titleLarge.copyWith(
                      color: widget.isOutlined
                          ? primaryColor
                          : AppColor.background1,
                    ),
                  ),

                  if (widget.icon != null && !widget.iconAtStart) ...[
                    SizedBox(width: 6.w),
                    Icon(
                      widget.icon,
                      size: 18.sp,
                      color: widget.isOutlined
                          ? primaryColor
                          : AppColor.background1,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
