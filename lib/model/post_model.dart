import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String description;
  final String uid;
  final String profUrl;
  final String userName;
  final String datePublished;
  final String postId;
  final String postUrl;
  final  likes;

  PostModel({
    required this.description,
    required this.uid,
    required this.profUrl,
    required this.userName,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
     this.likes,
  });

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'uid': uid,
        'description': description,
        'profUrl': profUrl,
        'postId': postId,
        'postUrl': postUrl,
        'datePublished': datePublished,
        'likes': likes,
      };

  static PostModel fromSnap(DocumentSnapshot snapshot) {
    var snapShot = snapshot.data() as Map<String, dynamic>;
    return PostModel(
        description: snapShot['description'],
        uid: snapShot['uid'],
        profUrl: snapShot['profUrl'],
        datePublished: snapShot['datePublished'],
        userName: snapShot['userName'],
        postId: snapShot['postId'],
        likes: snapShot['likes'],
        postUrl: snapShot['postUrl']);
  }
}
