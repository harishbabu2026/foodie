import 'package:foodie/application/data/repository/repository.dart';

class AppRepository {
  /// Repository
  static final authRepository = FirebaseAuthRepository();
  static final userRepository = FirebaseUserRepository();

  /// Singleton factory
  static final AppRepository _instance = AppRepository._internal();

  factory AppRepository() {
    return _instance;
  }
  AppRepository._internal();
}
