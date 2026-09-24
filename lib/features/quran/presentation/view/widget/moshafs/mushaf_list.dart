import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:miqat/core/router/app_router.dart';
import 'package:miqat/features/quran/data/model/mushaf_model.dart';
import 'package:miqat/features/quran/presentation/view/widget/surahs/arguments/surahs_view_args.dart';

import 'mushaf_tile.dart';

class MushafList extends StatelessWidget {
  const MushafList({
    super.key,
    required this.reciterId,
    required this.mushafs,
    required this.reciterName,
  });

  final int reciterId;
  final List<MushafModel> mushafs;
  final String reciterName;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: mushafs.length,
      separatorBuilder: (context, index) {
        return Divider(height: 24.h, color: Theme.of(context).dividerColor);
      },
      itemBuilder: (context, index) {
        final mushaf = mushafs[index];

        return MushafTile(
          title: mushaf.name ?? '',

          // دي موجودة عندك Hardcoded من قبل
          // هنرجعلها بعدين لو حبيت لأننا دلوقتي مش محتاجين Key جديدة للـ Favorite.
          subtitle: '${mushaf.surahTotal ?? 0} سورة',

          onTap: () {
            Navigator.pop(context);

            context.pushNamed(
              AppRouter.kSurahsView,
              extra: SurahsViewArgs(
                reciterId: reciterId,
                reciterName: reciterName,
                mushaf: mushaf,
              ),
            );
          },
        );
      },
    );
  }
}
