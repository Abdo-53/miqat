import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/features/azkar/data/model/azkar_item_model.dart';
import 'package:miqat/features/azkar/presentation/manager/cubit/azkar_counter_cubit.dart';
import 'package:miqat/features/taspeeh/presentation/view/widget/counter_action_button.dart';
import 'package:miqat/generated/l10n.dart';

class ZekrItem extends StatefulWidget {
  const ZekrItem({super.key, required this.zekr});

  final AzkarItemModel zekr;

  @override
  State<ZekrItem> createState() => _ZekrItemState();
}

class _ZekrItemState extends State<ZekrItem> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCounterCubit, AzkarCounterState>(
      builder: (context, state) {
        final current = state.current;
        final target = state.target;
        final remaining = target - current;

        return Column(
          children: [
            const Spacer(),

            Expanded(
              flex: 7,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Scrollbar(
                    controller: _scrollController,
                    thumbVisibility: true,
                    trackVisibility: false,
                    thickness: 2,
                    
                    radius:  Radius.circular(10.r),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Center(
                          child: Text(
                            widget.zekr.text,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.heading2.copyWith(
                              fontWeight: FontWeight.w400,
                              height: 1.9,
                              wordSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const Spacer(),

            GestureDetector(
              onTap: () {
                context.read<AzkarCounterCubit>().increment();
              },
              child: SizedBox(
                width: 240.w,
                height: 240.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 240.w,
                      height: 240.w,
                      child: CircularProgressIndicator(
                        value: target == 0 ? 0 : current / target,
                        strokeWidth: 8,
                        backgroundColor: Colors.black,
                        color: AppColor.primary,
                        strokeCap: StrokeCap.round,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          current.toString(),
                          style: AppTextStyle.displayLarge.copyWith(
                            color: AppColor.primary,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "/ $target",
                          style: AppTextStyle.titleLarge.copyWith(
                            color: AppColor.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 24.h),

            Text(
              "${S.of(context).tasbeeh_theRemaining} :  $remaining",
              style: AppTextStyle.titleLarge.copyWith(color: AppColor.primary),
            ),

            SizedBox(height: 34.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CounterActionButton(
                  label: S.of(context).tasbeeh_resetCounter,
                  icon: Icons.restart_alt,
                  color: AppColor.primary,
                  onTap: () {
                    context.read<AzkarCounterCubit>().decrement();
                  },
                ),
                CounterActionButton(
                  label: S.of(context).common_back,
                  icon: Icons.remove,
                  color: AppColor.primary,
                  onTap: () {
                    context.read<AzkarCounterCubit>().reset();
                  },
                ),
              ],
            ),

            SizedBox(height: 20.h),
          ],
        );
      },
    );
  }
}
