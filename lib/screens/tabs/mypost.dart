import 'package:flutter/material.dart';

class MyPost extends StatefulWidget {
  const MyPost({Key? key}) : super(key: key);

  @override
  MyPostState createState() => MyPostState();
}

class MyPostState extends State<MyPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.yellow);
  }
}
