import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/utils/image_picker.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List ? _file;


  _selectImage(BuildContext context) async{
      return showDialog(context: context, builder: (context) {
       return SimpleDialog(
          title: Text("Create Post"),
          children: [

            //Take photo from camera
            SimpleDialogOption(
              padding: EdgeInsets.all(20),
              child: Text("Take a photo"),
              onPressed: () async{
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.camera);
                setState(() {
                  _file = file;
                });

              },

            ),

            //Take from from gallery
            SimpleDialogOption(
              padding: EdgeInsets.all(20),
              child: Text("Photo from gallery"),
              onPressed: () async{
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.gallery);
                setState(() {
                  _file = file;
                });

              },

            ),

          ],

        );
      });
  }
  @override
  Widget build(BuildContext context) {
    return _file == null ? Center(
      child: IconButton(
        icon: Icon(Icons.upload, color: primaryColor,),
        onPressed: () => _selectImage(context),
      ),
    ) : Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text("New Post"),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.cancel, color: Colors.white,),
          onPressed: (){},
        ),
        actions: [
          TextButton(onPressed: (){}, child: Text("Next", style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),))
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/32/Mc8kW4x9Q3aRR3RkP5Im_IMG_4417.jpg?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.3,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Write caption here..",
                    border: InputBorder.none,
                  ),
                  maxLines: 7,
                ),
              )

            ],
          )
        ],
      ),
    );
  }
}
