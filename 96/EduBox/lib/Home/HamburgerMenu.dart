import 'package:EduBox/UserInformation/UserInformation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../IntermediateWidget.dart';

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
