import 'package:flutter/material.dart';
import 'package:word_up_application/size_config.dart';

class SelectReminder extends StatefulWidget {
  int hour;
  int minute;

  SelectReminder({this.hour, this.minute});

  @override
  _SelectReminderState createState() => _SelectReminderState();
}

class _SelectReminderState extends State<SelectReminder> {
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay pickedTime;

  Future<Null> selectTime(BuildContext context) async {
    pickedTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );

    setState(() {
      if (pickedTime != null) {
        widget.hour = pickedTime.hour;
        widget.minute = pickedTime.minute;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            print(pickedTime);
            Navigator.pop(context, pickedTime);
          },
        ),
        title: Text('Reminders'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10 * SizeConfig.heightMultiplier),
              child: Text(
                'Best times to practice?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                  child: Text(
                    (widget.hour < 10)
                        ? '0' + widget.hour.toString()
                        : widget.hour.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                  child: Text(
                    ':',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    (widget.minute < 10)
                        ? '0' + widget.minute.toString()
                        : widget.minute.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: IconButton(
                onPressed: () {
                  selectTime(context);
                },
                icon: Icon(Icons.alarm),
              ),
            )
          ],
        ),
      ),
    );
  }
}
