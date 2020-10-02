import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maths_game/GameModeScreen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class KienThucScreen extends StatefulWidget {
  // KienThucScreen({Key key}) : super(key: key);

  // Phép tính gì? +,-,x hay :
  String calculation;

  KienThucScreen(this.calculation);

  @override
  _KienThucScreen createState() => _KienThucScreen();
}

class _KienThucScreen extends State<KienThucScreen> {
  int chosenSection;

  void _navigateBack(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            new GameModeScreen(widget.calculation)));
  }

  Section(int number1) {
    getData(number1, widget.calculation).then((val) => setState(() {
          chosenSection = number1;
          maps = val;
        }));
  }
  //Khi vừa khởi tạo _test gọi hàm GetData, đợi khi GetData chạy xong thì truyền kết quả của nó là val vào maps và Setstate()

  getData(int number1, String calculation) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "working_data.db");
    var res;

    ByteData data =
        await rootBundle.load(join("Database", "maths_game_database.db"));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await new File(path).writeAsBytes(bytes);
    // open database but have to wait a bit
    var db = await openDatabase(path, readOnly: true);
    if (calculation == "divide") {
      res = await db
          .query(calculation, where: "result = ?", whereArgs: [number1]);
    } else {
      res = await db
          .query(calculation, where: "number1 = ?", whereArgs: [number1]);
    }
    // query returns List<Map> and have to wait a bit too
    return res;
  }
  // hàm getData lấy dữ liệu từ database trong folder Database sau đó copy vào để sử dụng trong maths_game project

  List<Map> maps = new List<Map>();

  @override
  Widget build(BuildContext context) {
    String calculationSet;
    String calculateIcon;
    String Section1 = "images/Book Section 1.png";
    String Section2 = "images/Book Section 2.png";
    String Section3 = "images/Book Section 3.png";
    String Section4 = "images/Book Section 4.png";
    String Section5 = "images/Book Section 5.png";
    String Section6 = "images/Book Section 6.png";
    String Section7 = "images/Book Section 7.png";
    String Section8 = "images/Book Section 8.png";
    String Section9 = "images/Book Section 9.png";

    if (widget.calculation == "plus") {
      calculateIcon = " + ";
    } else if (widget.calculation == 'minus') {
      calculateIcon = " - ";
    } else if (widget.calculation == 'duplicate') {
      calculateIcon = " x ";
    } else if (widget.calculation == 'divide') {
      calculateIcon = " : ";
    }

    List<String> list = new List<String>();
    int count = 0;
    maps.forEach((element) {
      if (count == 2) {
        list.add("\n\n");
        count = 0;
      }
      list.add(
        (element['number1'].toString() +
            calculateIcon +
            element['number2'].toString() +
            " = " +
            element['result'].toString() +
            "   "),
      );
      ++count;
    });

    if (maps.isEmpty) {
      if (widget.calculation == "plus") {
        calculationSet =
            "_ + 1 = _   _ + 2 = _ \n\n_ + 3 = _   _ + 4 = _ \n\n_ + 5 = _   _ + 6 = _ \n\n_ + 7 = _   _ + 8 = _ \n\n_ + 9 = _   _ + 10 = _";
      } else if (widget.calculation == "minus") {
        calculationSet =
            "_ - 1 = _   _ - 2 = _ \n\n_ - 3 = _   _ - 4 = _ \n\n_ - 5 = _   _ - 6 = _ \n\n_ - 7 = _   _ - 8 = _ \n\n_ - 9 = _   _ - 10 = _";
      } else if (widget.calculation == "duplicate") {
        calculationSet =
            "_ x 1 = _   _ x 2 = _ \n\n_ x 3 = _   _ x 4 = _ \n\n_ x 5 = _   _ x 6 = _ \n\n_ x 7 = _   _ x 8 = _ \n\n_ x 9 = _   _ x 10 = _";
      } else if (widget.calculation == "divide") {
        calculationSet =
            "_ : 1 = _   _ : 2 = _ \n\n_ : 3 = _   _ : 4 = _ \n\n_ : 5 = _   _ : 6 = _ \n\n_ : 7 = _   _ : 8 = _ \n\n_ : 9 = _   _ : 10 = _";
      }
    } else {
      calculationSet = "";
      list.forEach((element) {
        setState(() {
          if (chosenSection == 1)
            Section1 = "images/Book Section 1 - chosen.png";
          else if (chosenSection == 2)
            Section2 = "images/Book Section 2 - chosen.png";
          else if (chosenSection == 3)
            Section3 = "images/Book Section 3 - chosen.png";
          else if (chosenSection == 4)
            Section4 = "images/Book Section 4 - chosen.png";
          else if (chosenSection == 5)
            Section5 = "images/Book Section 5 - chosen.png";
          else if (chosenSection == 6)
            Section6 = "images/Book Section 6 - chosen.png";
          else if (chosenSection == 7)
            Section7 = "images/Book Section 7 - chosen.png";
          else if (chosenSection == 8)
            Section8 = "images/Book Section 8 - chosen.png";
          else if (chosenSection == 9)
            Section9 = "images/Book Section 9 - chosen.png";

          calculationSet = calculationSet + element;
        });
      });
    }

    return Scaffold(
        body: Container(
      child: GridView.count(
        childAspectRatio: (1.8 / 1),
        crossAxisCount: 1,
        children: [
          Stack(
            children: [
              InkWell(
                child: Image.asset(
                  "images/back_image.png",
                  scale: 1.5,
                ),
                onTap: () {
                  _navigateBack(context);
                },
              ),
              Align(
                  alignment: Alignment(1, 0.7),
                  child: Container(
                    height: 220,
                    width: 210,
                    child: Text(
                      calculationSet,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )),
            ],
          ),
          Align(
            alignment: Alignment(0.2, -0.4),
            child: Image.asset(
              "images/talk_bubble_kienthuc.png",
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset("images/opened_book.png"),
              ),
              Align(
                alignment: Alignment(-0.45, -0.85),
                child: Text(
                  'Section',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              GridView.count(
                crossAxisCount: 6,
                childAspectRatio: (1.6 / 1),
                mainAxisSpacing: 4,
                children: [
                  Text(""),
                  Text(""),
                  Text(""),
                  Text(""),
                  Text(""),
                  Text(""),
                  Text(""),
                  InkWell(
                    onTap: () {
                      Section(1);
                    },
                    child: Align(
                      child: Image.asset(Section1),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Section(2);
                    },
                    child: Align(
                      child: Image.asset(Section2),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Section(3);
                    },
                    child: Align(
                      child: Image.asset(Section3),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Section(4);
                    },
                    child: Align(
                      child: Image.asset(Section4),
                    ),
                  ),
                  Text(""),
                  Text(""),
                  InkWell(
                    onTap: () {
                      Section(5);
                    },
                    child: Align(
                      child: Image.asset(Section5),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Section(6);
                    },
                    child: Align(
                      child: Image.asset(Section6),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Section(7);
                    },
                    child: Align(
                      child: Image.asset(Section7),
                    ),
                  ),
                  Text(""),
                  Text(""),
                  Text(""),
                  InkWell(
                    onTap: () {
                      Section(8);
                    },
                    child: Align(
                      child: Image.asset(Section8),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Section(9);
                    },
                    child: Align(
                      child: Image.asset(Section9),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("images/kienthuc_background.png"),
        fit: BoxFit.cover,
      )),
    ));
  }
}
