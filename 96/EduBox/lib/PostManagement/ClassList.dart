import 'package:EduBox/Models/Post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ClassBox.dart';

class AllMyClassList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Post').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasError) {
            if (snapshot.connectionState != ConnectionState.active)
              return CircularProgressIndicator();
            List<Widget> list = snapshot.data.docs
                .where((element) => element['Owner'] == uid)
                .map((DocumentSnapshot document) {
              Map map = document.data();
              map['DocumentID'] = document.id;
              Post post = Post.fromJson(map);
              return post.accepted
                  ? MyClassAndBeAcceptedBox(post: post)
                  : MyClassAndBeNotAcceptedBox(post: post);
            }).toList();
            return list.length != 0
                ? ListView(
                    shrinkWrap: true,
                    children: list,
                  )
                : Center(
                    child: Text(
                    'Không có bài nào',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ));
          } else
            return Text('Error');
        });
  }
}

class MyClassAndNotBeAcceptedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Post').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasError) {
            if (snapshot.connectionState != ConnectionState.active)
              return CircularProgressIndicator();
            List<Widget> list = snapshot.data.docs
                .where((element) =>
                    element['Accepted'] == false && element['Owner'] == uid)
                .map((DocumentSnapshot document) {
              Map map = document.data();
              map['DocumentID'] = document.id;
              Post post = Post.fromJson(map);
              return MyClassAndBeNotAcceptedBox(post: post);
            }).toList();
            return list.length != 0
                ? ListView(
                    children: list,
                  )
                : Center(
                    child: Text(
                    'Không có bài nào',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ));
          } else
            return Text('Error');
        });
  }
}

class MyClassAndBeAcceptedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Post').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasError) {
            if (snapshot.connectionState != ConnectionState.active)
              return CircularProgressIndicator();
            List<Widget> list = snapshot.data.docs
                .where((element) =>
                    element['Accepted'] == true && element['Owner'] == uid)
                .map((DocumentSnapshot document) {
              Map map = document.data();
              map['DocumentID'] = document.id;
              Post post = Post.fromJson(map);
              return MyClassAndBeAcceptedBox(post: post);
            }).toList();
            return list.length != 0
                ? ListView(
                    children: list,
                  )
                : Center(
                    child: Text(
                    'Không có bài nào',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ));
          } else
            return Text('Error');
        });
  }
}

class OtherUnacceptedClassList extends StatelessWidget {
  final Axis scrollDirection;

  const OtherUnacceptedClassList({Key key, this.scrollDirection = Axis.vertical}) : super(key: key);@override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Post').orderBy('PostDate').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasError) {
            if (snapshot.connectionState != ConnectionState.active)
              return CircularProgressIndicator();
            List<Widget> list = snapshot.data.docs
                .where((element) =>
                    element['Accepted'] == false && element['Owner'] != uid)
                .map((DocumentSnapshot document) {
              Map map = document.data();
              map['DocumentID'] = document.id;
              Post post = Post.fromJson(map);
              return OtherUnacceptedClassBox(post: post);
            }).toList();
            return list.length != 0
                ? ListView(
              scrollDirection: scrollDirection,
                    children: list,
                  )
                : Center(
                    child: Text(
                    'Không có bài nào',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ));
          } else
            return Text('Error');
        });
  }
}

class MyOnScheduleClassList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Post').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasError) {
            if (snapshot.connectionState != ConnectionState.active)
              return CircularProgressIndicator();
            List<Widget> list = snapshot.data.docs
                .where((element) =>
                    element['Accepted'] == true &&
                    (element['Acceptor'] == uid || element['Owner'] == uid))
                .map((DocumentSnapshot document) {
              Map map = document.data();
              map['DocumentID'] = document.id;
              Post post = Post.fromJson(map);
              return post.whoPostUid == uid
                  ? MyClassAndBeAcceptedBox(post: post)
                  : ClassIAcceptedBox(post: post);
            }).toList();
            return list.length != 0
                ? ListView(
                    children: list,
                  )
                : Center(
                    child: Text(
                    'Không có bài nào',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ));
          } else
            return Text('Error');
        });
  }
}

class ClassIAcceptedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Post').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasError) {
            if (snapshot.connectionState != ConnectionState.active)
              return CircularProgressIndicator();
            List<Widget> list = snapshot.data.docs
                .where((element) =>
                    element['Accepted'] == true && element['Acceptor'] == uid)
                .map((DocumentSnapshot document) {
              Map map = document.data();
              map['DocumentID'] = document.id;
              Post post = Post.fromJson(map);
              return ClassIAcceptedBox(post: post);
            }).toList();
            return list.length != 0
                ? ListView(
                    children: list,
                  )
                : Center(
                    child: Text(
                    'Không có bài nào',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ));
          } else
            return Text('Error');
        });
  }
}
