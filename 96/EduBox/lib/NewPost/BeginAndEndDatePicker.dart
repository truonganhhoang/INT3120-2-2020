import 'package:EduBox/IntermediateWidget.dart';
import 'package:EduBox/Models/NewPostTemplate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BeginDatePicker extends StatefulWidget {
  final DateTime dateTime;

  const BeginDatePicker(this.dateTime, {Key key}) : super(key: key);

  @override
  _BeginDatePickerState createState() => _BeginDatePickerState();
}

class _BeginDatePickerState extends State<BeginDatePicker> {
  @override
  Widget build(BuildContext context) {
    var _color = Theme.of(context).primaryColor;
    final form = Provider.of<SubmitForm>(context);
    DateTime bufferedDate = DateTime.now();
    return MyDateTimePicker(
      dateTime: widget.dateTime,
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
  final DateTime dateTime;

  const EndDatePicker(this.dateTime, {Key key}) : super(key: key);

  @override
  _EndDatePickerState createState() => _EndDatePickerState();
}

class _EndDatePickerState extends State<EndDatePicker> {
  @override
  Widget build(BuildContext context) {
    var _color = Theme.of(context).primaryColor;
    final form = Provider.of<SubmitForm>(context);
    DateTime bufferedDate = DateTime.now();
    return MyDateTimePicker(
      dateTime: widget.dateTime,
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
