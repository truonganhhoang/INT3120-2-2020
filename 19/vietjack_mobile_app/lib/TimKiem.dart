import 'package:flutter/material.dart';
import 'API.dart';
class TimKiem extends StatefulWidget {
  @override
  _TimKiemState createState() => _TimKiemState();
}

class _TimKiemState extends State<TimKiem> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tìm Kiếm"),
      ),
      body: new FutureBuilder(
        future: API.getListContentFromAllSubject(),
        builder: (context,snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return new Text("No Connection");
            case ConnectionState.active:
            case ConnectionState.waiting:
              return new Text("Loading...");
            case ConnectionState.done:
              return new Container(
                child: new ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (contex, index) {
                    return new Container(
                        color: (index % 2 == 0)
                            ? Colors.white
                            : Colors.brown[50],
                        height: 80,
                        child: Center(
                          child: new ListTile(
                            leading: Icon(
                              Icons.ac_unit,
                              size: 30,
                            ),
                            title: new Text(
                              //snapshot.data.docs[index].id,
                              snapshot.data[index],
                              style: new TextStyle(
                                  fontSize: 25,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w600),
                            ),
                            // subtitle: new Text(
                            //     DetailSubject.getSubtitle(snapshot.data.docs[index].id.toString())
                            // ),
                            trailing: Container(
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 2, color: Colors.brown[100]),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.orange,
                                )),
                          ),
                        )
                    );
                  },
                ),
              );
          }
        }
        ),
    );
  }
}
