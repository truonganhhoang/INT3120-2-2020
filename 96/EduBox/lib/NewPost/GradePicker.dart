import 'package:EduBox/Models/NewPostTemplate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GradePicker extends StatefulWidget {
  @override
  _GradePickerState createState() => _GradePickerState();
}

class _GradePickerState extends State<GradePicker> {
  int _value = 0;
  final List<String> _listOfItems =
      List.generate(12, (index) => 'Lớp ' + (index + 1).toString());

  @override
  Widget build(BuildContext context) {
    var submitForm = Provider.of<SubmitForm>(context);
    var _color = Theme.of(context).primaryColor;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: _color, width: 1.5, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          value: _value,
          items: List.generate(
            _listOfItems.length,
            (index) => DropdownMenuItem(
              child: Text(
                _listOfItems[index],
                style: TextStyle(
                  color: _value == index ? null : _color,
                ),
              ),
              value: index,
            ),
          ),
          onChanged: (value) {
            setState(() {
              _value = value;
            });
            submitForm.grade = value + 1;
          },
        ),
      ),
    );
  }
}
