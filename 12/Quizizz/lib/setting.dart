import 'package:flutter/material.dart';
import 'components/appbar.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(
        namePage: "Setting",
        height: size.height,
      ),
      body: Container(
        // decoration: BoxDecoration(boxShadow: [
        //   BoxShadow(
        //       blurRadius: 50,
        //       offset: Offset(0, 5),
        //       color: Color.fromRGBO(0, 0, 0, 0.25))
        // ], borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            UserSetting(
              size: size,
              image: 'assets/icons/user.png',
              title: "Profile",
            ),
            UserAccount(
              size: size,
              image: 'assets/icons/account.png',
              title: "Account setting",
            )
          ],
        ),
      ),
    );
  }
}

class UserSetting extends StatelessWidget {
  const UserSetting({
    Key key,
    @required this.size,
    this.image,
    this.title,
  }) : super(key: key);

  final Size size;
  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: size.width * 0.9,
          height: size.height * 0.3,
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
                child: Column(
                  children: [
                    SettingInfo(
                      title: "Avatar",
                      prop: "Parry Pirate",
                    ),
                    SettingInfo(
                      title: "Avatar",
                      prop: "Parry Pirate",
                    ),
                    SettingInfo(
                      title: "Avatar",
                      prop: "Parry Pirate",
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SettingInfo extends StatelessWidget {
  const SettingInfo({
    Key key,
    this.title,
    this.prop,
  }) : super(key: key);
  final String title, prop;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "$title\n",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            if (prop != null)
              TextSpan(
                  text: "$prop",
                  style: TextStyle(
                    color: Color.fromRGBO(00, 00, 00, 0.6),
                    fontSize: 16,
                  ))
          ])),
          Image(image: AssetImage('assets/icons/next.png'))
        ],
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key key, @required this.size, this.image, this.title})
      : super(key: key);

  final Size size;
  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: Container(
        width: size.width * 0.8,
        child: Row(
          children: [
            Image(image: AssetImage(image)),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "$title",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserAccount extends StatelessWidget {
  const UserAccount({
    Key key,
    @required this.size,
    this.image,
    this.title,
  }) : super(key: key);

  final Size size;
  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: size.width * 0.9,
          height: size.height * 0.2,
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
                child: Column(
                  children: [
                    SettingInfo(
                      title: "User password",
                    ),
                    SettingInfo(
                      title: "Log out",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
