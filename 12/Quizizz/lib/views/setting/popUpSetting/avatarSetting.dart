import 'package:flutter/material.dart';

class AvatarSetting extends StatelessWidget {
  const AvatarSetting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Container(
        height: size.height * 2 / 3,
        width: size.width * 0.8,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                "Select your avatar",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Image(image: AssetImage('assets/icons/avatar.png')),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Parry Pirate",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10, left: 35, right: 35, bottom: 20),
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(7, 188, 25, 0.9)),
              child: Text(
                "Pick this avatar",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 10),
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 8, crossAxisSpacing: 8, crossAxisCount: 3),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 2, color: Color.fromRGBO(0, 0, 0, 0.25)),
                    ),
                    child: Image(
                      image: AssetImage('assets/icons/avatarList.png'),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
