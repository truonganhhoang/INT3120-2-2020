import '../package/widget.dart';

Color _color = Color(0xff00854c);

class ADropDownMenu extends StatefulWidget {
  final List<String> listOfItems;

  const ADropDownMenu({Key key, this.listOfItems}) : super(key: key);

  @override
  _ADropDownMenuState createState() => _ADropDownMenuState();
}

class _ADropDownMenuState extends State<ADropDownMenu> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
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
              widget.listOfItems.length,
              (index) => DropdownMenuItem(
                child: Text(
                  widget.listOfItems[index],
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
            }),
      ),
    );
  }
}
