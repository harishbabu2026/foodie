part of 'user_bloc.dart';

@immutable
sealed class UserEvent extends Equatable {
  List<Object> get props => [];
}

final class SignUpEvent extends UserEvent {
  final String? id;
  final String name;
  final String email;
  final String phone;
  final String password;

  SignUpEvent(
      {this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.password});
  List<Object> get props => [name, email, phone, password];
}

final class SignInEvent extends UserEvent {
  final String? id;
  final String email;
  final String password;

  SignInEvent({this.id, required this.email, required this.password});
  List<Object> get props => [email, password];
}
