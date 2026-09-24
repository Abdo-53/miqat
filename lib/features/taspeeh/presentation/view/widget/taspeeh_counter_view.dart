import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miqat/features/taspeeh/presentation/manager/cubit/taspeeh_counter_cubit.dart';
import 'package:miqat/features/taspeeh/presentation/view/widget/taspeeh_counter_body.dart';

class TaspeehCounterView extends StatelessWidget {
  const TaspeehCounterView({
    super.key,

    required this.title,
    required this.target,
  });

  final String title;
  final int target;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaspeehCounterCubit(target: target),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: TaspeehCounterBody(target: target, title: title),
        ),
      ),
    );
  }
}
