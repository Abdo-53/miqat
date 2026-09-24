import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miqat/my_app.dart';
import 'package:miqat/initialize_app.dart';
import 'package:miqat/core/helper/cubit/localization_cubit.dart';
import 'package:miqat/core/helper/cubit/theme_cubit.dart';
import 'package:miqat/core/service/injection.dart';
import 'package:miqat/features/home/presentation/manager/cubit/home_continue_cubit.dart';
import 'package:miqat/features/home/presentation/manager/cubit/prayer_cubit.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/favorite/favorite_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<PrayerCubit>()..getPrayerTimes(),
        ),
        BlocProvider(
          create: (_) => getIt<HomeContinueCubit>()..refresh(),
        ),
        BlocProvider(
          create: (_) => getIt<ThemeCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<LocalizationCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<FavoriteCubit>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
