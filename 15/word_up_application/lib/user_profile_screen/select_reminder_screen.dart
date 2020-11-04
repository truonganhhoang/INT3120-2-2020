import 'package:flutter/material.dart';
import 'package:word_up_application/size_config.dart';

class SelectReminder extends StatefulWidget {
  @override
  _SelectReminderState createState() => _SelectReminderState();
}

class _SelectReminderState extends State<SelectReminder> {
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay picked;

  Future<Null> selectTime(BuildContext context) async {
    picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );

    setState(() {
      _time = picked;
      //print(_time);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Time'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(right: 3*SizeConfig.heightMultiplier),
          child: IconButton(
            icon: Icon(Icons.alarm, size: 50,),
            onPressed: () {
              selectTime(context);
              print(_time.hour);
              print(_time.minute);
              //Navigator.pop(context, _time.toString());
            },
          ),
        ),
      ),
    );
  }
}
