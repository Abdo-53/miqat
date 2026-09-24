import 'package:miqat/features/home/data/model/listening_type.dart';

class LastListeningModel {
  final ListeningType type;

  final String title;

  final String subtitle;

  final String url;

  final int? radioId;

  final int? reciterId;

  final int? moshafId;

  final int? surahNumber;

  const LastListeningModel({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.url,
    this.radioId,
    this.reciterId,
    this.moshafId,
    this.surahNumber,
  });
}
