import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/user_profile_screen/user_profile_screen.dart';

class SelectName extends StatefulWidget {

  @override
  _SelectNameState createState() => _SelectNameState();
}

class _SelectNameState extends State<SelectName> {
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  String name = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select Name'),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Column(
            children: <Widget>[
              Card(
                child: TextField(
                  controller: firstNameController,
                  obscureText: false,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    //border: InputBorder.none,
                    hintText: 'PLEASE ENTER YOUR FIRST NAME',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                child: TextField(
                  controller: lastNameController,
                  obscureText: false,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    //border: InputBorder.none,
                    hintText: 'PLEASE ENTER YOUR LAST NAME',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  if (firstNameController.text == "") {
                    print('not input first name');
                    Alert(
                        context: context,
                        title: 'No first name entered!!',
                        type: AlertType.error,
                        style: AlertStyle(
                          alertElevation: 0,
                          alertPadding: EdgeInsets.only(
                              left: 3 * SizeConfig.heightMultiplier,
                              right: 3 * SizeConfig.heightMultiplier,
                              top: 0 * SizeConfig.widthMultiplier,
                              bottom: 25 * SizeConfig.widthMultiplier),
                          animationType: AnimationType.fromTop,
                          isCloseButton: false,
                          isOverlayTapDismiss: false,
                          descStyle: TextStyle(fontWeight: FontWeight.bold),
                          descTextAlign: TextAlign.start,
                          animationDuration: Duration(milliseconds: 400),
                          alertBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          titleStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 3 * SizeConfig.heightMultiplier),
                          alertAlignment: Alignment.center,
                        ),
                       ).show();
                  } else if (lastNameController.text == "") {
                    print('not input last name');
                    Alert(context: context, title: 'No last name entered!!',
                    type: AlertType.error,
                    style: AlertStyle(
                          alertElevation: 0,
                          alertPadding: EdgeInsets.only(
                              left: 3 * SizeConfig.heightMultiplier,
                              right: 3 * SizeConfig.heightMultiplier,
                              top: 0 * SizeConfig.widthMultiplier,
                              bottom: 25 * SizeConfig.widthMultiplier),
                          animationType: AnimationType.fromTop,
                          isCloseButton: false,
                          isOverlayTapDismiss: false,
                          descStyle: TextStyle(fontWeight: FontWeight.bold),
                          descTextAlign: TextAlign.start,
                          animationDuration: Duration(milliseconds: 400),
                          alertBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          titleStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 3 * SizeConfig.heightMultiplier),
                          alertAlignment: Alignment.center,
                        ),).show();
                  } else {
                    setState(() {
                      name += firstNameController.text;
                      name += " ";
                      name += lastNameController.text;
                    });
                    Navigator.pop(context, name);
                  }
                },
                child: Container(
                  width: 17 * SizeConfig.widthMultiplier,
                  height: 5 * SizeConfig.heightMultiplier,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.blueAccent)),
                  child: Center(
                    child: Text('SAVE'),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
