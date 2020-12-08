import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackgroundColor extends StatefulWidget {
  final int color;

  const BackgroundColor({Key key, this.color = 3}) : super(key: key);

  @override
  _BackgroundColorState createState() => _BackgroundColorState();
}

class _BackgroundColorState extends State<BackgroundColor> {
  int checked;
  bool changed = false;
  List<String> _name = ['Hồng', 'Xanh dương', 'Xanh lá', 'Tím'];
  List<Color> _color = [
    Colors.pink,
    Colors.blue[600],
    Colors.green[600],
    Colors.purple[400]
  ];

  @override
  void initState() {
    super.initState();
    checked = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                4,
                (index) => Container(
                      width: 300,
                      child: Card(
                        color: Colors.blue[50],
                        child: ListTile(
                          leading: Icon(Icons.circle, color: _color[index]),
                          title: Text(
                            _name[index],
                          ),
                          trailing: checked == index ? Icon(Icons.done) : null,
                          selected: checked == index,
                          onTap: () async {
                            setState(() {
                              if (checked == index) return;
                              checked = index;
                              changed = true;
                            });
                            var prefs = await SharedPreferences.getInstance();
                            prefs.setInt('backgroundColor', index);
                          },
                        ),
                      ),
                    )),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Visibility(
            visible: changed,
            child: Card(
              child: ListTile(
                trailing: Icon(
                  Icons.check_circle,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  'Thay đổi sẽ được cập nhật sau khi khởi động lại',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
