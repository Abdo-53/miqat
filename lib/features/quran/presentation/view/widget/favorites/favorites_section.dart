import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/features/quran/presentation/view/widget/favorites/favorite_radios.dart';
import 'package:miqat/features/quran/presentation/view/widget/favorites/favorite_reciters.dart';
import 'package:miqat/features/quran/presentation/view/widget/favorites/favorite_surahs.dart';
import 'package:miqat/features/quran/presentation/view/widget/favorites/favorites_items.dart';

class FavoritesSection extends StatefulWidget {
  const FavoritesSection({super.key});

  @override
  State<FavoritesSection> createState() => _FavoritesSectionState();
}

class _FavoritesSectionState extends State<FavoritesSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FavoritesItems(
          selectedIndex: selectedIndex,
          onChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),

        SizedBox(height: 12.h),

        Expanded(child: _buildSelectedFavorite()),
      ],
    );
  }

  Widget _buildSelectedFavorite() {
    switch (selectedIndex) {
      case 0:
        return const FavoriteSurahs();

      case 1:
        return const FavoriteReciters();

      case 2:
        return const FavoriteRadios();

      default:
        return const SizedBox.shrink();
    }
  }
}
