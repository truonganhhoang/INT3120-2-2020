import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //print(showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 60))));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Empty'),
        ),
        body: Center(
          child: Container(
            height: 100,
            width: 250,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime newDateTime) {
                // Do something
              },
            ),
          ),
        ),
      ),
    );
  }
}
