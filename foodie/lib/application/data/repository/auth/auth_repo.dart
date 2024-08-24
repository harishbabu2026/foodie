import '../../model/userModel.dart';

abstract class AuthRepository {
  // User get loggedUser;

  Future<void> signUp(UserModel newUser);

  Future<void> logInWithEmailAndPassword(String email, String password);
}
