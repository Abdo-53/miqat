import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/core/model/quran_page_model.dart';
import 'package:miqat/core/model/surah_metadata_model.dart';
import 'package:miqat/core/service/injection.dart';
import 'package:miqat/core/service/shared_preferences_service.dart';
import 'package:miqat/features/home/presentation/manager/cubit/home_continue_cubit.dart';
import 'package:miqat/features/quran/data/repo/quran_audio_repository.dart';

class MushafBody extends StatefulWidget {
  const MushafBody({super.key, required this.startPage});

  final int startPage;

  @override
  State<MushafBody> createState() => _MushafBodyState();
}

class _MushafBodyState extends State<MushafBody> {
  late final PageController _pageController;
  late final SharedPreferencesService _preferencesService;
  late final QuranAudioRepository _quranRepository;

  late final Future<_QuranPageData> _pageDataFuture;

  static const int totalPages = 604;

  @override
  void initState() {
    super.initState();

    _preferencesService = getIt<SharedPreferencesService>();
    _quranRepository = getIt<QuranAudioRepository>();

    _pageController = PageController(initialPage: widget.startPage - 1);

    _preferencesService.saveLastReadPage(widget.startPage);

    _pageDataFuture = _loadPageData();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      context.read<HomeContinueCubit>().refresh();
    });
  }

  Future<_QuranPageData> _loadPageData() async {
    final pages = await _quranRepository.getQuranPages();
    final surahs = await _quranRepository.getSurahsMetadata();

    return _QuranPageData(pages: pages, surahs: surahs);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<_QuranPageData>(
      future: _pageDataFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final pageData = snapshot.data!;

        return PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          itemCount: totalPages,
          onPageChanged: (index) async {
            final page = index + 1;

            await _preferencesService.saveLastReadPage(page);

            if (!mounted) return;

            context.read<HomeContinueCubit>().refresh();
          },
          itemBuilder: (context, index) {
            final pageNumber = index + 1;

            final formattedPage = pageNumber.toString().padLeft(3, '0');

            final pageInfo = _getPageInfo(
              pageNumber: pageNumber,
              pages: pageData.pages,
              surahs: pageData.surahs,
            );

            return SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 2.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          pageInfo?.surahName ?? '',
                          style: AppTextStyle.bodySmall.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '$pageNumber',
                          style: AppTextStyle.bodySmall.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      child: SvgPicture.asset(
                        'asset/json/quran/svg/$formattedPage.svg',
                        color: Theme.of(context).colorScheme.onSurface,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  _PageInfo? _getPageInfo({
    required int pageNumber,
    required List<QuranPageModel> pages,
    required List<SurahMetadataModel> surahs,
  }) {
    final page = pages.cast<QuranPageModel?>().firstWhere(
      (item) => item?.page == pageNumber,
      orElse: () => null,
    );

    if (page == null) return null;

    final surahNumber = page.start?.surahNumber;

    if (surahNumber == null) return null;

    final surah = surahs.cast<SurahMetadataModel?>().firstWhere(
      (item) => item?.number == surahNumber,
      orElse: () => null,
    );

    if (surah == null) return null;

    final locale = Localizations.localeOf(context);

    final surahName = locale.languageCode == 'ar'
        ? surah.name?.ar
        : surah.name?.en;

    return _PageInfo(surahName: surahName ?? '');
  }
}

class _QuranPageData {
  final List<QuranPageModel> pages;
  final List<SurahMetadataModel> surahs;

  const _QuranPageData({required this.pages, required this.surahs});
}

class _PageInfo {
  final String surahName;

  const _PageInfo({required this.surahName});
}
