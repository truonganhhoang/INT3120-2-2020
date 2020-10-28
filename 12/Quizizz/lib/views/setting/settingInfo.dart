import 'package:flutter/material.dart';
import 'package:quiztest/views/setting/popUpSetting/avatarSetting.dart';

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
      padding: const EdgeInsets.only(top: 5, bottom: 8),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AvatarSetting();
              });
        },
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
      ),
    );
  }
}
