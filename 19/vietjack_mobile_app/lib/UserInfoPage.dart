import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'LoginPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'API.dart';
import 'HistoryPage.dart';
class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  int groupRadio;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     API.getUser()
    .then((value) {
      setState(() {
        groupRadio = value.docs[0]["UserClass"];
      });
    });
  }
  void submitUserClass() {
    API.getUser().then((value) {
          FirebaseFirestore.instance.collection("Users").doc(value.docs[0].id).update({
            "UserClass" : groupRadio
          });
        });
  }
  void showModal() {
    print("show modal");
    Future modalController = showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return new Container(
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  //color: Colors.white
                ),
                child: new GridView.count(
                  padding: EdgeInsets.all(10),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  children: <Widget>[
                    new GestureDetector(
                      onTap: () {
                        print("1");
                        setState(() {
                          this.groupRadio = 1;
                        });
                      },
                      child: new Container(
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            new Text("Lớp 1"),
                            new Radio(
                                value: 1,
                                groupValue: groupRadio,
                                onChanged: (T) {
                                  setState(() {
                                    groupRadio = T;
                                  });
                                })
                          ],
                        ),
                      ),
                    ),
                    new GestureDetector(
                      onTap: () {
                        setState(() {
                          this.groupRadio = 2;
                        });
                      },
                      child: new Container(
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            new Text("Lớp 2"),
                            new Radio(
                                value: 2,
                                groupValue: groupRadio,
                                onChanged: (T) {
                                  setState(() {
                                    groupRadio = T;
                                  });
                                })
                          ],
                        ),
                      ),
                    ),
                    new GestureDetector(
                      onTap: () {
                        setState(() {
                          this.groupRadio = 3;
                        });
                      },
                      child: new Container(
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            new Text("Lớp 3"),
                            new Radio(
                                value: 3,
                                groupValue: groupRadio,
                                onChanged: (T) {
                                  setState(() {
                                    groupRadio = T;
                                  });
                                })
                          ],
                        ),
                      ),
                    ),
                    new GestureDetector(
                      onTap: () {
                        setState(() {
                          this.groupRadio = 4;
                        });
                      },
                      child: new Container(
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            new Text("Lớp 4"),
                            new Radio(
                                value: 4,
                                groupValue: groupRadio,
                                onChanged: (T) {
                                  setState(() {
                                    groupRadio = T;
                                  });
                                })
                          ],
                        ),
                      ),
                    ),
                    new GestureDetector(
                      onTap: () {
                        setState(() {
                          this.groupRadio = 5;
                        });
                      },
                      child: new Container(
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            new Text("Lớp 5"),
                            new Radio(
                                value: 5,
                                groupValue: groupRadio,
                                onChanged: (T) {
                                  setState(() {
                                    groupRadio = T;
                                  });
                                })
                          ],
                        ),
                      ),
                    ),
                    new GestureDetector(
                      onTap: () {
                        setState(() {
                          this.groupRadio = 6;
                        });
                      },
                      child: new Container(
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            new Text("Lớp 6"),
                            new Radio(
                                value: 6,
                                groupValue: groupRadio,
                                onChanged: (T) {
                                  setState(() {
                                    groupRadio = T;
                                  });
                                })
                          ],
                        ),
                      ),
                    ),
                    new GestureDetector(
                      onTap: () {
                        setState(() {
                          this.groupRadio = 7;
                        });
                      },
                      child: new Container(
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            new Text("Lớp 7"),
                            new Radio(
                                value: 7,
                                groupValue: groupRadio,
                                onChanged: (T) {
                                  setState(() {
                                    groupRadio = T;
                                  });
                                })
                          ],
                        ),
                      ),
                    ),
                    new GestureDetector(
                      onTap: () {
                        setState(() {
                          this.groupRadio = 8;
                        });
                      },
                      child: new Container(
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            new Text("Lớp 8"),
                            new Radio(
                                value: 8,
                                groupValue: groupRadio,
                                onChanged: (T) {
                                  setState(() {
                                    groupRadio = T;
                                  });
                                })
                          ],
                        ),
                      ),
                    ),
                    new GestureDetector(
                      onTap: () {
                        setState(() {
                          this.groupRadio = 9;
                        });
                      },
                      child: new Container(
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            new Text("Lớp 9"),
                            new Radio(
                                value: 9,
                                groupValue: groupRadio,
                                onChanged: (T) {
                                  setState(() {
                                    groupRadio = T;
                                  });
                                })
                          ],
                        ),
                      ),
                    ),
                    new GestureDetector(
                      onTap: () {
                        setState(() {
                          this.groupRadio = 10;
                        });
                      },
                      child: new Container(
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            new Text("Lớp 10"),
                            new Radio(
                                value: 10,
                                groupValue: groupRadio,
                                onChanged: (T) {
                                  setState(() {
                                    groupRadio = T;
                                  });
                                })
                          ],
                        ),
                      ),
                    ),
                    new GestureDetector(
                      onTap: () {
                        setState(() {
                          this.groupRadio = 11;
                        });
                      },
                      child: new Container(
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            new Text("Lớp 11"),
                            new Radio(
                                value: 11,
                                groupValue: groupRadio,
                                onChanged: (T) {
                                  setState(() {
                                    groupRadio = T;
                                  });
                                })
                          ],
                        ),
                      ),
                    ),
                    new GestureDetector(
                      onTap: () {
                        setState(() {
                          this.groupRadio = 12;
                        });
                      },
                      child: new Container(
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            new Text("Lớp 12"),
                            new Radio(
                                value: 12,
                                groupValue: groupRadio,
                                onChanged: (T) {
                                  setState(() {
                                    groupRadio = T;
                                  });
                                })
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
    modalController.then((value) {//on close
      submitUserClass();
      setState(() {}); //update groupRadio
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Login"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Center(
          child: Container(
            child: Column(
              children: [
                new CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.yellow,
                    child: new CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          NetworkImage(auth.currentUser.photoURL.toString()),
                    )),
                new Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: new Text(
                    auth.currentUser.displayName,
                    style: new TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                new GestureDetector(
                  onTap: this.showModal,
                  child: new Container(
                    width: 100,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 10),
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Text("Lớp $groupRadio"),
                        new Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                  ),
                ),
                new Container(
                  height: 30,
                ),
                Container(
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: new ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return new HistoryPage();
                        }
                      ));
                    },
                    leading: Icon(
                      Icons.history,
                      color: Colors.grey,
                    ),
                    title: Text(
                      "Lịch sử học",
                      style: st,
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                ),
                Container(
                  decoration: new BoxDecoration(
                      border: new Border(
                        top: new BorderSide(
                          width: 1,
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                      color: Colors.white),
                  child: new ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Đăng xuất",
                      style: new TextStyle(fontSize: 20, color: Colors.red),
                    ),
                    trailing: Icon(Icons.arrow_right),
                    onTap: () {
                      googleSignOut();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return new LoginPage();
                      }));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle st = new TextStyle(fontSize: 20, color: Colors.blue);
