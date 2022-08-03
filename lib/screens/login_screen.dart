import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/resources/auth_method.dart';
import 'package:instagram/responsive/mobile_screen_layout.dart';
import 'package:instagram/responsive/responsive_layout_screen.dart';
import 'package:instagram/responsive/web_screen_layout.dart';
import 'package:instagram/screens/signup_screen.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/utils/snack_bar.dart';
import 'package:instagram/widgets/text_input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethod().loginUser(
        email: emailController.text, password: passwordController.text);
    if (res == "Success") {
      showSnackBar(res, context);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
          const ResponsiveLayout(webScreenLayout: WebScreenLayout(),
              mobileScreenLayout: MobileScreenLayout())));
    } else {
      log(res);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              SvgPicture.asset(
                "img/ic_instagram.svg",
                color: primaryColor,
                height: 65,
              ),
              SizedBox(
                height: 50,
              ),
              TextInputField(
                  textEditingController: emailController,
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress),
              SizedBox(
                height: 20,
              ),
              TextInputField(
                textEditingController: passwordController,
                hintText: "Password",
                keyboardType: TextInputType.text,
                isObscure: true,
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: loginUser,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: _isLoading ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ) : Text("Log-In"),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: blueColor),
                ),
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Don't you have an account?"),
                  ),
                  Container(
                    child: InkWell(
                        onTap: navigateToSignUp,
                        child: Text(
                          "SignUp",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  void navigateToSignUp() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SignUpScreen()));
  }
}
