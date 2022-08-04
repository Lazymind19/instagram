import 'package:flutter/material.dart';
import 'package:instagram/model/user_model.dart';
import 'package:instagram/providers/user_provider.dart';
import 'package:provider/provider.dart';
class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: Text(user.userName),
    );
  }
}
