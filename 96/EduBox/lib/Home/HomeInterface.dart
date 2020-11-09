import 'dart:ui';
import 'package:EduBox/NewPost/NewPost.dart';
import 'package:EduBox/NewPost/NewPostTemplate.dart';
import 'package:EduBox/PostManagement/ClassList.dart';
import 'package:EduBox/PostManagement/ClassPageRoute.dart';
import 'package:EduBox/UserInformation/UserInformation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'Button.dart';

Color _color = Color(0xff00854c);

class HomeInterface extends StatelessWidget {
  final appbar = AppBar(
    backgroundColor: _color,
    title: Text(
      'Waiting Wisdom',
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    var submitForm = Provider.of<SubmitForm>(context);
    return SafeArea(
      child: Scaffold(
        appBar: appbar,
        drawer: HamburgerMenu(
          name: user.displayName,
          email: user.email,
          photoURL: user.photoURL,
        ),
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
                  icondata: Icon(Icons.class_, size: 55),
                  navigatePage: SafeArea(
                    child: Scaffold(
                      appBar: AppBar(
                        title: Text('Thêm yêu cầu mới'),
                      ),
                      body: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                submitForm.reset();
                                submitForm.type = 0;
                                Navigator.of(context).pop();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => NewPost()));
                              },
                              child: ClayContainer(
                                height: 60,
                                width: 300,
                                child: Center(
                                    child: Text(
                                  'Tìm học sinh',
                                  style: TextStyle(fontSize: 30),
                                )),
                              ),
                            ),
                            Divider(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                submitForm.reset();
                                submitForm.type = 1;
                                Navigator.of(context).pop();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => NewPost()));
                              },
                              child: ClayContainer(
                                height: 60,
                                width: 300,
                                child: Center(
                                    child: Text(
                                  'Tìm gia sư',
                                  style: TextStyle(fontSize: 30),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Button(
                    name: 'Yêu cầu gần đây',
                    icondata: Icon(Icons.near_me, size: 55),
                    navigatePage: OtherUnacceptedClassPage()),
                Button(
                  name: 'Bản đồ',
                  icondata: Icon(Icons.map, size: 55),
                ),
                Button(
                  name: 'Bài đăng của bạn',
                  icondata: Icon(Icons.library_books, size: 55),
                  navigatePage: AllMyClassPage(),
                ),
                Button(
                  name: 'Lịch học',
                  icondata: Icon(Icons.schedule, size: 55),
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

class HamburgerMenu extends StatelessWidget {
  final String name;
  final String email;
  final String photoURL;

  const HamburgerMenu({Key key, this.name, this.email, this.photoURL})
      : super(key: key);

  Future<void> signOutGoogle() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: _color),
            accountName: Text(name ?? ''),
            accountEmail: Text(email ?? ''),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.network(photoURL),
              ),
            ),
          ),
          ListTile(
            title: Text('Thông tin cá nhân'),
            trailing: Icon(Icons.info),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => UserInformation()));
            },
          ),
          ListTile(
            title: Text("Đăng xuất"),
            trailing: Icon(Icons.do_not_disturb),
            enabled: true,
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Đăng xuất?'),
                  actions: [
                    FlatButton(
                        child: Container(
                          child: Text('Có'),
                          height: 20,
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                          signOutGoogle();
                        }),
                    FlatButton(
                      child: Container(
                        child: Text('Không'),
                        height: 20,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                barrierDismissible: true,
              );
            },
          ),
          ListTile(
            title: Text("Đóng"),
            trailing: Icon(Icons.cancel),
            enabled: true,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
