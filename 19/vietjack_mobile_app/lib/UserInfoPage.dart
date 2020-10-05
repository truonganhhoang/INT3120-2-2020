import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'LoginPage.dart';
class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  String dropDownValue = "Lớp 1";
  List<String> listClass = ["Lớp 1","Lớp 2","Lớp 3","Lớp n"];
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
                    backgroundImage: NetworkImage(auth.currentUser.photoURL.toString()),
                  )
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new Text(
                            auth.currentUser.displayName,
                            style: new TextStyle(
                              fontSize: 20,
                            ),
                        ),
                        Container(
                          width: 100,
                          height: 35,
                          padding: EdgeInsets.only(left: 5),
                          margin: EdgeInsets.only(left: 15),
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 0.1,
                            ),
                            boxShadow: [new BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 5,
                            )]
                          ),
                          child: new DropdownButton<String>(
                              isExpanded: true,
                              value: this.dropDownValue,
                              icon: Icon(Icons.arrow_drop_down),
                              items: this.listClass.map<DropdownMenuItem<String>>((String value){
                                return new DropdownMenuItem(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (String newValue){
                                setState(() {
                                  this.dropDownValue = newValue;
                                });
                              }
                          ),
                        ),

                      ],
                    ),
                  ),
                new Container(
                  height: 30,
                ),
                Container(
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                      color: Colors.white
                  ),
                  child: new ListTile(
                    leading: Icon(Icons.history,color: Colors.grey,),
                    title: Text("Lịch sử học",style: st,),
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
                      color: Colors.white
                  ),
                  child: new ListTile(
                      leading: Icon(Icons.exit_to_app,color: Colors.red,),
                      title: Text("Đăng xuất",style: new TextStyle(
                        fontSize: 20,
                        color: Colors.red
                      ),),
                      trailing: Icon(Icons.arrow_right),
                      onTap: (){
                        googleSignOut();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
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
TextStyle st = new TextStyle(
  fontSize: 20,
  color: Colors.blue
);
