import 'package:EduBox/IntermediateWidget.dart';
import 'package:EduBox/Models/NewPostTemplate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BeginTimePicker extends StatefulWidget {
  final int hour, minute;

  const BeginTimePicker(this.hour, this.minute, {Key key}) : super(key: key);

  @override
  _BeginTimePickerState createState() => _BeginTimePickerState();
}

class _BeginTimePickerState extends State<BeginTimePicker> {
  @override
  Widget build(BuildContext context) {
    var _color = Theme.of(context).primaryColor;
    int bufferedHour = DateTime.now().hour;
    int bufferedMinute = DateTime.now().minute;
    final form = Provider.of<SubmitForm>(context);
    return MyDateTimePicker(
      dateTime: DateTime(1,1,1,widget.hour,widget.minute),
      mode: PickerType.time,
      onChange: (time) {
        bufferedMinute = time.minute;
        bufferedHour = time.hour;
      },
      onSubmit: () {
        Navigator.of(context).pop();
        form.beginHour = bufferedHour;
        form.beginMinute = bufferedMinute;
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

class EndTimePicker extends StatefulWidget {
  final int hour, minute;

  const EndTimePicker(this.hour, this.minute, {Key key}) : super(key: key);
  @override
  _EndTimePickerState createState() => _EndTimePickerState();
}

class _EndTimePickerState extends State<EndTimePicker> {
  @override
  Widget build(BuildContext context) {
    var _color = Theme.of(context).primaryColor;
    int bufferedHour = DateTime.now().hour;
    int bufferedMinute = DateTime.now().minute;
    final form = Provider.of<SubmitForm>(context);
    return MyDateTimePicker(
      mode: PickerType.time,
      dateTime: DateTime(1,1,1,widget.hour,widget.minute),
      onChange: (time) {
        bufferedMinute = time.minute;
        bufferedHour = time.hour;
      },
      onSubmit: () {
        Navigator.of(context).pop();
        form.endHour = bufferedHour;
        form.endMinute = bufferedMinute;
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
          builder: (context, form, _) => Text(
            form.endHour.toString() +
                ':' +
                NumberFormat('00').format(form.endMinute),
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
