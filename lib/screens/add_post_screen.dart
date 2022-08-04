import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/model/user_model.dart';
import 'package:instagram/providers/user_provider.dart';
import 'package:instagram/resources/firestore_method.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/utils/image_picker.dart';
import 'package:instagram/utils/snack_bar.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  TextEditingController _descriptionController = TextEditingController();
  bool _isLoading = false;


  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Create Post"),
            children: [
              //Take photo from camera
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: Text("Take a photo"),
                onPressed: () async {
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
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
              ), SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: Text("Cancel"),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  //posting image to firebase
  postImage(String uid,
      String userName,
      String profileImage,) async {
    setState(() {
      _isLoading = true;
    });
    try {
      String res = await FirestoreMethods().uploadPost(
          _descriptionController.text, _file! , uid, profileImage, userName);
      if(res == "Success"){
        setState(() {
          _isLoading = false;
        });
        emptyImage();
        showSnackBar("Post Uploaded", context);
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(e.toString(), context);

    }
  }

  emptyImage(){
    setState(() {
      _file = null;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider
        .of<UserProvider>(context)
        .getUser;
    log(user.photoUrl);
    return _file == null
        ? Center(
      child: IconButton(
        icon: Icon(
          Icons.upload,
          color: primaryColor,
        ),
        onPressed: () => _selectImage(context),
      ),
    )
        : Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text("New Post"),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.cancel,
            color: Colors.white,
          ),
          onPressed: () => emptyImage(),
        ),
        actions: [
          TextButton(
              onPressed:()=> postImage(user.uid, user.userName, user.photoUrl),
              child: Text(
                "Next",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ))
        ],
      ),
      body: Column(
        children: [
          _isLoading ? Container(
            padding: EdgeInsets.symmetric(vertical: 20),
              child: LinearProgressIndicator()) : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.photoUrl, scale: 2),

              ),
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.3,
                child: TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    hintText: "Write caption here..",
                    border: InputBorder.none,
                  ),
                  maxLines: 7,
                ),
              ),
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.3,
                child: Image(
                    image: MemoryImage(_file!)
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
