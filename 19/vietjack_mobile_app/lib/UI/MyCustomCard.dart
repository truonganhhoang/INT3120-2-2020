import 'package:flutter/material.dart';

class MyCustomCard extends StatelessWidget {
  MyCustomCard({Key key, @required this.weekNumber}) : super(key: key);

  final int weekNumber;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: PageStorageKey('MyCustomCard'),
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: this.weekNumber,
      itemBuilder: (BuildContext context, int index) {
        return MakeCard(index);
      },
    );
  }
}

class MakeCard extends StatelessWidget {
  final int index;

  MakeCard(this.index);
  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
            onTap: () {},
            child: Container(
              height: 75,
              decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 0.5, color: Colors.black)),
              ),
              child: ListTile(
                // contentPadding:
                //     EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: new BoxDecoration(
                    border: Border.all(width: 2.5, color: Colors.grey[300]),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text((this.index + 1).toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.orange, fontSize: 25)),
                  ),
                ),
                title: Text(
                  "Tuần " + (this.index + 1).toString(),
                  style: TextStyle(
                      color: Colors.blue[600], fontWeight: FontWeight.bold),
                ),
                subtitle: Row(
                  children: <Widget>[
                    Icon(Icons.book, size: 20),
                    Text(" Intermediate",
                        style: TextStyle(color: Colors.grey[500]))
                  ],
                ),
              ),
            )));
  }
}
