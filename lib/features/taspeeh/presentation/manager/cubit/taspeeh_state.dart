import 'package:miqat/features/taspeeh/data/model/taspeh_model.dart';
import 'package:miqat/features/taspeeh/data/model/user_taspeh_model.dart';

sealed class TaspeehState {}

final class TaspeehInitial extends TaspeehState {}

final class TaspeehLoading extends TaspeehState {}

final class TaspeehLoaded extends TaspeehState {
  final List<TaspehModel> defaultTaspeehs;
  final List<UserTaspehModel> userTaspeehs;

  TaspeehLoaded({required this.defaultTaspeehs, required this.userTaspeehs});
}

final class TaspeehError extends TaspeehState {
  final String message;

  TaspeehError(this.message);
}
