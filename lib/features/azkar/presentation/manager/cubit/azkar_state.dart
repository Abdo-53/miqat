part of 'azkar_cubit.dart';

sealed class AzkarState {
  const AzkarState();
}

final class AzkarInitial extends AzkarState {}

final class AzkarLoading extends AzkarState {}

final class AzkarSuccess extends AzkarState {
  final List<AzkarItemModel> azkar;

  const AzkarSuccess(this.azkar);
}

final class AzkarFailure extends AzkarState {
  final String message;

  const AzkarFailure(this.message);
}
