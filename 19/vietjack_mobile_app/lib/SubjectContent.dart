import 'package:flutter/material.dart';
class SubjectContent extends StatefulWidget {
  @override
  _SubjectContentState createState() => _SubjectContentState();
  String content;
  SubjectContent({Key key,this.content}):super(key: key);
}

class _SubjectContentState extends State<SubjectContent> {
  @override
  Widget build(BuildContext context) {
    return new Text(widget.content);
  }
}
