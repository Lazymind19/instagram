import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/model/post_model.dart';
import 'package:instagram/resources/storage_method.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // uploading post
  Future<String> uploadPost(String description,
      Uint8List file,
      String uid,
      String profImage,
      String userName,
      ) async {
    String res = "Something went wrong";
    try {
      String postId = Uuid().v1();
      String photoUrl = await StorageMethod().uploadImage("posts", file, true);
      PostModel postModel = PostModel(
          description: description,
          uid: uid,
          profUrl: profImage,
          userName: userName,
          postId: postId,
          datePublished: DateTime.now().toString(),
          postUrl:photoUrl,
          );
      _firestore.collection("posts").doc(postId).set(postModel.toJson());
      res = "Success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}