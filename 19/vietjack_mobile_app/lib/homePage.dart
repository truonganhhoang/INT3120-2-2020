import 'package:flutter/material.dart';
import 'header.dart';
class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return new Scaffold(
      appBar: new AppBar(title: new Text("Home Page"),centerTitle: true,),
      body: new header(width: width,height: height)
    );
  }
}
