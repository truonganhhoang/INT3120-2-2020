import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/NewPostTemplate.dart';

Color _color = Color(0xff00854c);

class DaysOfWeek extends StatefulWidget {
  @override
  _DaysOfWeekState createState() => _DaysOfWeekState();
}

class _DaysOfWeekState extends State<DaysOfWeek> {
  final List daysOfWeek = ['2', '3', '4', '5', '6', '7', 'CN'];
  final List<bool> chosenDay = List.generate(7, (index) => false);

  @override
  Widget build(BuildContext context) {
    var submitForm = Provider.of<SubmitForm>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          daysOfWeek.length,
          (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    if (chosenDay[index]) {
                      chosenDay[index] = false;
                    } else
                      chosenDay[index] = true;
                  });
                  if (!chosenDay.contains(true))
                    submitForm.canBeSubmit[1] = false;
                  else
                    submitForm.canBeSubmit[1] = true;

                  submitForm.days = chosenDay;
                },
                child: Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    color: chosenDay[index] == true ? Colors.yellow[100] : null,
                    border: Border.all(color: _color, width: 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    daysOfWeek[index],
                    style: TextStyle(color: _color, fontSize: 17),
                  ),
                ),
              )),
    );
  }
}
