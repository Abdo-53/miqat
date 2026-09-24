import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/core/widget/app_search_field.dart';

import 'package:miqat/features/quran/presentation/manager/cubit/favorite/favorite_cubit.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/favorite/favorite_state.dart';

import 'package:miqat/features/quran/presentation/manager/cubit/radio_player/radio_player_cubit.dart';
import 'package:miqat/features/quran/presentation/manager/cubit/radio_player/radio_player_state.dart';

import 'package:miqat/features/quran/presentation/view/widget/radios/current_radio_card.dart';
import 'package:miqat/features/quran/presentation/view/widget/radios/radio_controls.dart';

import 'package:miqat/generated/l10n.dart';

import 'radios_list.dart';

class RadioBody extends StatefulWidget {
  const RadioBody({super.key});

  @override
  State<RadioBody> createState() => _RadioBodyState();
}

class _RadioBodyState extends State<RadioBody> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .only(left: 20.w, right: 20.w, top: 8.h, bottom: 18.h),
      child: Column(
        children: [
          AppSearchField(
            hintText: S.of(context).searchRadio,
            onChanged: (value) {
              setState(() {
                searchQuery = value.trim();
              });
            },
          ),

          SizedBox(height: 2.h),

          Expanded(child: RadiosList(searchQuery: searchQuery)),

          SizedBox(height: 16.h),

          BlocBuilder<RadioPlayerCubit, RadioPlayerState>(
            builder: (context, playerState) {
              final selectedRadio = playerState.selectedRadio;

              return BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, favoriteState) {
                  final radioId = selectedRadio?.id;

                  final isFavorite =
                      radioId != null &&
                      favoriteState.radioIds.contains(radioId);

                  return CurrentRadioCard(
                    radioName: selectedRadio?.name ?? S.of(context).selectRadio,
                    isLive: playerState.isPlaying,
                    isFavorite: isFavorite,
                    onFavorite: selectedRadio == null
                        ? null
                        : () {
                            if (radioId == null) return;

                            context.read<FavoriteCubit>().toggleRadioFavorite(
                              radioId,
                            );
                          },
                  );
                },
              );
            },
          ),

          SizedBox(height: 14.h),

          BlocBuilder<RadioPlayerCubit, RadioPlayerState>(
            builder: (context, state) {
              return RadioControls(
                isPlaying: state.isPlaying,
                isMuted: state.isMuted,
                onPlayPause: () {
                  context.read<RadioPlayerCubit>().togglePlayStop();
                },
                onMute: () {
                  context.read<RadioPlayerCubit>().toggleMute();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
