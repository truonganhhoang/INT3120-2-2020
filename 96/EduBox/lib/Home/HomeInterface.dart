import 'package:EduBox/IntermediateWidget.dart';
import 'package:EduBox/NewPost/FindTeacherOrStudent.dart';
import 'package:EduBox/PostManagement/ClassList.dart';
import 'package:EduBox/PostManagement/ClassPageRoute.dart';
import 'package:EduBox/UserInformation/UserInformation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Button.dart';

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
              builder: (_) => BackgroundColor(color: background,),
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

class HamburgerMenu extends StatelessWidget {
  Future<void> signOutGoogle() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    final String name = user.displayName;
    final String email = user.email;
    final String photoURL = user.photoURL;
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
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
              submitYesOrNo(
                context,
                function: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  signOutGoogle();
                },
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

class BackgroundColor extends StatefulWidget {
  final int color;

  const BackgroundColor({Key key, this.color = 3}) : super(key: key);

  @override
  _BackgroundColorState createState() => _BackgroundColorState();
}

class _BackgroundColorState extends State<BackgroundColor> {
  int checked;
  bool changed = false;
  @override
  void initState() {
    super.initState();
    checked = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    List<String> _name = ['Hồng', 'Xanh dương', 'Xanh lá', 'Tím'];
    List<Color> _color = [
      Colors.pink,
      Colors.blue[600],
      Colors.green[600],
      Colors.purple[400]
    ];
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                4,
                (index) => Container(
                      width: 300,
                      child: Card(
                        color: Colors.blue[50],
                        child: ListTile(
                          leading: Icon(Icons.circle, color: _color[index]),
                          title: Text(
                            _name[index],
                          ),
                          trailing: checked == index ? Icon(Icons.done) : null,
                          selected: checked == index,
                          onTap: () async {
                            setState(() {
                              if(checked == index) return;
                              checked = index;
                              changed = true;
                            });
                            var prefs = await SharedPreferences.getInstance();
                            prefs.setInt('backgroundColor', index);
                          },
                        ),
                      ),
                    )),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Visibility(
            visible: changed,
            child: Card(
              child: ListTile(
                trailing: Icon(Icons.check_circle, color: Theme.of(context).primaryColor,),
                title: Text(
                  'Thay đổi sẽ được cập nhật sau khi khởi động lại',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
