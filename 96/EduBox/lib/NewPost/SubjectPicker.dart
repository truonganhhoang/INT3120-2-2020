import 'package:EduBox/Models/NewPostTemplate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubjectPicker extends StatefulWidget {
  @override
  _SubjectPickerState createState() => _SubjectPickerState();
}

class _SubjectPickerState extends State<SubjectPicker> {
  final List<String> listOfItems = [
    'Toán',
    'Lý',
    'Hóa',
    'Văn',
    'Sinh',
    'Anh',
    'Tin'
  ];
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    var _color = Theme.of(context).primaryColor;
    var submitForm = Provider.of<SubmitForm>(context);
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
              listOfItems.length,
              (index) => DropdownMenuItem(
                child: Text(
                  listOfItems[index],
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
              submitForm.subject = listOfItems[value];
            }),
      ),
    );
  }
}
