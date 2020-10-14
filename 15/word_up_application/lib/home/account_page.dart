import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_up_application/size_config.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: SizeConfig.screenWidth / 3 * 2.3,
        child: Drawer(
          child: Container(
            color: Colors.white,
            child: new ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: new Text(
                    "Word Up",
                    style: TextStyle(
                        fontSize: 2.4 * SizeConfig.textMultiplier,
                        color: Colors.white),
                  ),
                  accountEmail: new Text(
                    "wordup15@gmail.com",
                    style: TextStyle(
                        fontSize: 1.8 * SizeConfig.textMultiplier,
                        color: Colors.white),
                  ),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new ExactAssetImage('assets/images/wordup.JPG'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.lightBlueAccent,
                    child: Text(
                      'W',
                      style: TextStyle(
                          fontSize: 4 * SizeConfig.textMultiplier,
                          color: Colors.black),
                    ),
                  ),
                ),
                new ListTile(
                    leading: Icon(Icons.person),
                    title: new Text("My Account"),
                    onTap: () {
                      Navigator.pop(context);
                    }),
                new Divider(),
                new ListTile(
                    leading: Icon(Icons.info),
                    title: new Text("About us"),
                    onTap: () {
                      Navigator.pop(context);
                    }),
                new ListTile(
                    leading: Icon(Icons.feedback),
                    title: new Text("Feedback"),
                    onTap: () {
                      Navigator.pop(context);
                    }),
                new ListTile(
                    leading: Icon(Icons.help),
                    title: new Text("Support"),
                    onTap: () {
                      Navigator.pop(context);
                    }),
                new Divider(),
                new ListTile(
                    leading: Icon(Icons.power_settings_new),
                    title: new Text("Logout"),
                    onTap: () {
                      Navigator.pop(context);
                    }),
                new Container(
                  margin: EdgeInsets.only(top: 3 * SizeConfig.heightMultiplier),
                  child: Text(
                    "WordUp",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 4.5 * SizeConfig.textMultiplier,
                        color: Colors.lightBlueAccent),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
