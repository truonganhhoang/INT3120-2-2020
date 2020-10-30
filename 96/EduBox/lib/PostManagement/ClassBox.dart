import 'dart:ui';
import 'package:EduBox/Models/Post.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'ClassDetail.dart';

Color _color = Color(0xff00854c);
var _divider = Divider(height: 5, color: Colors.transparent);
var database = FirebaseFirestore.instance;

class BoxRecord extends StatelessWidget {
  final String label, info;

  const BoxRecord({Key key, this.label, this.info})
      : assert(label != null),
        assert(info != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(left: 40),
          width: 150,
          child: Text(
            label + ' : ',
            style: TextStyle(
              color: Colors.red,
              fontSize: 17,
            ),
          ),
        ),
        Text(
          info,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
      ],
    );
  }
}

class ClassBox extends StatelessWidget {
  final Post post;
  final Widget toClassDetail;
  final Widget content;

  const ClassBox({Key key, this.post, this.toClassDetail, this.content})
      : super(key: key);

  void _navigateTo(BuildContext context, Post post) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => toClassDetail),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
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
              child: GestureDetector(
                onTap: () => _navigateTo(context, post),
                child: Container(color: Colors.transparent, child: content),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClassAndBeAcceptedBox extends StatelessWidget {
  final Post post;

  const MyClassAndBeAcceptedBox({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClassBox(
        post: post,
        toClassDetail: MyClassAndBeAcceptedDetail(post: post),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _divider,
            BoxRecord(
                label: 'Đang tìm',
                info: post.type == 0 ? 'Học sinh' : 'Gia sư'),
            _divider,
            BoxRecord(label: 'Môn', info: post.subject),
            _divider,
            BoxRecord(label: 'Lớp', info: post.grade.toString()),
            _divider,
            BoxRecord(
              label: 'Trạng thái',
              info: post.accepted ? 'Đã được nhận' : 'Chưa được nhận',
            ),
            _divider,
            BoxRecord(label: 'Địa chỉ', info: post.address),
            _divider,
            BoxRecord(
              label: 'Lương',
              info: '${post.salary.toInt() * 10000}',
            ),
            _divider,
            BoxRecord(label: 'Giới tính yêu cầu', info: post.gender),
            _divider,
          ],
        ));
  }
}

class MyClassAndBeNotAcceptedBox extends StatelessWidget {
  final Post post;

  const MyClassAndBeNotAcceptedBox({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClassBox(
      post: post,
      toClassDetail: MyClassAndBeNotAcceptedDetail(post: post),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _divider,
          BoxRecord(
              label: 'Đang tìm', info: post.type == 0 ? 'Học sinh' : 'Gia sư'),
          _divider,
          BoxRecord(label: 'Môn', info: post.subject),
          _divider,
          BoxRecord(label: 'Lớp', info: post.grade.toString()),
          _divider,
          BoxRecord(label: 'Trạng thái', info: 'Chưa được nhận'),
          _divider,
          BoxRecord(label: 'Địa chỉ', info: post.address),
          _divider,
          BoxRecord(
            label: 'Lương',
            info: '${post.salary.toInt() * 10000}',
          ),
          _divider,
          BoxRecord(label: 'Giới tính yêu cầu', info: post.gender),
          _divider,
        ],
      ),
    );
  }
}

class ClassIAcceptedBox extends StatelessWidget {
  final Post post;

  const ClassIAcceptedBox({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClassBox(
      post: post,
      toClassDetail: ClassIAcceptedDetail(post: post),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _divider,
          BoxRecord(
              label: 'Đang tìm', info: post.type == 0 ? 'Học sinh' : 'Gia sư'),
          _divider,
          BoxRecord(label: 'Môn', info: post.subject),
          _divider,
          BoxRecord(label: 'Lớp', info: post.grade.toString()),
          _divider,
          BoxRecord(label: 'Trạng thái', info: 'Đã nhận'),
          _divider,
          BoxRecord(label: 'Địa chỉ', info: post.address),
          _divider,
          BoxRecord(
            label: 'Lương',
            info: '${post.salary.toInt() * 10000}',
          ),
          _divider,
          BoxRecord(label: 'Giới tính yêu cầu', info: post.gender),
          _divider,
        ],
      ),
    );
  }
}

class OtherUnacceptedClassBox extends StatelessWidget {
  final Post post;

  const OtherUnacceptedClassBox({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClassBox(
      post: post,
      toClassDetail: OtherUnacceptedClassDetail(post: post),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _divider,
          BoxRecord(
              label: 'Đang tìm', info: post.type == 0 ? 'Học sinh' : 'Gia sư'),
          _divider,
          BoxRecord(label: 'Môn', info: post.subject),
          _divider,
          BoxRecord(label: 'Lớp', info: post.grade.toString()),
          _divider,
          BoxRecord(label: 'Trạng thái', info: 'Chưa được nhận'),
          _divider,
          BoxRecord(label: 'Địa chỉ', info: post.address),
          _divider,
          BoxRecord(
            label: 'Lương',
            info: '${post.salary.toInt() * 10000}',
          ),
          _divider,
          BoxRecord(label: 'Giới tính yêu cầu', info: post.gender),
          _divider,
        ],
      ),
    );
  }
}
