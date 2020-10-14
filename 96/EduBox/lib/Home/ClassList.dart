import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ClassBox.dart';

Color _color = Color(0xff00854c);
var name = ['Tiếng Anh', 'Toán', 'Văn', 'Hóa', 'Lý', 'Sinh', 'Tin'];
var grade = ['9', '10', '11', '12', '9', '12', '9'];

class ListOfClass {
  ListOfClass();

  static List<ClassBox> list() {
    return List.generate(
        name.length,
        (i) => ClassBox(
              name: name[i],
              grade: grade[i],
            ));
  }
}

class ClassList extends StatelessWidget {
  const ClassList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: _color,
          title: Text('All classes'),
        ),
        body: ListView(
          children: List.generate(
              name.length,
                  (i) =>
                  Center(
                    child: ClassBox(
                      name: name[i],
                      grade: grade[i],
                    ),
                  )),
        ),
      ),
    );
  }
}
