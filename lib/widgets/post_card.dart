import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/utils/colors.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: mobileBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post header
          Container(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'userName',
                        style: TextStyle(
                            color: primaryColor, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      color: primaryColor,
                    ))
              ],
            ),
          ),
          SizedBox(height: 4,),
          //Image section
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              child: Image.network(
                "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                fit: BoxFit.cover,
              )),
           //Like comment share section
          Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.favorite, color: Colors.red,),),
              IconButton(onPressed: (){}, icon: Icon(Icons.comment, color: primaryColor,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.share, color: primaryColor,)),
              Expanded(child: Align(
                alignment: Alignment.bottomRight,
                child: Icon(Icons.bookmark_border, color: primaryColor,),
              ))
            ],
          ),
          SizedBox(height: 2,),
          Row(
            children: [
              Text("userName", style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold
              ),),
              Text("My caption goes here....", style: TextStyle(color: primaryColor, fontWeight: FontWeight.w500),)
            ],
          ),
          //comment sections
          Container(
            child: InkWell(
              onTap: (){},
              child: Text("View all 50 Comments", style: TextStyle(
                color: primaryColor.withOpacity(0.5)
              ),),
            ),
          ),
          Container(
            child: Text("2022/08/06", style: TextStyle(
              color: primaryColor.withOpacity(0.5)
            ),),
          ),

        ],
      ),
    );
  }
}
