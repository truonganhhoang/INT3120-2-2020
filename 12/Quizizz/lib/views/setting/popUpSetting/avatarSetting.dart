import 'package:flutter/material.dart';

class AvatarSetting extends StatelessWidget {
  const AvatarSetting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.transparent,
      child: Container(
        height: size.height * 2 / 3,
        width: size.width * 0.8,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
