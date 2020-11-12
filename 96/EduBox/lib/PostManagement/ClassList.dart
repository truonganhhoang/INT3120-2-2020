import 'package:EduBox/IntermediateWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ClassBox.dart';

class AllMyClassList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return IntermediateClassList(
      function: (element) => element['Owner'] == uid,
      widget: (post) => post.accepted
          ? MyClassAndBeAcceptedBox(post: post)
          : MyClassAndBeNotAcceptedBox(post: post),
    );
  }
}

class MyClassAndNotBeAcceptedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return IntermediateClassList(
      function: (element) =>
          element['Accepted'] == false && element['Owner'] == uid,
      widget: (post) => MyClassAndBeNotAcceptedBox(post: post),
    );
  }
}

class MyClassAndBeAcceptedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return IntermediateClassList(
      function: (element) =>
          element['Accepted'] == true && element['Owner'] == uid,
      widget: (post) => MyClassAndBeAcceptedBox(post: post),
    );
  }
}

class OtherUnacceptedClassList extends StatelessWidget {
  final Axis scrollDirection;

  const OtherUnacceptedClassList(
      {Key key, this.scrollDirection = Axis.vertical})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return IntermediateClassList(
      scrollDirection: scrollDirection,
      function: (element) =>
          element['Accepted'] == false && element['Owner'] != uid,
      widget: (post) => OtherUnacceptedClassBox(post: post),
    );
  }
}

class UnacceptedFindStudentClassList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return IntermediateClassList(
      function: (element) =>
          element['Accepted'] == false &&
          element['Owner'] != uid &&
          element['Type'] == 0,
      widget: (post) => OtherUnacceptedClassBox(post: post),
    );
  }
}

class UnacceptedFindTeacherClassList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return IntermediateClassList(
      function: (element) =>
          element['Accepted'] == false &&
          element['Owner'] != uid &&
          element['Type'] == 1,
      widget: (post) => OtherUnacceptedClassBox(post: post),
    );
  }
}

class MyOnScheduleClassList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return IntermediateClassList(
      function: (element) =>
          element['Accepted'] == true &&
          (element['Acceptor'] == uid || element['Owner'] == uid),
      widget: (post) => post.whoPostUid == uid
          ? MyClassAndBeAcceptedBox(post: post)
          : ClassIAcceptedBox(post: post),
    );
  }
}

class ClassIAcceptedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return IntermediateClassList(
      function: (element) =>
          element['Accepted'] == true && element['Acceptor'] == uid,
      widget: (post) => ClassIAcceptedBox(post: post),
    );
  }
}
