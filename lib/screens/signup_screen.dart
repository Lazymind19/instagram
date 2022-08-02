import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram/resources/auth_method.dart';

import '../utils/colors.dart';
import '../widgets/text_input_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

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
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                   child: Icon(Icons.person, size: 100,),
                  ),
                  Positioned(
                    bottom: 0,
                      left: 60,
                      child: IconButton(onPressed: (){},
                  icon: Icon(Icons.add_a_photo, color: blueColor,),))
                ],
              ),
              SizedBox(height: 10,),
              TextInputField(
                  textEditingController: userNameController,
                  hintText: "Enter User name",
                  keyboardType: TextInputType.text),
              SizedBox(
                height: 20,
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
              TextInputField(
                textEditingController: bioController,
                hintText: "Enter bio here",
                keyboardType: TextInputType.text,
                isObscure: false,
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  String result = await AuthMethod().signUpUser(email: emailController.text, password: passwordController.text, userName: userNameController.text, bio: bioController.text);
                  log(result);
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text("Register"),
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
                    child: Text("Already have an account ?"),
                  ),
                  Container(
                    child: InkWell(
                        onTap: (){},
                        child: Text(
                          "LogIn",
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
}
