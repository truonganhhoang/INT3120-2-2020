import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../size_config.dart';

class SelectAge extends StatefulWidget {
  @override
  _SelectAgeState createState() => _SelectAgeState();
}

class _SelectAgeState extends State<SelectAge> {
  TextEditingController ageController = new TextEditingController();
  String age = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select Age'),
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
                  controller: ageController,
                  obscureText: false,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  decoration: InputDecoration(
                    //border: InputBorder.none,
                    hintText: 'PLEASE ENTER YOUR AGE',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  if (ageController.text == "") {
                    print('not input age');
                    Alert(
                        context: context,
                        title: 'No age entered!!',
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
                  } else {
                    setState(() {
                      age = ageController.text;
                    });
                    Navigator.pop(context, int.parse(age));
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
