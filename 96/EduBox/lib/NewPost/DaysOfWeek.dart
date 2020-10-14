import '../package/widget.dart';

Color _color = Color(0xff00854c);

class DaysOfWeek extends StatefulWidget {
  final List daysOfWeek = ['2', '3', '4', '5', '6', '7', 'CN'];
  final List chosenDay = List.generate(7, (index) => false);

  @override
  _DaysOfWeekState createState() => _DaysOfWeekState();
}

class _DaysOfWeekState extends State<DaysOfWeek> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          widget.daysOfWeek.length,
          (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    if (widget.chosenDay[index])
                      widget.chosenDay[index] = false;
                    else
                      widget.chosenDay[index] = true;
                  });
                },
                child: Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    color: widget.chosenDay[index] == true
                        ? Colors.yellow[100]
                        : null,
                    border: Border.all(color: _color, width: 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    widget.daysOfWeek[index],
                    style: TextStyle(color: _color, fontSize: 17),
                  ),
                ),
              )),
    );
  }
}
