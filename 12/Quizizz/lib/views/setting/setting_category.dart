import 'package:flutter/material.dart';

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
