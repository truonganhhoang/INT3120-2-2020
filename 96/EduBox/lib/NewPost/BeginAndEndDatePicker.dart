import 'package:EduBox/IntermediateWidget.dart';
import 'file:///E:/Code/AndroidStudioProjects/INT3120-2-2020/96/EduBox/lib/Models/NewPostTemplate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

Color _color = Color(0xff00854c);

class BeginDatePicker extends StatefulWidget {
  @override
  _BeginDatePickerState createState() => _BeginDatePickerState();
}

class _BeginDatePickerState extends State<BeginDatePicker> {
  @override
  Widget build(BuildContext context) {
    final form = Provider.of<SubmitForm>(context);
    DateTime bufferedDate = DateTime.now();
    return MyDateTimePicker(
      onChange: (time) {
        bufferedDate = time;
      },
      onSubmit: () {
        Navigator.of(context).pop();
        form.beginDate = bufferedDate;
      },
      child: Container(
        height: 40,
        width: 124,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: _color, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Consumer<SubmitForm>(
          builder: (context, submitForm, _) => Text(
            DateFormat('dd-MM-yyyy').format(submitForm.beginDate),
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class EndDatePicker extends StatefulWidget {
  @override
  _EndDatePickerState createState() => _EndDatePickerState();
}

class _EndDatePickerState extends State<EndDatePicker> {
  @override
  Widget build(BuildContext context) {
    final form = Provider.of<SubmitForm>(context);
    DateTime bufferedDate = DateTime.now();
    return MyDateTimePicker(
      onChange: (time) {
        bufferedDate = time;
      },
      onSubmit: () {
        Navigator.of(context).pop();
        form.endDate = bufferedDate;
      },
      child: Container(
        height: 40,
        width: 124,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: _color, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Consumer<SubmitForm>(
          builder: (context, submitForm, _) => Text(
            DateFormat('dd-MM-yyyy').format(submitForm.endDate),
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
