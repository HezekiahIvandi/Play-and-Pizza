import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String username;
  final String photoUrl;
  final int coins;
  final int slices;

  const User({
    required this.email,
    required this.uid,
    required this.username,
    required this.photoUrl,
    required this.coins,
    required this.slices,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "coins": coins,
        "slices": slices,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      email: snapshot["email"],
      uid: snapshot["uid"],
      username: snapshot["username"],
      photoUrl: snapshot["photoUrl"],
      coins: snapshot["coins"],
      slices: snapshot["slices"],
    );
  }
}
