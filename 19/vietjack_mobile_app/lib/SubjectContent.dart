import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class SubjectContent extends StatefulWidget {
  @override
  _SubjectContentState createState() => _SubjectContentState();
  String content;
  String header;
  SubjectContent({Key key, this.content, this.header}) : super(key: key);
}

class _SubjectContentState extends State<SubjectContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.header)),
      body: SingleChildScrollView(
        child: new Container(
          child: Html(data: widget.content),
        ),
      ),
    );
  }
}
