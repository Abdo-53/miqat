import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miqat/features/quran/data/model/mushaf_model.dart';
import 'package:miqat/features/quran/presentation/view/widget/moshafs/mushaf_bottom_sheet_header.dart';

import 'mushaf_list.dart';

Future<void> showMushafsBottomSheet({
  required BuildContext context,
  required int reciterId,
  required String reciterName,
  required List<MushafModel> mushafs,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    backgroundColor: Theme.of(context).colorScheme.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
    ),
    builder: (_) {
      return FractionallySizedBox(
        heightFactor: .60,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 20.h),
          child: Column(
            children: [
              MushafBottomSheetHeader(reciterName: reciterName),

              SizedBox(height: 28.h),

              Expanded(
                child: MushafList(
                  reciterId: reciterId,
                  mushafs: mushafs,
                  reciterName: reciterName,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
