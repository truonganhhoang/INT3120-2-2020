import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:word_up_application/services/auth_service.dart';
import 'package:word_up_application/services/authentication_screen.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/user.dart';
import 'package:word_up_application/user_profile_screen/user_profile_screen.dart';
import '../app_manager.dart';
import '../loading.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppUser user = AppManager.instance.appUser;
    if(user == null){
      user = AppUser(
        userPrivateInformation: UserPrivateInformation(
            email: 'englishvocab@gmail.com',
            userName: 'English Vocab'
        ),
      );
    }

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
                    user.userPrivateInformation.userName,
                    style: TextStyle(
                        fontSize: 2.4 * SizeConfig.textMultiplier,
                        color: Colors.white),
                  ),
                  accountEmail: new Text(
                    user.userPrivateInformation.email,
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
                      user.userPrivateInformation.userName[0],
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
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: UserProfileScreen()));
                    }),
                new Divider(),
                new ListTile(
                    leading: Icon(Icons.info),
                    title: new Text("About us"),
                    onTap: () {
                      _launchURL();
                    }),
                new ListTile(
                    leading: Icon(Icons.feedback),
                    title: new Text("Feedback"),
                    onTap: () {
                      _launchURL();
                    }),
                new ListTile(
                    leading: Icon(Icons.help),
                    title: new Text("Support"),
                    onTap: () {
                      _launchURL();
                    }),
                new Divider(),
                new ListTile(
                    leading: Icon(Icons.power_settings_new),
                    title: new Text("Logout"),
                    onTap: () {
                      AuthService.instance.signOutGoogle();
                    }),
                new Container(
                  margin: EdgeInsets.only(top: 3 * SizeConfig.heightMultiplier),
                  child: Text(
                    "E Vocab",
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

_launchURL() async {
  const url = 'https://sites.google.com/view/evocab/trang-ch%E1%BB%A7';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
