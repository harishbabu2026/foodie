import 'package:foodie/application/data/model/userModel.dart';
import 'package:foodie/application/data/repository/app_repository.dart';
import 'package:foodie/application/data/repository/auth/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodie/application/data/repository/user/user_repos.dart';

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UserRepository _userRepository = AppRepository.userRepository;

  Future<void> signUp(UserModel newUser) async {
    try {
      // Attempt to create a new user with email and password
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: newUser.email,
        password: newUser.password,
      );

      // Ensure the userCredential and user are not null
      if (userCredential.user == null) {
        throw Exception('Failed to create user. User credential is null.');
      }

      // Update UserModel with the new user ID
      newUser = newUser.cloneWith(id: userCredential.user!.uid);

      // Add the new user data to the repository
      await _userRepository.addUserData(newUser);
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific errors
      throw Exception('FirebaseAuthException: ${e.message}');
    } catch (e) {
      // Handle any other exceptions
      throw Exception('Error signing up: ${e.toString()}');
    }
  }

  Future<void> logInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception('Error signin: ${e.toString()}');
    }
  }
}
