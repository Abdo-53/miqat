import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:miqat/core/router/app_router.dart';
import 'package:miqat/core/service/injection.dart';
import 'package:miqat/core/widget/network_error_view.dart';
import 'package:miqat/features/quran/data/model/reciter_model.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/favorite/favorite_cubit.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/favorite/favorite_state.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/reciters/reciters_cubit.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/result_state.dart';
import 'package:miqat/features/quran/presentation/view/widget/favorites/empty_favorite.dart';
import 'package:miqat/features/quran/presentation/view/widget/moshafs/mushaf_bottom_sheet.dart';
import 'package:miqat/features/quran/presentation/view/widget/reciters/reciter_tile.dart';
import 'package:miqat/features/quran/presentation/view/widget/surahs/arguments/surahs_view_args.dart';
import 'package:miqat/generated/l10n.dart';

class FavoriteReciters extends StatelessWidget {
  const FavoriteReciters({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RecitersCubit>()..getReciters(),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, favoriteState) {
          return BlocBuilder<RecitersCubit, ResultState<List<ReciterModel>>>(
            builder: (context, recitersState) {
              return recitersState.when(
                idle: () {
                  return const SizedBox.shrink();
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                success: (reciters) {
                  final favoriteReciters = reciters.where((reciter) {
                    final id = reciter.id;

                    if (id == null) {
                      return false;
                    }

                    return favoriteState.reciterIds.contains(id);
                  }).toList();

                  if (favoriteReciters.isEmpty) {
                    return EmptyFavorite(
                      message: S.of(context).noFavoritesReciters,
                    );
                  }

                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: favoriteReciters.length,
                    separatorBuilder: (_, _) => SizedBox(height: 12.h),
                    itemBuilder: (context, index) {
                      final reciter = favoriteReciters[index];

                      return ReciterTile(
                        name: reciter.name ?? '',
                        mushafCount: '${reciter.moshaf?.length ?? 0} مصحف',
                        onTap: () {
                          final mushafs = reciter.moshaf ?? [];

                          if (mushafs.isEmpty) {
                            return;
                          }

                          if (mushafs.length == 1) {
                            context.pushNamed(
                              AppRouter.kSurahsView,
                              extra: SurahsViewArgs(
                                reciterId: reciter.id!,
                                reciterName: reciter.name ?? '',
                                mushaf: mushafs[0],
                              ),
                            );
                            return;
                          }

                          showMushafsBottomSheet(
                            context: context,
                            reciterId: reciter.id!,
                            reciterName: reciter.name ?? '',
                            mushafs: mushafs,
                          );
                        },
                      );
                    },
                  );
                },
                error: (exception) {
                  return NetworkErrorView(
                    exception: exception,
                    onRetry: () {
                      context.read<RecitersCubit>().getReciters();
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
