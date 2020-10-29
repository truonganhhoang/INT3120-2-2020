import 'package:EduBox/Home/ClassBox.dart';
import 'package:EduBox/Models/Post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyClassSchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var field = ['Accepted', 'Owner', 'Acceptor'];
    String uid = FirebaseAuth.instance.currentUser.uid;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Các lớp của tôi'),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Post').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasError) {
                return snapshot.connectionState == ConnectionState.active
                    ? ListView(
                        children: snapshot.data.docs
                            .where((element) =>
                                element[field[0]] == true &&
                                (element[field[1]] == uid ||
                                    element[field[2]] == uid))
                            .map((DocumentSnapshot document) {
                          Map map = document.data();
                          map['DocumentID'] = document.id;
                          Post post = Post.fromJson(map);
                          return ClassBox(post: post);
                        }).toList(),
                      )
                    : CircularProgressIndicator();
              } else
                return Text('Error');
            }),
      ),
    );
  }
}
