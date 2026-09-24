import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miqat/core/service/injection.dart';
import 'package:miqat/features/home/presentation/manager/cubit/qibla_cubit.dart';
import 'package:miqat/features/home/presentation/view/widget/qibla_view_body.dart';

class QiblaView extends StatelessWidget {
  const QiblaView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<QiblaCubit>()..initialize(),
      child: const QiblaViewBody(),
    );
  }
}
