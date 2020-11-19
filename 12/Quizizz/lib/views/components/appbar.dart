import 'package:flutter/material.dart';

const List<Map> choices = [
  {"name": "Setting", "icon": "settings"},
  {"name": "Log out", "icon": "logout"}
];

class CustomAppBar extends PreferredSize {
  final String namePage;
  final double height;
  final TabBar tabs;

  CustomAppBar({@required this.namePage, @required this.height, this.tabs});

  @override
  Size get preferredSize => Size.fromHeight(height * 0.08);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: AppBar(
        title: Text(
          namePage,
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(235, 235, 235, 1),
                    shape: BoxShape.circle),
                child: PopupMenuButton<String>(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onSelected: (String result) {},
                    itemBuilder: (BuildContext context) {
                      return choices.map((choice) {
                        return PopupMenuItem<String>(
                          value: choice['name'],
                          child: Center(
                            child: Container(
                              width: size.width * 0.3,
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 15),
                                    child: Image(
                                      image: AssetImage(
                                          'assets/icons/${choice['icon']}.png'),
                                    ),
                                  ),
                                  Text(choice['name']),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList();
                    }),
              ),
            ),
          ),
        ],
        bottom: tabs,
      ),
    );
  }
}
