import 'package:bucha_app/ButtonBack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bucha_app/widgets/Grammar/GrammarData/InformationTitle.dart';

class InformationPage extends StatefulWidget {
  final String name;
  final List<InformationTitle> title;

  InformationPage({this.name, this.title});

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  ListView listView = ListView();

  @override
  void initState() {
    listView = ListView.builder(
      itemBuilder: (BuildContext context, int index) => widget.title[index],
      itemCount: widget.title.length,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        width: queryData.size.width,
        height: queryData.size.height,
        color: Colors.pinkAccent,
        child: new Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20.0),
              height: queryData.size.height * 0.88,
              decoration: BoxDecoration(
                color: Colors.indigo[900],
              ),
              child: new Column(
                children: <Widget>[
                  Container(
                    height: queryData.size.height * 0.85 * 0.092,
                    decoration: BoxDecoration(
                      color: Colors.orange[400],
                    ),
                    child: Center(
                      child: Text(
                        widget.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: queryData.size.height * (0.88 - 0.85 * 0.092) - 20.0,
                      child: listView,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: queryData.size.height * 0.12 - 20.0,
              child: Center(
                child: ButtonBack(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
