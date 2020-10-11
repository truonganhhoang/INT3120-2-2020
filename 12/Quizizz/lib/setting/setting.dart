import 'package:flutter/material.dart';
import 'package:quiztest/setting/userAccount/userAccount.dart';
import 'package:quiztest/setting/userProfile/userProfile.dart';
import 'package:quiztest/setting/userSetting/userSetting.dart';
import '../components/appbar.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(
        namePage: "Setting",
        height: size.height,
      ),
      body: ListView(
        children: [
          UserProfile(
            size: size,
            image: 'assets/icons/user.png',
            title: "Profile",
          ),
          UserAccount(
            size: size,
            image: 'assets/icons/account.png',
            title: "Account setting",
            content: ["User password", "Log out"],
          ),
          UserSetting(
            size: size,
            image: "assets/icons/userSetting.png",
            title: "Setting",
            content: ["Music", "Sound"],
          )
        ],
      ),
    );
  }
}
