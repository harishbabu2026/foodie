import 'package:foodie/application/data/model/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  // Stream<UserModel> loggedUser(User loggedUser);

  Future<void> addUserData(UserModel newUser);
}
