import 'package:EduBox/Home/ClassList.dart';
import 'package:flutter/material.dart';

class AllUnacceptedPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Các lớp mới'),
        ),
        body: ClassList(isEqualTo: [false, false]),
      ),
    );
  }
}
