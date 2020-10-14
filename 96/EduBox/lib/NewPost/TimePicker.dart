import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Color _color = Color(0xff00854c);

class TimePicker extends StatefulWidget {
  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  String hour = DateTime.now().hour.toString() + ':00';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(2, 2),
                          color: Colors.black54,
                        ),
                        BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(-2, -2),
                          color: Colors.white54,
                        ),
                      ],
                    ),
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      onDateTimeChanged: (DateTime newDateTime) {
                        setState(() {
                          hour = DateFormat('HH:00')
                              .format(newDateTime)
                              .toString();
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(2, 2),
                          color: Colors.black54,
                        ),
                        BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(-2, -2),
                          color: Colors.white54,
                        ),
                      ],
                    ),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Xong',
                        style: TextStyle(color: Color.fromRGBO(0, 0, 255, 1)),
                      ),
                    ),
                  ),
                ],
              )),
      child: Container(
        height: 40,
        width: 124,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: _color, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          hour,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
