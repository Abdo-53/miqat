import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/features/home/presentation/manager/cubit/qibla_cubit.dart';
import 'package:miqat/features/home/presentation/manager/cubit/qibla_state.dart';
import 'package:miqat/generated/l10n.dart';

class QiblaViewBody extends StatefulWidget {
  const QiblaViewBody({super.key});

  @override
  State<QiblaViewBody> createState() => _QiblaViewBodyState();
}

class _QiblaViewBodyState extends State<QiblaViewBody>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Future.delayed(const Duration(milliseconds: 800), () {
        if (mounted) {
          context.read<QiblaCubit>().initialize();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(S.of(context).home_qibla, style: AppTextStyle.titleLarge),
      ),
      body: BlocBuilder<QiblaCubit, QiblaState>(
        builder: (context, state) {
          if (state is QiblaLoading || state is QiblaInitial) {
            return Center(
              child: CircularProgressIndicator(color: colorScheme.primary),
            );
          }

          if (state is QiblaLocationDisabled) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 72.w,
                      height: 72.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorScheme.primary.withValues(alpha: 0.10),
                      ),
                      child: Icon(
                        Icons.location_off_rounded,
                        size: 42.sp,
                        color: colorScheme.primary.withValues(alpha: 0.75),
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Text(
                      S.of(context).qiblaLocationDisabled,
                      style: AppTextStyle.titleMedium.copyWith(
                        color: AppColor.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is QiblaReady) {
            final direction = state.direction;
            final relativeDirection = direction.relativeDirection;

            final isAligned =
                relativeDirection <= 1 || relativeDirection >= 359;

            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    SizedBox(height: 16.h),

                    Text(
                      S.of(context).qiblaDirection,
                      style: AppTextStyle.titleMedium.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),

                    SizedBox(height: 6.h),

                    Text(
                      '${direction.bearing.toStringAsFixed(0)}°',
                      style: AppTextStyle.displayMedium.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 20.h),

                    Expanded(
                      child: Center(
                        child: _Compass(
                          relativeDirection: relativeDirection,
                          isAligned: isAligned,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),

                    AnimatedContainer(
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeOutCubic,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withValues(
                          alpha: isAligned ? .14 : .07,
                        ),
                        borderRadius: BorderRadius.circular(24.r),
                        border: Border.all(
                          color: colorScheme.primary.withValues(alpha: .35),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isAligned
                                ? Icons.check_circle_rounded
                                : Icons.explore_rounded,
                            size: 20.sp,
                            color: colorScheme.primary,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            isAligned
                                ? S.of(context).qiblaAligned
                                : S.of(context).qiblaTurnPhone,
                            style: AppTextStyle.bodyLarge.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _Compass extends StatefulWidget {
  const _Compass({required this.relativeDirection, required this.isAligned});

  final double relativeDirection;
  final bool isAligned;

  @override
  State<_Compass> createState() => _CompassState();
}

class _CompassState extends State<_Compass> {
  double _rotation = 0;

  @override
  void initState() {
    super.initState();
    _rotation = widget.relativeDirection;
  }

  @override
  void didUpdateWidget(covariant _Compass oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.relativeDirection != widget.relativeDirection) {
      _updateRotation(widget.relativeDirection);
    }

    // Vibrate only when entering the correct direction.
    if (!oldWidget.isAligned && widget.isAligned) {
      HapticFeedback.heavyImpact();
    }
  }

  void _updateRotation(double newDirection) {
    final current = _normalizeAngle(_rotation);

    double difference = newDirection - current;

    // Prevent 360° jumps.
    if (difference > 180) {
      difference -= 360;
    } else if (difference < -180) {
      difference += 360;
    }

    setState(() {
      _rotation += difference;
    });
  }

  double _normalizeAngle(double angle) {
    final normalized = angle % 360;

    if (normalized < 0) {
      return normalized + 360;
    }

    return normalized;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = math.min(constraints.maxWidth, constraints.maxHeight);

        final compassSize = math.min(size, 320.w);

        return SizedBox(
          width: compassSize,
          height: compassSize + 42.h,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // ----------------------------------------------------------
              // Rotating compass + rotating Qibla indicator
              // ----------------------------------------------------------
              Positioned(
                top: 20.h,
                left: 0,
                right: 0,
                child: AnimatedRotation(
                  turns: _rotation / 360,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  child: SizedBox(
                    width: compassSize,
                    height: compassSize,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Compass ring
                        CustomPaint(
                          size: Size.square(compassSize),
                          painter: _CompassPainter(
                            primaryColor: colorScheme.primary,
                            surfaceColor: colorScheme.surface,
                          ),
                        ),

                        // Qibla indicator in the center
                        Container(
                          width: compassSize * .19,
                          height: compassSize * .19,
                          decoration: BoxDecoration(
                            color: colorScheme.surface,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: colorScheme.primary,
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: .08),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.mosque_rounded,
                            color: colorScheme.primary,
                            size: compassSize * .095,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // ----------------------------------------------------------
              // Fixed direction pointer
              // ----------------------------------------------------------
              Positioned(
                top: 0,
                child: Transform.rotate(
                  angle: math.pi,
                  child: Icon(
                    Icons.navigation_rounded,
                    size: compassSize * .11,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CompassPainter extends CustomPainter {
  const _CompassPainter({
    required this.primaryColor,
    required this.surfaceColor,
  });

  final Color primaryColor;
  final Color surfaceColor;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2;

    // Outer background
    final outerPaint = Paint()
      ..color = primaryColor.withValues(alpha: .18)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, outerPaint);

    // Outer border
    final borderPaint = Paint()
      ..color = primaryColor.withValues(alpha: .65)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(center, radius - 2, borderPaint);

    // Inner surface
    final innerPaint = Paint()
      ..color = surfaceColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius - 14, innerPaint);

    // Compass ticks
    final tickPaint = Paint()
      ..color = primaryColor.withValues(alpha: .45)
      ..strokeWidth = 1.5;

    for (int i = 0; i < 36; i++) {
      final angle = i * math.pi / 18;

      final outerPoint = Offset(
        center.dx + math.sin(angle) * (radius - 20),
        center.dy - math.cos(angle) * (radius - 20),
      );

      final innerPoint = Offset(
        center.dx + math.sin(angle) * (radius - (i % 3 == 0 ? 30 : 25)),
        center.dy - math.cos(angle) * (radius - (i % 3 == 0 ? 30 : 25)),
      );

      canvas.drawLine(outerPoint, innerPoint, tickPaint);
    }

    // Directions
    _drawDirection(canvas, center, radius, 'N', 0);

    _drawDirection(canvas, center, radius, 'E', math.pi / 2);

    _drawDirection(canvas, center, radius, 'S', math.pi);

    _drawDirection(canvas, center, radius, 'W', 3 * math.pi / 2);
  }

  void _drawDirection(
    Canvas canvas,
    Offset center,
    double radius,
    String text,
    double angle,
  ) {
    final position = Offset(
      center.dx + math.sin(angle) * (radius - 48),
      center.dy - math.cos(angle) * (radius - 48),
    );

    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: primaryColor.withValues(alpha: .55),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    textPainter.paint(
      canvas,
      Offset(
        position.dx - textPainter.width / 2,
        position.dy - textPainter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant _CompassPainter oldDelegate) {
    return oldDelegate.primaryColor != primaryColor ||
        oldDelegate.surfaceColor != surfaceColor;
  }
}

class _QiblaError extends StatelessWidget {
  const _QiblaError({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.explore_off_rounded,
              size: 56.sp,
              color: colorScheme.primary,
            ),
            SizedBox(height: 16.h),
            Text(
              message,
              style: AppTextStyle.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
