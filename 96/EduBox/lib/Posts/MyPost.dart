import 'package:EduBox/Home/ClassList.dart';
import 'package:flutter/material.dart';

class MyPost extends StatefulWidget {
  @override
  _MyPostState createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bài đăng của tôi'),
        ),
        body: ClassList( isEqualTo: [null, true]),
      ),
    );
  }
}
