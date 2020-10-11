import 'dart:ui';

import 'package:EduBox/order_teacher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package/widget.dart';

Color _color = Color(0xff00854c);

class HomeInterface extends StatelessWidget {
  void _navigateToClassList(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ClassList()));
  }

  final appbar = AppBar(
    backgroundColor: _color,
    title: Text(
      'Edubox',
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),
    ),
    actions: [
      FocusedMenuHolder(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(Icons.message),
        ),
        menuContent: Container(),
      ),
      FocusedMenuHolder(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.notifications),
        ),
        menuContent: Container(),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: appbar,
      drawer: HamburgerMenu(
        name: 'Vu Quang Huy',
        email: 'halloffame2979@gmail.com',
      ),
      body: ListView(
        children: [
          Container(
            height: 50,
            padding: EdgeInsets.only(right: 10),
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: decoration,
              child: Icon(
                Icons.monetization_on,
                color: _color,
              ),
            ),
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
                name: 'Post new class',
                icondata: Icons.class_,
                navigatePage: NewOrderTeacher(),
              ),
              Button(
                name: 'Near Request',
                icondata: Icons.near_me,
                navigatePage: ClassList(),
              ),
              Button(
                name: 'Map',
                icondata: Icons.map,
              ),
              Button(
                name: 'Your posts',
                icondata: Icons.library_books,
                navigatePage: OrderTeacher(),
              ),
              Button(
                name: 'Schedule',
                icondata: Icons.schedule,
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
                  'New classes',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                onTap: () => _navigateToClassList(context),
                child: Container(
                  width: 150,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 10),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: 'More',
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
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: ListOfClass.list().sublist(0, 3),
            ),
          ),
        ],
      ),
    );
  }
}

class HamburgerMenu extends StatelessWidget {
  final String name;
  final String email;

  const HamburgerMenu({Key key, this.name, this.email})
      : assert(name != null),
        assert(email != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: _color),
            accountName: Text(name),
            accountEmail: Text(email),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                name[0],
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.do_not_disturb),
            title: Text("Logout"),
            enabled: true,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AlertDialog(
                        title: Text('Logout?'),
                        actions: [
                          Text('Yes'),
                          Text('No'),
                        ],
                      )));
            },
          ),
          ListTile(
            leading: Icon(Icons.done),
            title: Text("Close"),
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
