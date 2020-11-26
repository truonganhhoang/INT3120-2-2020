import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bucha_app/Database.dart';
import '../../main.dart';

class Dictionary extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DictionaryState();
  }
}


class _DictionaryState extends State<Dictionary> {
  List<Vocabulary> vocabulary = [];
  // final databaseRefrence = FirebaseFirestore.instance;
  TextEditingController searchController = TextEditingController();
  String filter;
  String word = "";
  String meaning = "";
  String pronunciation = "";
  bool showResult = false;

  @override
  initState() {
    getVocabulary();
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  void getVocabulary() {
    try {
      // databaseRefrence
      database
          .collection("Vocabulary")
          .where('caseSearch',arrayContains: filter)
          .get()
          .then((QuerySnapshot snapshot) {
        snapshot.docs.forEach((element) => {
          vocabulary.add(
              Vocabulary(
                  element.data()["word"],
                  element.data()["meaning"],
                  element.data()["pronunciation"]
              )
          )
        });
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            color: Color(
                0xff41A4A1), // 3DDAFD  0A1A52  27AE60  41A4A1  668EA7  CFBB24
            child: Stack(children: [
              Container(
                  width: 350,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 20.0, right: 20.0, bottom: 80.0),
                  decoration: BoxDecoration(
                    color: Color(0xff0A1A52),
                    border: Border.all(color: Color(0xff27AE60), width: 20.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.only(top: 60.0, left: 10.0, right: 10.0),
                    child: Column(
                      children: [
                        Offstage(
                          offstage: word == "" ? true : false,
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
                            child: Padding(
                                padding: EdgeInsets.only(top:30),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      child: Text(
                                        '$word'.toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.amber,
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                    Text(
                                      '$pronunciation',
                                      style: TextStyle(color: Colors.white54),
                                    )
                                  ],
                                )),
                          ),
                        ),
                        Offstage(
                          offstage: meaning == "" ? true : false,
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
                                '$meaning',
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
                    child: buildListView(),
                  ),
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
                          Navigator.pop(context);
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

  ListView buildListView() {
    return ListView.builder(
      itemCount: vocabulary.length,
      itemBuilder: (context, index) {
        return filter == null || filter == ""
            ? new Container()
            : '${vocabulary[index].English}'
            .toLowerCase()
            .contains(filter.toLowerCase())
            ? Container(
          margin:
          EdgeInsets.only(left: 90.0, right: 50.0, bottom: 10.0),
          height: 40.0,
          decoration: BoxDecoration(
            color: Color(0xff668EA7),
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Text(
                  '${vocabulary[index].English}',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {
                searchController.text = "";
                word = '${vocabulary[index].English}';
                meaning = '${vocabulary[index].VietNamese}';
                pronunciation = '${vocabulary[index].pronunciation}';
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  currentFocus.focusedChild.unfocus();
                }
              }),
        )
            : Container();
      },
    );
  }


}

class Vocabulary {
  final String English;
  final String VietNamese;
  final String pronunciation;
  const Vocabulary(this.English, this.VietNamese, this.pronunciation);
}
