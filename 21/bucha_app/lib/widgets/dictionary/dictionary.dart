import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bucha_app/main.dart';

// 3DDAFD  0A1A52  27AE60  41A4A1  668EA7  CFBB24
class Dictionary extends StatefulWidget {
  static String tag = 'contactlist-page';

  @override
  State<StatefulWidget> createState() {
    return _DictionaryState();
  }
}

List<Vocabulary> vocabulary = [
  Vocabulary(English: 'Abroad', VietNamese: 'Ở nước ngoài'),
  Vocabulary(English: 'Absence', VietNamese: 'Vắng mặt'),
  Vocabulary(English: 'Absent', VietNamese: 'Vắng mặt, nghỉ'),
  Vocabulary(English: 'Absolute', VietNamese: 'Tuyệt đối'),
  Vocabulary(English: 'Absolutely', VietNamese: 'Chắc chắn rồi'),
  Vocabulary(English: 'Absorb', VietNamese: 'Hấp thụ'),
  Vocabulary(English: 'Abstract', VietNamese: 'Trừu tượng'),
  Vocabulary(English: 'Abuse', VietNamese: 'Lạm dụng'),
  Vocabulary(English: 'Academic', VietNamese: 'Học tập'),
];

class _DictionaryState extends State<Dictionary> {
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
                margin: EdgeInsets.only(
                    top: 20.0, left: 20.0, right: 20.0, bottom: 80.0),
                decoration: BoxDecoration(
                  color: Color(0xff0A1A52),
                  border: Border.all(color: Color(0xff27AE60), width: 20.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
              ),
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
                        ),
                        Container(
                          height: 40,
                          width: 270,
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
                  Offstage(
                    offstage: result1 == "" ? true : false,
                    child: Container(
                      height: 150,
                      width: 310,
                      decoration: BoxDecoration(
                        color: Color(0xff154673),
                        border: Border.all(width: 10, color: Colors.amber),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Center(child: Text('$result2',style: TextStyle(color: Colors.white, fontSize: 24),),),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: vocabulary.length,
                      itemBuilder: (context, index) {
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
                                          result1 = '${vocabulary[index].English}';
                                          result2 = '${vocabulary[index].VietNamese}';
                                          FocusScopeNode currentFocus = FocusScope.of(context);
                                          if (!currentFocus.hasPrimaryFocus &&
                                              currentFocus.focusedChild != null) {
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
                                              result2 = '${vocabulary[index].English}';
                                              result1 = '${vocabulary[index].VietNamese}';
                                              FocusScopeNode currentFocus = FocusScope.of(context);
                                              if (!currentFocus.hasPrimaryFocus &&
                                                  currentFocus.focusedChild != null) {
                                                currentFocus.focusedChild.unfocus();
                                              }
                                            }),

                                      )
                                    : Container();
                      },
                    ),
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
                          Navigator.push(context, new MaterialPageRoute(builder: (context) => HomePage()));
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

  const Vocabulary({this.English, this.VietNamese});
}
