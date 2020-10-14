import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Color _color = Color(0xff00854c);

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  String date = DateFormat('dd-MM-yyyy').format(DateTime.now());

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
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
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
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (DateTime newDateTime) {
                        setState(() {
                          date = DateFormat('dd-MM-yyyy')
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
          date,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
