import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/utils/colors.dart';
class NewsFeed extends StatelessWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: SvgPicture.asset("img/ic_instagram.svg", color: primaryColor, height: 30,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.message, color: primaryColor,))
        ],
      ),
      backgroundColor: mobileBackgroundColor,
      body: Center(
        child: Text("News feed"),
      ),
    );
  }
}
