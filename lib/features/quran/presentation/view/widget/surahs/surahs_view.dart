import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miqat/core/service/injection.dart';
import 'package:miqat/core/widget/dismiss_keyboard.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/player/player_cubit.dart';
import 'package:miqat/features/quran/presentation/view/widget/surahs/arguments/surahs_view_args.dart';
import 'package:miqat/features/quran/presentation/view/widget/surahs/surahs_body.dart';

class SurahsView extends StatelessWidget {
  const SurahsView({super.key, required this.args});
  final SurahsViewArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PlayerCubit>(),
      child: DismissKeyboard(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        
          body: SafeArea(child: SurahsBody(args)),
        ),
      ),
    );
  }
}
