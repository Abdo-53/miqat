import 'package:flutter/material.dart';
import 'package:miqat/core/const/app_text_style.dart';
import 'package:miqat/generated/l10n.dart';

class QuranHeader extends StatelessWidget {
  const QuranHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(S.of(context).quran_title, style: AppTextStyle.displayMedium);
  }
}
