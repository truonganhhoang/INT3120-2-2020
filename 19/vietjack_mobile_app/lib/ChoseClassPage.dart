import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Auth.dart';
import 'main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ChoseClassPage extends StatefulWidget {
  @override
  _ChoseClassPageState createState() => _ChoseClassPageState();
}

class _ChoseClassPageState extends State<ChoseClassPage> {
  String dropDownValue = "Lớp 1";
  List<String> listClass = ["Lớp 1","Lớp 2","Lớp3"];
  int groupRadio = 1;
  CollectionReference user = FirebaseFirestore.instance.collection("Users");
  Future addUser(){
    return user.add({
      "UserId" : auth.currentUser.uid,
      "UserName": auth.currentUser.displayName,
      "UserEmail": auth.currentUser.email,
      "UserClass" : groupRadio
    }).then((value) => {
      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context){return new VietJackNavigationBar();})),
      print(user.doc())
    });
  }
  String getUserFirstName(String fullName){
    return fullName.substring(0,fullName.indexOf(" "));
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title:new Text("Chọn lớp"),centerTitle: true,),
      body: CustomScrollView(
          slivers: <Widget>[
            new SliverPadding(
              padding: EdgeInsets.only(top: 20,bottom: 10),
              sliver: new SliverList(
                delegate: new SliverChildListDelegate(
                    [
                      new CircleAvatar(
                          radius: 55,
                          backgroundColor: Colors.yellow,
                          child: new CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(auth.currentUser.photoURL.toString()),
                          )
                      ),
                    ]
                ),
              ),
            ),
            new SliverPadding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              sliver: new SliverList(
                  delegate: new SliverChildListDelegate([
                    new Center(
                      child:new RichText(
                        text: new TextSpan(
                          style: new TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily:'Sansation'
                          ),
                          children: <TextSpan>[
                            new TextSpan(text:"Chào mừng "),
                            new TextSpan(
                                text:this.getUserFirstName( auth.currentUser.displayName),
                              style: new TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w700
                              )
                            ),
                            new TextSpan(text: ". Hãy chọn lớp của bạn, bạn có thể thay đổi sau ở mục tài khoản")
                          ]
                        ),

                        textAlign: TextAlign.center,
                      )
                    )
                  ])
              ),
            ),
            new SliverPadding(
              padding: EdgeInsets.fromLTRB(10,30,10,0),
              sliver: SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                childAspectRatio: 2,
                children: <Widget>[
                  new GestureDetector(
                    onTap: (){
                      setState(() {
                        this.groupRadio = 1;
                      });
                    },
                    child: new Container(
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          new Text("Lớp 1"),
                          new Radio(
                                value: 1,
                                groupValue: groupRadio,
                              onChanged:(T){
                                setState(() {
                                  groupRadio = T;
                                });
                              }
                              )
                        ],
                      ),
                    ),
                  ),
                  new GestureDetector(
                    onTap: (){
                      setState(() {
                        this.groupRadio = 2;
                      });
                    },
                    child: new Container(
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          new Text("Lớp 2"),
                          new Radio(
                              value: 2,
                              groupValue: groupRadio,
                              onChanged:(T){
                                setState(() {
                                  groupRadio = T;
                                });
                              }
                          )
                        ],
                      ),
                    ),
                  ),
                  new GestureDetector(
                    onTap: (){
                      setState(() {
                        this.groupRadio = 3;
                      });
                    },
                    child: new Container(
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          new Text("Lớp 3"),
                          new Radio(
                              value: 3,
                              groupValue: groupRadio,
                              onChanged:(T){
                                setState(() {
                                  groupRadio = T;
                                });
                              }
                          )
                        ],
                      ),
                    ),
                  ),
                  new GestureDetector(
                    onTap: (){
                      setState(() {
                        this.groupRadio = 4;
                      });
                    },
                    child: new Container(
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          new Text("Lớp 4"),
                          new Radio(
                              value: 4,
                              groupValue: groupRadio,
                              onChanged:(T){
                                setState(() {
                                  groupRadio = T;
                                });
                              }
                          )
                        ],
                      ),
                    ),
                  ),
                  new GestureDetector(
                    onTap: (){
                      setState(() {
                        this.groupRadio = 5;
                      });
                    },
                    child: new Container(
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          new Text("Lớp 5"),
                          new Radio(
                              value: 5,
                              groupValue: groupRadio,
                              onChanged:(T){
                                setState(() {
                                  groupRadio = T;
                                });
                              }
                          )
                        ],
                      ),
                    ),
                  ),
                  new GestureDetector(
                    onTap: (){
                      setState(() {
                        this.groupRadio = 6;
                      });
                    },
                    child: new Container(
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          new Text("Lớp 6"),
                          new Radio(
                              value: 6,
                              groupValue: groupRadio,
                              onChanged:(T){
                                setState(() {
                                  groupRadio = T;
                                });
                              }
                          )
                        ],
                      ),
                    ),
                  ),
                  new GestureDetector(
                    onTap: (){
                      setState(() {
                        this.groupRadio = 7;
                      });
                    },
                    child: new Container(
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          new Text("Lớp 7"),
                          new Radio(
                              value: 7,
                              groupValue: groupRadio,
                              onChanged:(T){
                                setState(() {
                                  groupRadio = T;
                                });
                              }
                          )
                        ],
                      ),
                    ),
                  ),
                  new GestureDetector(
                    onTap: (){
                      setState(() {
                        this.groupRadio = 8;
                      });
                    },
                    child: new Container(
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          new Text("Lớp 8"),
                          new Radio(
                              value: 8,
                              groupValue: groupRadio,
                              onChanged:(T){
                                setState(() {
                                  groupRadio = T;
                                });
                              }
                          )
                        ],
                      ),
                    ),
                  ),
                  new GestureDetector(
                    onTap: (){
                      setState(() {
                        this.groupRadio = 9;
                      });
                    },
                    child: new Container(
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          new Text("Lớp 9"),
                          new Radio(
                              value: 9,
                              groupValue: groupRadio,
                              onChanged:(T){
                                setState(() {
                                  groupRadio = T;
                                });
                              }
                          )
                        ],
                      ),
                    ),
                  ),
                  new GestureDetector(
                    onTap: (){
                      setState(() {
                        this.groupRadio = 10;
                      });
                    },
                    child: new Container(
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          new Text("Lớp 10"),
                          new Radio(
                              value: 10,
                              groupValue: groupRadio,
                              onChanged:(T){
                                setState(() {
                                  groupRadio = T;
                                });
                              }
                          )
                        ],
                      ),
                    ),
                  ),
                  new GestureDetector(
                    onTap: (){
                      setState(() {
                        this.groupRadio = 11;
                      });
                    },
                    child: new Container(
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          new Text("Lớp 11"),
                          new Radio(
                              value: 11,
                              groupValue: groupRadio,
                              onChanged:(T){
                                setState(() {
                                  groupRadio = T;
                                });
                              }
                          )
                        ],
                      ),
                    ),
                  ),
                  new GestureDetector(
                    onTap: (){
                      setState(() {
                        this.groupRadio = 12;
                      });
                    },
                    child: new Container(
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          new Text("Lớp 12"),
                          new Radio(
                              value: 12,
                              groupValue: groupRadio,
                              onChanged:(T){
                                setState(() {
                                  groupRadio = T;
                                });
                              }
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new SliverPadding(
              padding: EdgeInsets.only(top: 0),
              sliver: new SliverList(delegate: new SliverChildListDelegate(
                [
                  new Container(
                    height: 100,
                    child: new Stack(
                      children: [
                        Center(
                          child: new Container(
                            width: 150,
                            height: 70,
                            child: new ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: new RaisedButton.icon(
                                color: Colors.lightGreen[200],
                                onPressed: this.addUser,
                                label: new Text("Tiếp tục",
                                  style: new TextStyle(
                                    fontSize: 20,
                                    color: Colors.green
                                  ),
                                ),
                                icon: Icon(Icons.navigate_next,size: 20,color: Colors.pinkAccent),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]
              )),
            )
          ],
        )

    );
  }
}
