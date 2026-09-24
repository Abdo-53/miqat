import 'package:flutter/material.dart';
import 'package:miqat/features/quran/presentation/view/widget/audio_section.dart';
import 'package:miqat/features/quran/presentation/view/widget/favorites/favorites_section.dart';
import 'package:miqat/features/quran/presentation/view/widget/surahs_section.dart';

class QuranContent extends StatelessWidget {
  const QuranContent({
    super.key,
    required this.selectedIndex,
    required this.searchQuery,
  });

  final int selectedIndex;
  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      child: _buildSelectedSection(),
    );
  }

  Widget _buildSelectedSection() {
    switch (selectedIndex) {
      case 0:
        return SurahsSection(
          key: const ValueKey('surahs'),
          searchQuery: searchQuery,
        );

      case 1:
        return const AudioSection(key: ValueKey('audio'));

      case 2:
        return const FavoritesSection(key: ValueKey('favorites'));

      default:
        return const SizedBox.shrink();
    }
  }
}
