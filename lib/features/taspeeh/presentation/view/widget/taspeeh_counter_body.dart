import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/features/taspeeh/presentation/manager/cubit/taspeeh_counter_cubit.dart';
import 'package:miqat/features/taspeeh/presentation/view/widget/counter_action_button.dart';
import 'package:miqat/features/taspeeh/presentation/view/widget/taspeeh_progress.dart';
import 'package:miqat/generated/l10n.dart';

class TaspeehCounterBody extends StatelessWidget {
  const TaspeehCounterBody({
    super.key,
    required this.title,
    required this.target,
  });

  final String title;
  final int target;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaspeehCounterCubit, TaspeehCounterState>(
      builder: (context, state) {
        final current = state.current;
        final remaining = state.target - current;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 12.h),

              Align(
                alignment: AlignmentDirectional.topEnd,
                child: IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(Icons.close_rounded, size: 32.sp),
                ),
              ),

              const Spacer(),

              Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.displayMedium,
                ),
              ),

              SizedBox(height: 38.h),

              GestureDetector(
                onTap: () {
                  context.read<TaspeehCounterCubit>().increment();
                },
                child: TaspeehProgress(current: current, target: target),
              ),

              SizedBox(height: 28.h),

              Text(
                S.of(context).tasbeeh_tapToCount,
                style: AppTextStyle.heading2,
              ),

              SizedBox(height: 8.h),

              Text(
                "${S.of(context).tasbeeh_theRemaining} : $remaining",
                style: AppTextStyle.heading3,
              ),

              const Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CounterActionButton(
                    label: S.of(context).tasbeeh_resetCounter,
                    icon: Icons.restart_alt,
                    color: AppColor.primary,
                    onTap: () {
                      context.read<TaspeehCounterCubit>().reset();
                    },
                  ),

                  CounterActionButton(
                    label: S.of(context).common_back,
                    icon: Icons.remove,
                    color: AppColor.primary,
                    onTap: () {
                      context.read<TaspeehCounterCubit>().decrement();
                    },
                  ),
                ],
              ),

              SizedBox(height: 36.h),
            ],
          ),
        );
      },
    );
  }
}
