import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miqat/core/service/injection.dart';
import 'package:miqat/core/widget/dismiss_keyboard.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/reciters/reciters_cubit.dart';
import 'package:miqat/features/quran/presentation/view/widget/reciters/reciters_body.dart';

class RecitersView extends StatelessWidget {
  const RecitersView({super.key, this.initialSearchQuery});

  final String? initialSearchQuery;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RecitersCubit>()..getReciters(),
      child: DismissKeyboard(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SafeArea(
            child: RecitersBody(initialSearchQuery: initialSearchQuery),
          ),
        ),
      ),
    );
  }
}
