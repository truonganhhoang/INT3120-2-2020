import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bucha_app/widgets/Grammar/GrammarData/GrammarUnit.dart';
import 'package:bucha_app/ButtonBack.dart';
import 'package:bucha_app/widgets/Grammar/GrammarGame/GrammarGamePage.dart';

class UnitPage extends StatefulWidget {
  final String name;
  final ColorSwatch color;
  final List<GrammarUnit> units;

  UnitPage({this.name, this.color, this.units});

  @override
  _UnitPageState createState() => _UnitPageState();
}

class PlayButton extends StatelessWidget {
  PlayButton();

  void _navigateToGame(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute<Null>(builder: (BuildContext context){
          return GrammarGamePage();
        })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 120.0,
        height: 50.0,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/PlayGameButton.png'),
              fit: BoxFit.fill
          ),
        ),
        child: InkWell(
          onTap: () {
            _navigateToGame(context);
          },
        )
    );
  }
}

class _UnitPageState extends State<UnitPage> {

  ListView listView = ListView();

  @override
  void initState() {
    listView = ListView.builder(
      itemBuilder: (BuildContext context, int index) => widget.units[index],
      itemCount: widget.units.length,
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
              margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              height: queryData.size.height * 0.88,
              decoration: BoxDecoration(
                  color: Colors.yellow[200],
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Container(
                margin: EdgeInsets.only(
                    top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                decoration: BoxDecoration(
                    color: Colors.blueGrey[400],
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: new Column(
                  children: [
                    Container(
                      height: queryData.size.height * 0.092 * 0.85,
                      decoration: BoxDecoration(
                        color: Colors.orange[400],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0)),
                      ),
                      child: Center(
                        child: Text(
                          'NGỮ PHÁP',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 24.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(
                          right: 5.0, left: 5.0, bottom: 10.0, top: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.amber[100],
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: queryData.size.height * 0.85 * 0.076,
                            decoration: BoxDecoration(
                              color: widget.color,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Center(
                              child: Text(
                                widget.name,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlue[900],
                                ),
                              ),
                            ),
                          ),
                          new Container(
                            child: SizedBox(
                              height: queryData.size.height * (0.88 - 0.092 * 0.85 - 0.076 * 0.85) - 40.0,
                              child: listView,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              height: queryData.size.height * 0.12 - 10.0,
              child: new Row(
                children: [
                  ButtonBack(),
                  Container(
                    width: queryData.size.width - 100.0,
                    child: Center(
                      child: PlayButton(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
