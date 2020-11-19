import 'package:bucha_app/widgets/Grammar/GrammarData/GrammarUnit.dart';
import 'package:bucha_app/widgets/Grammar/GrammarData/GrammarOption.dart';
import 'package:bucha_app/widgets/Grammar/GrammarData/Subtitle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bucha_app/Database.dart';
import 'package:bucha_app/ButtonBack.dart';
import 'package:bucha_app/widgets/Grammar/GrammarData/InformationTitle.dart';
import 'package:bucha_app/widgets/Grammar/GrammarData/Information.dart';
import 'package:bucha_app/widgets/Grammar/GrammarData/Example.dart';
import 'package:bucha_app/widgets/Grammar/GrammarGame/GrammarGamePage.dart';

class GrammarPage extends StatefulWidget {
  @override
  _GrammarPageState createState() => _GrammarPageState();
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

class _GrammarPageState extends State<GrammarPage> {

  static const _optionColors = <ColorSwatch>[
    ColorSwatch(0xFFE8F5E9, {
      'highlight': Color(0xFF9E9E9E),
    }),
    ColorSwatch(0xFFFFFFFF, {
      'highlight': Color(0xFF9E9E9E),
    }),
    ColorSwatch(0xFFFFD54F, {
      'highlight': Color(0xFF9E9E9E),
    }),
    ColorSwatch(0xFFFFE082, {
      'highlight': Color(0xFF9E9E9E),
    }),
  ];

  List<GrammarUnit> _retrieveUnitList(DocumentSnapshot document) {
    List units = List<GrammarUnit>();
    for (var grammar in document.get('grammar')) {
      List<InformationTitle> informationTitles = new List<InformationTitle>();
      for(var title in grammar['title']) {
        List<Subtitle> subtitles = new List<Subtitle>();
        for (var subtitle in title['subtitle']) {
          List<Information> informations = new List<Information>();
          for (var information in subtitle['information']) {
            List<String> notes = new List<String>();
            for (var note in information['note']) {
              notes.add(note);
            }
            List<Example> examples = new List<Example>();
            for (var example in information['example']) {
              examples.add(
                Example(
                  name: example['name'],
                  meaning: example['meaning'],
                ),
              );
            }
            informations.add(
              Information(
                name: information['name'],
                example: examples,
                note: notes,
              ),
            );
          }
          subtitles.add(
            Subtitle(
              name: subtitle['name'],
              information: informations,
            ),
          );
        }
        informationTitles.add(
          InformationTitle(
            name: title['name'],
            subtitle: subtitles,
          ),
        );
      }
      units.add(
        GrammarUnit(
          name: grammar['name'],
          color: _optionColors[grammar['color_id']],
          title: informationTitles,
        )
      );
    }
    return units;
  }

  final options = <GrammarOption>[];
  StreamBuilder builder;

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: GrammarOption(
        name: document['name'],
        color: _optionColors[document['color_id']],
        units: _retrieveUnitList(document),
      ),
    );
  }

  @override
  void initState() {
    _buildStreamList();
    super.initState();
  }

  void _buildStreamList() async {
    builder = StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Grammar_set').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Text('Loading...');
        return ListView.builder(
          itemBuilder: (context, index) => _buildListItem(context, snapshot.data.documents[index]),
          itemCount: snapshot.data.documents.length,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _buildStreamList();
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        width: queryData.size.width,
        height: queryData.size.height,
        color: Colors.pinkAccent,
        child: new Column(
          children: <Widget>[
            Container(
              height: queryData.size.height * 0.88,
              margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
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
                      margin:
                      EdgeInsets.only(
                          bottom: 10.0, top: 10.0),
                      child: SizedBox(
                        height: queryData.size.height * (0.88 - 0.092 * 0.85) - 40.0,
                        child: builder,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              height: queryData.size.height * 0.12 - 10.0,
              child: Center(
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
            ),
          ],
        ),
      ),
    );
  }
}
