import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/router/app_router.dart';
import 'package:miqat/features/home/data/model/listening_type.dart';
import 'package:miqat/features/home/presentation/manager/cubit/home_continue_cubit.dart';
import 'package:miqat/features/home/presentation/manager/cubit/home_continue_state.dart';
import 'package:miqat/features/home/presentation/view/widget/continue_card.dart';
import 'package:miqat/features/quran/data/model/radio_model.dart';
import 'package:miqat/generated/l10n.dart';

class ContinueListen extends StatelessWidget {
  const ContinueListen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeContinueCubit, HomeContinueState>(
      buildWhen: (previous, current) =>
          previous.lastListening != current.lastListening,
      builder: (context, state) {
        final lastListening = state.lastListening;

        if (lastListening == null) {
          return ContinueCard(
            title: S.of(context).home_continueListening,
            primaryText: S.of(context).home_noListeningYet,
            icon: Icon(
              Icons.headphones_outlined,
              size: 20.sp,
              color: AppColor.primary,
            ),
          );
        }

        final isRadio = lastListening.type == ListeningType.radio;

        return ContinueCard(
          title: S.of(context).home_continueListening,

          primaryText: lastListening.title,

          secondaryText: isRadio ? null : lastListening.subtitle,

          centerContent: isRadio,

          icon: Icon(
            Icons.headphones_outlined,
            size: 20.sp,
            color: AppColor.primary,
          ),

          onTap: () {
            switch (lastListening.type) {
              case ListeningType.radio:
                context.pushNamed(
                  AppRouter.kRadioView,
                  extra: RadioModel(
                    id: lastListening.radioId,
                    name: lastListening.title,
                    url: lastListening.url,
                  ),
                );
                break;

              case ListeningType.recitation:
                context.push(
                  AppRouter.kRecitersView,
                  extra: lastListening.title,
                );
                break;
            }
          },
        );
      },
    );
  }
}
