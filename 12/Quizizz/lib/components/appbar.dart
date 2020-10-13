import 'package:flutter/material.dart';
import 'package:quiztest/components/popupMenu.dart';

class CustomAppBar extends PreferredSize {
  final String namePage;
  final double height;
  final TabBar tabs;

  CustomAppBar({@required this.namePage, @required this.height, this.tabs});

  @override
  Size get preferredSize => Size.fromHeight(height * 0.08);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        title: Text(
          namePage,
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(235, 235, 235, 1),
                    shape: BoxShape.circle),
                child: Image(
                  image: AssetImage('assets/icons/menu.png'),
                ),
              ),
            ),
          ),
        ],
        bottom: tabs,
      ),
    );
  }
}
