import 'package:bucha_app/widgets/Grammar/grammar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bucha_app/widgets/Grammar/Unit.dart';

class GrammarUnit extends StatefulWidget {
  final String name;
  final ColorSwatch color;
  final List<Unit> units;

  GrammarUnit({this.name, this.color, this.units});

  @override
  _GrammarUnitState createState() => _GrammarUnitState();
}

class PlayButton extends StatelessWidget {
  PlayButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 50.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/PlayGameButton.png'),
              fit: BoxFit.fill)),
    );
  }
}

class BackButton extends StatelessWidget {
  BackButton();

  void _backToHomePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return GrammarPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      child: InkWell(
        onTap: () {
          _backToHomePage(context);
        },
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/back.png'), fit: BoxFit.fill)),
    );
  }
}

class _GrammarUnitState extends State<GrammarUnit> {
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
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.pinkAccent,
        child: new Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              height: 550.0,
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
                      height: 60.0,
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
                      height: 450.0,
                      margin: EdgeInsets.only(
                          right: 5.0, left: 5.0, bottom: 10.0, top: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.amber[100],
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 320.0,
                            height: 50.0,
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
                              height: 380.0,
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
              width: 330.0,
              height: 70.0,
              child: new Row(
                children: [
                  BackButton(),
                  new Padding(padding: EdgeInsets.only(left: 70.0)),
                  PlayButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
