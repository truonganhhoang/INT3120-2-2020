import 'package:EduBox/NewPost/NewPostTemplate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

Color _color = Color(0xff00854c);

class BeginTimePicker extends StatefulWidget {
  @override
  _BeginTimePickerState createState() => _BeginTimePickerState();
}

class _BeginTimePickerState extends State<BeginTimePicker> {
  String hour = DateTime.now().hour.toString() + ':00';
  int bufferedHour;
  int bufferedMinute;
  var boxShadow = [
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
  ];

  Widget build(BuildContext context) {
    final form = Provider.of<SubmitForm>(context);
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
                        boxShadow: boxShadow),
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      onDateTimeChanged: (DateTime newDateTime) {
                        setState(() {
                          bufferedHour = newDateTime.hour;
                          bufferedMinute = newDateTime.minute;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: boxShadow,
                        ),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            form.beginHour = bufferedHour;
                            form.beginMinute = bufferedMinute;
                          },
                          child: Text(
                            'Xong',
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 255, 1)),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: boxShadow,
                        ),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Thoát',
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 255, 1)),
                          ),
                        ),
                      ),
                    ],
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
        child: Consumer<SubmitForm>(
          builder: (context, form, _) => Text(
            form.beginHour.toString() +
                ':' +
                NumberFormat('00').format(form.beginMinute),
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
