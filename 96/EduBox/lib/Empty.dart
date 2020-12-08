import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Models/Post.dart';

class Empty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Post').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasError) {
            if (snapshot.connectionState != ConnectionState.active)
              return CircularProgressIndicator();
            List list = (snapshot.data.docs
                  ..sort((a, b) => a['PostDate'].compareTo(b['PostDate'])))
                .where((element) => null)
                .map((DocumentSnapshot document) {
                  Map<String, dynamic> map = document.data();
                  map['DocumentID'] = document.id ?? '';
                  Post post = Post.fromJson(map);
                  return post;
                })
                .map((e) => null)
                .toList()
                .cast<Widget>();
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
