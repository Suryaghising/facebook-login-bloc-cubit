part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class LogoutFailure extends HomeState {
  final String message;

  LogoutFailure({required this.message});
}

class LogoutSuccess extends HomeState {}
