import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodie/application/data/model/userModel.dart';
import 'package:foodie/application/data/repository/user/user_repos.dart';

class FirebaseUserRepository implements UserRepository {
  final _userCollection = FirebaseFirestore.instance.collection("user");

  // Stream<UserModel> loggedUser(User loggedUser) {
  //   return _userCollection
  //       .doc(loggedUser.uid)
  //       .snapshots()
  //       .map((doc) => UserModel.fromMap(doc.data()!));
  // }

  Future<void> addUserData(UserModel newUser) async {
    return _userCollection
        .doc(newUser.id)
        .set(newUser.toMap())
        .catchError((e) => print(e));
  }
}
