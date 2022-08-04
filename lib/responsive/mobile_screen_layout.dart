import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/providers/user_provider.dart';
import 'package:instagram/screens/add_post_screen.dart';
import 'package:instagram/screens/news_feed.dart';
import 'package:instagram/utils/colors.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';
class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _pageNum = 0;

  final List<Widget> _screens =[
    NewsFeed(),
    Text("Search"),
    AddPostScreen(),
    Text("Favorite"),
    Text("Profile"),
  ];
  //for navigation bar tab click operation
  void navigateTab(int value) {
    setState(() {
      _pageNum = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    UserModel? userModel = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
          child: _screens[_pageNum]),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _pageNum,
        backgroundColor: mobileBackgroundColor,
        activeColor: primaryColor,
        inactiveColor: secondaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: primaryColor
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
            backgroundColor: primaryColor
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: "Add",
            backgroundColor: primaryColor
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
            backgroundColor: primaryColor
          ), BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Person",
            backgroundColor: primaryColor
          ),

        ],
        onTap: navigateTab,
      ),
    );
  }
}


