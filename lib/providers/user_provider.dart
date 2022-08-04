import 'package:flutter/material.dart';
import 'package:instagram/model/user_model.dart';
import 'package:instagram/resources/auth_method.dart';

class UserProvider extends ChangeNotifier{
  UserModel ? _userModel;
  final AuthMethod _authMethod = AuthMethod();

  UserModel get getUser => _userModel!;

  Future<void> refreshUser() async{
    UserModel userModel = await _authMethod.getUserDetail();
    _userModel = userModel;
    notifyListeners();

  }

}