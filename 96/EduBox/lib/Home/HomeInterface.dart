import 'package:EduBox/NewPost/FindTeacherOrStudent.dart';
import 'package:EduBox/PostManagement/ClassList.dart';
import 'package:EduBox/PostManagement/ClassPageRoute.dart';
import 'package:flutter/material.dart';

import 'BackgroundColor.dart';
import 'Button.dart';
import 'HamburgerMenu.dart';

class HomeInterface extends StatelessWidget {
  final int background;

  const HomeInterface({Key key, this.background}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Text(
        'Waiting Wisdom',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => BackgroundColor(
                color: background,
              ),
              barrierDismissible: true,
            );
          },
        )
      ],
    );
    return SafeArea(
      child: Scaffold(
        appBar: appbar,
        drawer: HamburgerMenu(),
        body: ListView(
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.only(right: 10),
            ),
            Divider(
              height: 0,
              thickness: 1,
              color: Colors.grey,
            ),
            Divider(
              color: Colors.transparent,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                Button(
                  name: 'Đăng bài',
                  iconData: Icon(Icons.class_, size: 55),
                  navigatePage: FindTeacherOrStudent(),
                ),
                Button(
                    name: 'Yêu cầu gần đây',
                    iconData: Icon(Icons.near_me, size: 55),
                    navigatePage: OtherUnacceptedClassPage()),
                Button(
                  name: 'Bản đồ',
                  iconData: Icon(Icons.map, size: 55),
                ),
                Button(
                  name: 'Bài đăng của bạn',
                  iconData: Icon(Icons.library_books, size: 55),
                  navigatePage: AllMyClassPage(),
                ),
                Button(
                  name: 'Lịch học',
                  iconData: Icon(Icons.schedule, size: 55),
                  navigatePage: MyOnScheduleClassPage(),
                ),
              ],
            ),
            Divider(
              height: 0,
              thickness: 1,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Các lớp mới',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OtherUnacceptedClassPage()));
                  },
                  child: Container(
                    width: 150,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(top: 3, bottom: 0, right: 10),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 255, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: 'Xem tất cả',
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.navigate_next,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 400,
              child: OtherUnacceptedClassList(scrollDirection: Axis.horizontal),
            ),
          ],
        ),
      ),
    );
  }
}
