import 'package:flutter/material.dart';
import 'package:quiztest/views/setting/setting_music.dart';

import '../setting_category.dart';

class UserSetting extends StatelessWidget {
  const UserSetting({
    Key key,
    @required this.size,
    this.image,
    this.title,
    this.content,
  }) : super(key: key);

  final Size size;
  final String image, title;
  final List<String> content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                  color: Colors.black.withOpacity(0.3))
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Profile(
                size: size,
                image: image,
                title: title,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: size.width * 0.8,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, index) {
                    return SettingMusic(title: content[index]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
