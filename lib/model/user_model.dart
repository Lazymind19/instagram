import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String uid;
  final String photoUrl;
  final String userName;
  final String bio;
  final List followers;
  final List following;

  UserModel({required this.email,
    required this.uid,
    required this.photoUrl,
    required this.userName,
    required this.bio,
    required this.followers,
    required this.following});

  Map<String, dynamic> toJson() =>
      {
        'userName': userName,
        'uid': uid,
        'email': email,
        'photoUrl': photoUrl,
        'bio': bio,
        'followers': followers,
        'following': following
      };

  static UserModel fromSnap(DocumentSnapshot snapshot) {
    var snapShot = snapshot.data() as Map<String, dynamic>;
    return UserModel(email: snapShot['email'],
        uid: snapShot['uid'],
        photoUrl: snapShot['photoUrl'],
        userName: snapShot['userName'],
        bio: snapShot['bio'],
        followers: snapShot['followers'],
        following: snapShot['following']);
  }
}
