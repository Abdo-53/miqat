import 'package:miqat/features/quran/data/model/mushaf_model.dart';

class SurahsViewArgs {
  final int reciterId;
  final String reciterName;
  final MushafModel mushaf;

  const SurahsViewArgs({
    required this.reciterId,
    required this.reciterName,
    required this.mushaf,
  });
}
