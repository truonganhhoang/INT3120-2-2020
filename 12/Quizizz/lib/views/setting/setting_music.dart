import 'package:flutter/material.dart';

class SettingMusic extends StatefulWidget {
  const SettingMusic({
    Key key,
    this.title,
    this.prop,
  }) : super(key: key);
  final String title, prop;

  @override
  _SettingMusicState createState() => _SettingMusicState();
}

class _SettingMusicState extends State<SettingMusic> {
  bool isSwitched = false;
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
                text: "${widget.title}\n",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            if (widget.prop != null)
              TextSpan(
                  text: "${widget.prop}",
                  style: TextStyle(
                    color: Color.fromRGBO(00, 00, 00, 0.6),
                    fontSize: 16,
                  ))
          ])),
          Switch(
            value: isSwitched,
            onChanged: (bool value) => {
              setState(() => {isSwitched = value})
            },
            activeColor: Colors.lightBlueAccent,
            activeTrackColor: Colors.grey,
          )
        ],
      ),
    );
  }
}
