import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:foodie/application/data/model/userModel.dart';
import 'package:foodie/application/data/repository/app_repository.dart';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final _authRepository = AppRepository.authRepository;
  UserBloc() : super(UserInitial()) {
    on<SignUpEvent>(signUpEvent);
    on<SignInEvent>(signInEvent);
  }

  FutureOr<void> signUpEvent(SignUpEvent event, Emitter<UserState> emit) async {
    UserModel user = UserModel(
        name: event.name,
        email: event.email,
        phone: event.phone,
        password: event.password);

    await _authRepository.signUp(user);
  }

  FutureOr<void> signInEvent(SignInEvent event, Emitter<UserState> emit) async {
    try {
      await _authRepository.logInWithEmailAndPassword(
          event.email, event.password);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
