import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram/responsive/mobile_screen_layout.dart';
import 'package:instagram/responsive/responsive_layout_screen.dart';
import 'package:instagram/responsive/web_screen_layout.dart';
import 'package:instagram/utils/colors.dart';

void main() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD-O1QniPXljTf5rXGF1tGYT-mkXiQj1R0",
            appId: "1:655108752396:web:ce9af91721f09038005a29",
            messagingSenderId: "655108752396",
            projectId: "instagram-clone-36bad",
          storageBucket: "instagram-clone-36bad.appspot.com"
        ),
    );
  }
  else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
            backgroundColor: mobileBackgroundColor
        ),
        home: ResponsiveLayout(webScreenLayout: WebScreenLayout(),
          mobileScreenLayout: MobileScreenLayout(),)
    );
  }
}
