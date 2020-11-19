import 'package:bucha_app/widgets/options/OptionAdvance.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bucha_app/widgets/dictionary/dictionary.dart';
import 'widgets/dictionary/dictionary.dart';
import 'widgets/Grammar/GrammarPage.dart';
import 'widgets/options/OptionClass.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class OptionButton extends StatelessWidget {
  final int colorBackgorund;
  final String textButton;
  final StatefulWidget linkPage;



  OptionButton({this.colorBackgorund, this.textButton,this.linkPage});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150.0,
        height: 50.0,
        margin: const EdgeInsets.only(top: 20.0),
        child: new RaisedButton(
          onPressed: () {
            Navigator.push(context, new MaterialPageRoute(
                builder: (context) => linkPage
            ));
          },
          child: Text(
            textButton,
            style: TextStyle(
              fontSize: 16.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),

          ),
          shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          color: Color(colorBackgorund),
        ));
  }


}

class SmailOntionButton extends StatelessWidget {
  final int imageBackground;
  final String image_caption;
  final StatefulWidget linkPage;

  SmailOntionButton(
      {this.imageBackground, this.image_caption,this.linkPage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50.0,
          height: 50.0,
          margin: const EdgeInsets.only(top: 20.0,left: 10.0 , right: 10.0),
          child: RaisedButton(
            onPressed: () {Navigator.push(context, new MaterialPageRoute(
                builder: (context) => linkPage
            ));},
            shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Color(imageBackground),
          ),),
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Text(image_caption),
        )
      ],
    );
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Color(0xff3fe7f1)),
        child: new Column(
          children: <Widget>[
            new Padding(padding: const EdgeInsets.only(top: 200)),
            Container(
              width: 200.0,
              height: 50.0,
              decoration: BoxDecoration(
                  color: Color(0xff41D4E6),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0))),
              child: Container(
                child: Center(
                  child: Text("Từ Vựng", style: TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),
                ),
              ),
            ),
            Container(
              width: 200.0,
              height: 160.0,
              decoration: BoxDecoration(
                  color: Color(0xff668EA7),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0))),
              child: Column(
                children: <Widget>[
                  OptionButton(
                    colorBackgorund: 0xffC822DA,
                    textButton: "Trường Học",
                    linkPage: OptionClass(),

                  ),
                  OptionButton(
                    colorBackgorund: 0xffFC6E64,
                    textButton: "Nâng Cao",
                    linkPage: OptionAdvance(),
                  ),
                ],
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SmailOntionButton(
                  imageBackground: 0xff7D75B0,
                  image_caption: "Từ Điển",
                  linkPage: Dictionary(),
                ),
                SmailOntionButton(
                  imageBackground: 0xffF1B73C,
                  image_caption: "Mẫu Câu",
                  linkPage: Dictionary(),
                ),
                SmailOntionButton(
                  imageBackground: 0xffFF3D00,
                  image_caption: "Ngữ Pháp",
                  linkPage: GrammarPage(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  customDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext c) {
          return Dialog(
            child: new Container(
              height: 450.0,
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                  color: Colors.red
              ),
            ),
          );
        }
    );
  }
}


