class AzkarItemModel {
  final int id;
  final String text;
  final int count;
  final String audio;
  final String filename;

  const AzkarItemModel({
    required this.id,
    required this.text,
    required this.count,
    required this.audio,
    required this.filename,
  });

  factory AzkarItemModel.fromJson(Map<String, dynamic> json) {
    return AzkarItemModel(
      id: json["id"],
      text: json["text"],
      count: json["count"],
      audio: json["audio"],
      filename: json["filename"],
    );
  }
}
