import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:playandpizza/model/user.dart' as model;

class AuthService {
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  Future<String> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

         model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          photoUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfZCGFDrC8YeednlJC3mhxPfg_s4Pg8u7-kf6dy88&s',
          coins: 0,
          slices: 0,
        );

        //add user to the database
        await _firestore.collection('users').doc(cred.user!.uid).set(
          user.toJson(),
        );

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  Future<User?> loginUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      log('Something went wrong');
    }
    return null;
  }

  Future<void> signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log('Something went wrong');
    }
  }
}
