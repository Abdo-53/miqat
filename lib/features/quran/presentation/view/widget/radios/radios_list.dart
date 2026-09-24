import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:miqat/core/const/app_color.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/core/widget/network_error_view.dart';
import 'package:miqat/features/quran/data/model/radio_model.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/favorite/favorite_cubit.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/favorite/favorite_state.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/radio_player/radio_player_cubit.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/radio_player/radio_player_state.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/radios/radios_cubit.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/result_state.dart';
import 'package:miqat/features/quran/presentation/view/widget/radios/radio_skeleton.dart';
import 'package:miqat/generated/l10n.dart';

import 'radio_tile.dart';

class RadiosList extends StatelessWidget {
  const RadiosList({
    super.key,
    required this.searchQuery,
  });

  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadiosCubit, ResultState<List<RadioModel>>>(
      builder: (context, state) {
        return state.when(
          idle: () {
            return const SizedBox.shrink();
          },

          loading: () {
            return const RadiosSkeleton();
          },

          success: (radios) {
            final query = searchQuery.trim().toLowerCase();

            final filteredRadios = query.isEmpty
                ? radios
                : radios.where((radio) {
                    final name = radio.name?.toLowerCase() ?? '';
                    return name.contains(query);
                  }).toList();

            if (filteredRadios.isEmpty) {
              return Center(
                child: Text(
                  S.of(context).noResultsFound,
                  style: AppTextStyle.bodyMedium.copyWith(
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withValues(alpha: .6),
                  ),
                ),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.primary.withValues(alpha: .05),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Text(
                    S.of(context).radioCount(radios.length),
                    style: AppTextStyle.bodySmall.copyWith(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.primary,
                    ),
                  ),
                ),

                SizedBox(height: 12.h),

                Expanded(
                  child: BlocBuilder<FavoriteCubit, FavoriteState>(
                    builder: (context, favoriteState) {
                      return BlocBuilder<RadioPlayerCubit, RadioPlayerState>(
                        builder: (context, playerState) {
                          return ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemCount: filteredRadios.length,
                            separatorBuilder: (_, __) => SizedBox(height: 12.h),
                            itemBuilder: (_, index) {
                              final radio = filteredRadios[index];
                              final radioId = radio.id;

                              final isPlaying =
                                  playerState.selectedRadio?.id == radioId &&
                                  playerState.isPlaying;

                              final isFavorite =
                                  radioId != null &&
                                  favoriteState.radioIds.contains(radioId);

                              return RadioTile(
                                name: radio.name ?? '',
                                isPlaying: isPlaying,
                                isFavorite: isFavorite,

                                onFavorite: () {
                                  if (radioId == null) return;

                                  context
                                      .read<FavoriteCubit>()
                                      .toggleRadioFavorite(radioId);
                                },

                                onTap: () {
                                  context.read<RadioPlayerCubit>().playRadio(
                                    radio,
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },

          error: (exception) {
            return NetworkErrorView(
              exception: exception,
              onRetry: () {
                context.read<RadiosCubit>().getRadios();
              },
            );
          },
        );
      },
    );
  }
}
