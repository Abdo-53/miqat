import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:miqat/core/err/network_exceptions.dart';
import 'package:miqat/core/router/app_router.dart';
import 'package:miqat/core/service/api/api_result/api_result.dart';
import 'package:miqat/core/service/injection.dart';
import 'package:miqat/core/widget/network_error_view.dart';
import 'package:miqat/features/quran/data/model/radio_model.dart';
import 'package:miqat/features/quran/data/repo/quran_audio_repository.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/favorite/favorite_cubit.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/favorite/favorite_state.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/radio_player/radio_player_cubit.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/radio_player/radio_player_state.dart';
import 'package:miqat/features/quran/presentation/view/widget/favorites/empty_favorite.dart';
import 'package:miqat/features/quran/presentation/view/widget/radios/radio_tile.dart';
import 'package:miqat/generated/l10n.dart';

class FavoriteRadios extends StatefulWidget {
  const FavoriteRadios({super.key});

  @override
  State<FavoriteRadios> createState() => _FavoriteRadiosState();
}

class _FavoriteRadiosState extends State<FavoriteRadios> {
  late Future<ApiResult<List<RadioModel>>> _radiosFuture;

  @override
  void initState() {
    super.initState();
    _loadRadios();
  }

  void _loadRadios() {
    _radiosFuture = getIt<QuranAudioRepository>().getRadios(
      language: 'ar',
    );
  }

  void _retry() {
    setState(() {
      _loadRadios();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RadioPlayerCubit>(),
      child: _FavoriteRadiosContent(
        radiosFuture: _radiosFuture,
        onRetry: _retry,
      ),
    );
  }
}

class _FavoriteRadiosContent extends StatelessWidget {
  const _FavoriteRadiosContent({
    required this.radiosFuture,
    required this.onRetry,
  });

  final Future<ApiResult<List<RadioModel>>> radiosFuture;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiResult<List<RadioModel>>>(
      future: radiosFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData) {
          return NetworkErrorView(
            exception: const NetworkExceptions.unknown(),
            onRetry: onRetry,
          );
        }

        final result = snapshot.data!;

        return result.when(
          success: (allRadios) {
            return BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, favoriteState) {
                final favoriteRadios = allRadios.where((radio) {
                  final id = radio.id;

                  if (id == null) {
                    return false;
                  }

                  return favoriteState.radioIds.contains(id);
                }).toList();

                if (favoriteRadios.isEmpty) {
                  return EmptyFavorite(
                    message: S.of(context).noFavoritesRadios,
                  );
                }

                return BlocBuilder<RadioPlayerCubit, RadioPlayerState>(
                  builder: (context, playerState) {
                    return ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: favoriteRadios.length,
                      separatorBuilder: (_, _) => SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        final radio = favoriteRadios[index];
                        final radioId = radio.id;

                        final isPlaying =
                            playerState.selectedRadio?.id == radioId &&
                            playerState.isPlaying;

                        return RadioTile(
                          name: radio.name ?? '',
                          isPlaying: isPlaying,
                          isFavorite: true,
                          onFavorite: () {
                            if (radioId == null) {
                              return;
                            }

                            context.read<FavoriteCubit>().toggleRadioFavorite(
                              radioId,
                            );
                          },
                          onTap: () {
                            context.pushNamed(
                              AppRouter.kRadioView,
                              extra: radio,
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
            );
          },
          failure: (exception) {
            return NetworkErrorView(
              exception: exception,
              onRetry: onRetry,
            );
          },
        );
      },
    );
  }
}
