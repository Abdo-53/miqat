import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:miqat/core/service/injection.dart';
import 'package:miqat/core/widget/dismiss_keyboard.dart';

import 'package:miqat/features/quran/data/model/radio_model.dart';

import 'package:miqat/features/quran/presentation/manager/cubit/radio_player/radio_player_cubit.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/radios/radios_cubit.dart';

import 'package:miqat/features/quran/presentation/view/widget/radios/radio_body.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key, this.initialRadio});

  final RadioModel? initialRadio;

  @override
  Widget build(BuildContext context) {
    final radioPlayerCubit = getIt<RadioPlayerCubit>();

    if (initialRadio != null &&
        radioPlayerCubit.state.selectedRadio?.id != initialRadio!.id) {
      radioPlayerCubit.playRadio(initialRadio!);
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<RadiosCubit>()..getRadios()),

        BlocProvider.value(value: radioPlayerCubit),
      ],
      child: DismissKeyboard(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: const SafeArea(child: RadioBody()),
        ),
      ),
    );
  }
}
