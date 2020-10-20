import 'package:flutter/material.dart';

class DetailSubject extends StatefulWidget {
  @override
  _DetailSubjectState createState() => _DetailSubjectState();
}

class _DetailSubjectState extends State<DetailSubject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Subject"),
        centerTitle: true,
      ),
      body: new SafeArea(
        child: new ListView.builder(
          itemCount: 36,
          itemBuilder: (context, index) {
            return new Container(
              color: (index % 2 != 0) ? Colors.white : Colors.brown[50],
              height: 80,
              child: Center(
                child: new ListTile(
                  leading: Icon(
                    Icons.ac_unit,
                    size: 30,
                  ),
                  title: new Text(
                    "Tuần " + index.toString(),
                    style: new TextStyle(
                        fontSize: 30,
                        color: Colors.orange,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Container(
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: Colors.brown[100]
                        ),
                      ),
                      child: Icon(
                          Icons.add,
                        color: Colors.orange,
                      )
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
