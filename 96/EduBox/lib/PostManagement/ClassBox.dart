import 'package:EduBox/IntermediateWidget.dart';
import 'package:EduBox/Models/Post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ClassDetail.dart';

class MyClassAndBeAcceptedBox extends StatelessWidget {
  final Post post;

  const MyClassAndBeAcceptedBox({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntermediateClassBox(
      post: post,
      toClassDetail: MyClassAndBeAcceptedDetail(post: post),
    );
  }
}

class MyClassAndBeNotAcceptedBox extends StatelessWidget {
  final Post post;

  const MyClassAndBeNotAcceptedBox({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntermediateClassBox(
      post: post,
      toClassDetail: MyClassAndBeNotAcceptedDetail(post: post),
    );
  }
}

class ClassIAcceptedBox extends StatelessWidget {
  final Post post;

  const ClassIAcceptedBox({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntermediateClassBox(
      post: post,
      toClassDetail: ClassIAcceptedDetail(post: post),
    );
  }
}

class OtherUnacceptedClassBox extends StatelessWidget {
  final Post post;

  const OtherUnacceptedClassBox({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntermediateClassBox(
      post: post,
      toClassDetail: OtherUnacceptedClassDetail(post: post),
    );
  }
}
