import 'dart:html';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class AuthMethod{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

 Future<String> signUpUser({
    required String email,
    required String password,
    required String userName,
    required String bio,
   // required Uint8List photo,

}) async{
   String res = "Error occurs";
   try{
     // Registering user only if the field is not empty
     // Validating form from the client side
     if(email.isNotEmpty || password.isNotEmpty || userName.isNotEmpty || bio.isNotEmpty){
     UserCredential credential =  await _auth.createUserWithEmailAndPassword(email: email, password: password);

     // adding user to database
      await _firestore.collection("users").doc(credential.user!.uid).set({
         'userName': userName,
         'uid':credential.user!.uid,
         'email' : email,
         'bio' : bio,
         'followers' : [],
         'following' : [],
       });
      res = "Success";

     }
     else {

     }

   }catch(err){
     res = err.toString();
   }
   return res;

}
}