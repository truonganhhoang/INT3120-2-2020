import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:firebase_database/firebase_database.dart';

import '../../main.dart';

// 3DDAFD  0A1A52  27AE60  41A4A1  668EA7  CFBB24
class Dictionary extends StatefulWidget {
  static String tag = 'contactlist-page';

  @override
  State<StatefulWidget> createState() {
    return _DictionaryState();
  }
}

List<Vocabulary> vocabulary = loadWord() as List<Vocabulary>;
// [
//   Vocabulary('Abroad', 'Ở nước ngoài'),
//   Vocabulary('Absence', 'Vắng mặt'),
//   Vocabulary('Absent', 'Vắng mặt, nghỉ'),
//   Vocabulary('Absolute', 'Tuyệt đối'),
//   Vocabulary('Absolutely', 'Chắc chắn rồi'),
//   Vocabulary('Absorb', 'Hấp thụ'),
//   Vocabulary('Abstract', 'Trừu tượng'),
//   Vocabulary('Abuse', 'Lạm dụng'),
//   Vocabulary('Academic', 'Học tập'),
// ];
// final databaseReference = FirebaseDatabase.instance.reference();
// void readData(){
//   databaseReference.once().then((DataSnapshot snapshot) {
//     print('Data : ${snapshot.value}');
//   });
// }
class _DictionaryState extends State<Dictionary> {
  // Future<String>_loadFromAsset() async {
  //   return await rootBundle.loadString("assets/dictionary.json");
  // }
  // Future parseJson() async {
  //   String jsonString = await _loadFromAsset();
  //   final jsonResponse = jsonDecode(jsonString);
  //   print(jsonResponse);
  // }


  TextEditingController searchController = TextEditingController();
  String filter;
  String result1 = "";
  String result2 = "";
  bool showResult = false;

  @override
  initState() {
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
      // readData();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //     title: Text('Contacts',
        //         style: TextStyle(
        //             color: Colors.white, fontWeight: FontWeight.bold))),
        body: SafeArea(
          child: Container(
            color: Color(
                0xff41A4A1), // 3DDAFD  0A1A52  27AE60  41A4A1  668EA7  CFBB24
            child: Stack(children: [
              Container(
                  width: 350,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 20.0, right: 20.0, bottom: 80.0
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xff0A1A52),
                    border: Border.all(color: Color(0xff27AE60), width: 20.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 60.0, left: 10.0, right: 10.0),
                    child: Column(
                      children: [
                        Offstage(
                          offstage: result1 == "" ? true : false,
                          child: Container(
                            height: 150,
                            width: 310,
                            decoration: BoxDecoration(
                              color: Color(0xff154673),
                              border:
                              Border.all(width: 10, color: Colors.amber),
                              borderRadius:
                              BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: Center(
                                child: Text(
                                  '$result1'.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                )),
                          ),
                        ),
                        Offstage(
                          offstage: result2 == "" ? true : false,
                          child: Container(
                            height: 285,
                            width: 310,
                            margin: EdgeInsets.only(top: 10.0),
                            decoration: BoxDecoration(
                              color: Color(0xff154673),
                              // border: Border.all(width: 10,color: Colors.amber),
                              borderRadius:
                              BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: Center(
                              child: Text(
                                '$result2',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: 50.0, left: 50.0, right: 50.0, bottom: 10.0),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              bottomLeft: Radius.circular(5.0),
                            ),
                          ),
                          child: Icon(
                            Icons.search,
                            size: 30,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Color(0xff668EA7),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0),
                            ),
                          ),
                          child: TextField(
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: 'Tìm kiếm',
                              hintStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white30,
                              ),
                              contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5.0),
                                  bottomRight: Radius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 20/*
                      vocabulary.length*/,
                      itemBuilder: (context, index) {
                        print("-----------");
                        print(vocabulary);
                        return filter == null || filter == ""
                            ? new Container()
                            : '${vocabulary[index].English}'
                            .toLowerCase()
                            .contains(filter.toLowerCase())
                            ? Container(
                          margin: EdgeInsets.only(
                              left: 90.0, right: 50.0, bottom: 10.0),
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Color(0xff668EA7),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          child: ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 15.0),
                                child: Text(
                                  '${vocabulary[index].English}',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              // subtitle:
                              //     Text('${vocabulary[index].VietNamese}'),
                              // leading: CircleAvatar(
                              //     backgroundColor: Colors.blue,
                              //     child: Text(
                              //         '${vocabulary[index].English.substring(0, 1)}')),
                              onTap: () {
                                // filter = "";
                                searchController.text = "";
                                result1 =
                                '${vocabulary[index].English}';
                                result2 =
                                '${vocabulary[index].VietNamese}';
                                FocusScopeNode currentFocus =
                                FocusScope.of(context);
                                if (!currentFocus.hasPrimaryFocus &&
                                    currentFocus.focusedChild !=
                                        null) {
                                  currentFocus.focusedChild.unfocus();
                                }
                              }
                            // _onTapItem(context, vocabulary[index]),
                          ),
                        )
                            : '${vocabulary[index].VietNamese}'
                            .toLowerCase()
                            .contains(filter.toLowerCase())
                            ? Container(
                          margin: EdgeInsets.only(
                              left: 90.0,
                              right: 50.0,
                              bottom: 10.0),
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Color(0xff668EA7),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          child: ListTile(
                              title: GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 15.0),
                                  child: Text(
                                    '${vocabulary[index].VietNamese}',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              // subtitle:
                              //     Text('${vocabulary[index].VietNamese}'),
                              // leading: CircleAvatar(
                              //     backgroundColor: Colors.blue,
                              //     child: Text(
                              //         '${vocabulary[index].English.substring(0, 1)}')),
                              onTap: () {
                                // filter = "";
                                searchController.text = "";
                                result2 =
                                '${vocabulary[index].English}';
                                result1 =
                                '${vocabulary[index].VietNamese}';
                                FocusScopeNode currentFocus =
                                FocusScope.of(context);
                                if (!currentFocus
                                    .hasPrimaryFocus &&
                                    currentFocus.focusedChild !=
                                        null) {
                                  currentFocus.focusedChild
                                      .unfocus();
                                }
                              }),
                        )
                            : Container();
                      },
                    ),
                  ),
                  // Column(
                  //   children: [
                  //     Offstage(
                  //       offstage: result1 == "" ? true : false,
                  //       child: Container(
                  //         height: 150,
                  //         width: 310,
                  //         decoration: BoxDecoration(
                  //           color: Color(0xff154673),
                  //           border: Border.all(width: 10, color: Colors.amber),
                  //           borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  //         ),
                  //         child: Center(
                  //             child: Text(
                  //               '$result1'.toUpperCase(),
                  //               style: TextStyle(
                  //                   color: Colors.amber,
                  //                   fontSize: 30.0,
                  //                   fontWeight: FontWeight.bold,
                  //                   fontStyle: FontStyle.italic),
                  //             )),
                  //       ),
                  //     ),
                  //     Offstage(
                  //       offstage: result2 == "" ? true : false,
                  //       child: Container(
                  //         height: 285,
                  //         width: 310,
                  //         margin: EdgeInsets.only(top: 10.0),
                  //         decoration: BoxDecoration(
                  //           color: Color(0xff154673),
                  //           // border: Border.all(width: 10,color: Colors.amber),
                  //           borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  //         ),
                  //         child: Center(child: Text('$result2',style: TextStyle(color: Colors.white, fontSize: 24),),),
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      // padding: const EdgeInsets.all(20.0),
                      margin: const EdgeInsets.all(30.0),
                      width: 40,
                      height: 40,
                      color: Colors.indigo,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ));
  }
}

class Vocabulary {
  final String English;
  final String VietNamese;

  const Vocabulary(this.English, this.VietNamese);
}

List<Vocabulary> _parseJsonForWord(String jsonString){
  Map decoded = jsonDecode(jsonString);
  List<Vocabulary> ls = new List<Vocabulary>();
  for(var word in decoded["vocabulary"]){
    ls.add(new Vocabulary(word['English'],word['VietNamese']));
  }
  return ls;
}
Future<String> _loadWordAsset() async {
  return await rootBundle.loadString('assets/dictionary.json');
}
Future<List<Vocabulary>> loadWord() async {
  String jsonString = await _loadWordAsset();
  print(_parseJsonForWord(jsonString));
  return _parseJsonForWord(jsonString);
}