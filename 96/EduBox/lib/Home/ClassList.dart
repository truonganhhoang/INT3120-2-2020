import 'package:EduBox/Models/Post.dart';
import 'package:EduBox/package/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ClassBox.dart';


class ClassList extends StatelessWidget {
  final Axis scrollDirection;

  final List<String> field;
  final List<dynamic> isEqualTo;

  const ClassList({
    Key key,
    this.scrollDirection = Axis.vertical,
    this.field = const ['Accepted', 'Owner'],
    this.isEqualTo = const [false, false],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Post').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasError) {
            return snapshot.connectionState != ConnectionState.active
                ?CircularProgressIndicator()
                : ListView(
                    scrollDirection: scrollDirection,
                    children: snapshot.data.docs
                        // .where((element) => element[field[0]] != null
                        //     ? element[field[0]] == isEqualTo[0]
                        //     : true &&
                        //         (isEqualTo[1]
                        //             ? element[field[1]] == uid
                        //             : element[field[1]] != uid))
                    .where((element) => element['Accepted'] == true && element['Acceptor'] == uid)
                        .map((DocumentSnapshot document) {
                      Map map = document.data();
                      map['DocumentID'] = document.id;
                      Post post = Post.fromJson(map);
                      return document.data().isEmpty?Center(child: Text('Không có bài nào')): ClassBox(post: post);
                    }).toList(),
                  );
          } else
            return Text('Error');
        });
  }
}
