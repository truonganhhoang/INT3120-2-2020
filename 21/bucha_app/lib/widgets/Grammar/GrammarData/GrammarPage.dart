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

class GrammarPage extends StatefulWidget {

  @override
  _GrammarPageState createState() => _GrammarPageState();
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
    StreamBuilder(
      stream: database.collection('Grammar_set').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Text('Coming soon');
        return ListView.builder(
          itemBuilder: (context, index) => _buildListItem(context, snapshot.data.documents[index]),
          itemCount: snapshot.data.documents.length,
        );
      },
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
              height: 650.0,
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
                      margin:
                      EdgeInsets.only(
                          right: 5.0, left: 5.0, bottom: 10.0, top: 10.0),
                      child: SizedBox(
                        height: 550.0,
                        child: StreamBuilder(
                          stream: database.collection('Grammar_set').snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) return const Text('Coming soon');
                            return ListView.builder(
                              itemBuilder: (context, index) => _buildListItem(context, snapshot.data.documents[index]),
                              itemCount: snapshot.data.documents.length,
                            );
                          },
                        ),
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
                  ButtonBack(),
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
