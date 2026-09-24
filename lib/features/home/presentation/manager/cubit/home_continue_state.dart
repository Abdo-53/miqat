import 'package:miqat/features/home/data/model/last_listening_model.dart';
import 'package:miqat/features/home/data/model/last_read_model.dart';

class HomeContinueState {
  final LastReadModel? lastRead;
  final LastListeningModel? lastListening;

  const HomeContinueState({this.lastRead, this.lastListening});

  HomeContinueState copyWith({
    LastReadModel? lastRead,
    LastListeningModel? lastListening,
  }) {
    return HomeContinueState(
      lastRead: lastRead ?? this.lastRead,
      lastListening: lastListening ?? this.lastListening,
    );
  }
}
