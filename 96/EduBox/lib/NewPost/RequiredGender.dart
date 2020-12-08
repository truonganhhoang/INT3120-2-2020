import 'package:EduBox/Models/NewPostTemplate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequiredGender extends StatefulWidget {
  @override
  _RequiredGenderState createState() => _RequiredGenderState();
}

class _RequiredGenderState extends State<RequiredGender> {
  int _value = 0;
  var listOfItems = ['(Nam/Nữ)', 'Nam', 'Nữ'];

  @override
  Widget build(BuildContext context) {
    var _color = Theme.of(context).primaryColor;
    final form = Provider.of<SubmitForm>(context);
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
              form.gender = listOfItems[value];
            }),
      ),
    );
  }
}
