import 'dart:html';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/model/user_model.dart';
import 'package:instagram/resources/storage_method.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUserDetail() async{
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snapshot = await _firestore.collection("users").doc(currentUser.uid).get();
    return UserModel.fromSnap(snapshot);
  }


  Future<String> signUpUser({
    required String email,
    required String password,
    required String userName,
    required String bio,
    required Uint8List photo,
  }) async {
    String res = "Error occurs";
    try {
      // Registering user only if the field is not empty
      // Validating form from the client side
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          userName.isNotEmpty ||
          bio.isNotEmpty ||
          photo.isNotEmpty) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photoUrl =
        await StorageMethod().uploadImage("profilePic", photo, false);

        UserModel userModel = UserModel(email: email,
            uid: credential.user!.uid,
            photoUrl: photoUrl,
            userName: userName,
            bio: bio,
            followers: [],
            following: []);

        // adding user to database
        await
        _firestore.collection("users").doc(credential.user!.uid).set(userModel.toJson());
        res = "Success";
      } else {}
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

// login method for firebase

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurs";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "Success";
      } else {
        res = "Please enter all the field";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
