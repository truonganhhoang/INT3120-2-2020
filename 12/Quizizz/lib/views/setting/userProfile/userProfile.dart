import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quiztest/services/user.dart';
import 'package:quiztest/views/setting/popUpSetting/avatarSetting.dart';
import 'package:quiztest/views/setting/popUpSetting/userName.dart';
import '../settingInfo.dart';
import '../setting_category.dart';
import 'package:quiztest/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quiztest/services/api_manager.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    Key key,
    @required this.size,
    this.image,
    this.title,
  }) : super(key: key);

  final Size size;
  final String image, title;

  @override
  Widget build(BuildContext context) {
    Future _userName = UserSave().userName();
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: size.width * 0.9,
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
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AvatarSetting();
                            });
                      },
                      child: SettingInfo(
                        title: "Avatar",
                        prop: "Parry Pirate",
                      ),
                    ),
                    FutureBuilder<String>(
                        future: _userName,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return UserNameSetting(
                                        userName: snapshot.data.toString(),
                                      );
                                    });
                              },
                              child: SettingInfo(
                                title: "User name",
                                prop: snapshot.data.toString(),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          } else
                            return SpinKitDualRing(
                              color: Colors.blue,
                            );
                        }),
                    SettingInfo(
                      title: "Grade",
                      prop: "Univ.",
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
