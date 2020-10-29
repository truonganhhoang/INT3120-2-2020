import 'dart:ui';

import 'package:EduBox/Models/Post.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ClassDetail.dart';

Color _color = Color(0xff00854c);

class ClassBox extends StatelessWidget {
  final Post post;

  const ClassBox({Key key, this.post}) : super(key: key);

  void _navigateTo(BuildContext context, Post post) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            AcceptedClass(
              post: post,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: ClayContainer(
        width: 350,
        height: 400,
        child: Column(
          children: [
            Container(
              color: _color,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      '${post.subject} - Lớp ${post.grade}',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.info,
                        color: _color,
                        size: 30,
                      ),
                    ),
                    onPressed: () => _navigateTo(context, post),
                  ),
                ],
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => _navigateTo(context, post),
                child: Column(
                  children: [
                    Text(post.toJson().toString()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
