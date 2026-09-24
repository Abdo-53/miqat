import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/service/injection.dart';
import 'package:miqat/features/taspeeh/presentation/manager/cubit/taspeeh_cubit.dart';
import 'package:miqat/features/taspeeh/presentation/view/widget/taspeh_floating_button.dart';
import 'package:miqat/features/taspeeh/presentation/view/widget/taspeh_grid_view.dart';
import 'package:miqat/features/taspeeh/presentation/view/widget/taspeh_sheet.dart';

class TaspeehViewBody extends StatelessWidget {
  const TaspeehViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TaspeehCubit>()..loadTasbeehs(),
      child: Builder(
        builder: (context) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
          child: Stack(
            children: [
              SafeArea(child: const TaspehGridView()),

              PositionedDirectional(
                bottom: 25.h,
                start: 20.w,
                child: TaspehFloatingButton(
                  onTap: () {
                    final cubit = context.read<TaspeehCubit>();

                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) {
                        return TaspehSheet(
                          onTap: (taspeeh) async {
                            await cubit.addTaspeeh(taspeeh);

                            if (context.mounted) {
                              Navigator.pop(context);
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
