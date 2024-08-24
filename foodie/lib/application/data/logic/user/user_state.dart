part of 'user_bloc.dart';

@immutable
sealed class UserState extends Equatable {
  List<Object> get props => [];
}

final class UserInitial extends UserState {
  List<Object> get props => [];
}

final class SignupLoadingState extends UserState {
  List<Object> get props => [];
}

final class SignupSuccessState extends UserState {
  final String message;

  SignupSuccessState({required this.message});

  List<Object> get props => [message];
}

final class SignupErrorState extends UserState {
  final String message;

  SignupErrorState({required this.message});

  List<Object> get props => [message];
}

final class SignInLoadingState extends UserState {
  List<Object> get props => [];
}

final class SignInSuccessState extends UserState {
  final String message;

  SignInSuccessState({required this.message});

  List<Object> get props => [message];
}

final class SignInErrorState extends UserState {
  final String message;

  SignInErrorState({required this.message});

  List<Object> get props => [message];
}
