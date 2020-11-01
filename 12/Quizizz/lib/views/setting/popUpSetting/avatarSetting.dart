import 'package:flutter/material.dart';

class AvatarSetting extends StatefulWidget {
  const AvatarSetting({Key key}) : super(key: key);

  @override
  _AvatarSettingState createState() => _AvatarSettingState();
}

class _AvatarSettingState extends State<AvatarSetting> {
  List<Map> avatar = [
    {"title": "Actor", "image": "actor.png", "isChosen": true},
    {"title": "Artist", "image": "artist.png", "isChosen": false},
    {"title": "Officer", "image": "officer.png", "isChosen": false},
    {"title": "Pilot", "image": "pilot.png", "isChosen": false},
    {"title": "Sailor", "image": "sailor.png", "isChosen": false},
    {"title": "Painter", "image": "painter.png", "isChosen": false},
  ];
  Map currentAvatar = {"title": "Actor", "image": "actor.png"};
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.white,
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
              Image(
                image: AssetImage('assets/icons/' + currentAvatar['image']),
                width: 70,
                height: 70,
                fit: BoxFit.contain,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  currentAvatar['title'],
                  style: TextStyle(fontSize: 16),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  margin:
                      EdgeInsets.only(top: 10, left: 35, right: 35, bottom: 20),
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(7, 188, 25, 0.9)),
                  child: Text(
                    "Pick this avatar",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      crossAxisCount: 3),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        for (int i = 0; i < avatar.length; i++) {
                          if (avatar[i]['isChosen'] = true && i != index) {
                            avatar[i]['isChosen'] = false;
                          }
                        }
                        if (!avatar[index]['isChosen']) {
                          setState(() {
                            avatar[index]['isChosen'] =
                                !avatar[index]['isChosen'];
                            currentAvatar['title'] = avatar[index]['title'];
                            currentAvatar['image'] = avatar[index]['image'];
                          });
                        }
                      },
                      child: AvatarList(
                        isChosen: avatar[index]['isChosen'],
                        title: avatar[index]['title'],
                        image: avatar[index]['image'],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class AvatarList extends StatefulWidget {
  const AvatarList({
    Key key,
    this.title,
    this.image,
    this.isChosen,
  }) : super(key: key);
  final String title;
  final String image;
  final bool isChosen;
  @override
  _AvatarListState createState() => _AvatarListState();
}

class _AvatarListState extends State<AvatarList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.isChosen
            ? Colors.orangeAccent.withOpacity(0.5)
            : Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
            width: 2,
            color: widget.isChosen
                ? Colors.orangeAccent
                : Color.fromRGBO(0, 0, 0, 0.25)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(
            image: AssetImage('assets/icons/${widget.image}'),
            width: 55,
            height: 55,
            fit: BoxFit.contain,
          ),
          Container(
            child: Text(
              "${widget.title}",
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
