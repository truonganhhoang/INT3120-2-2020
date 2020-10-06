import 'package:bucha_app/widgets/dictionary/dictionary.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: dictionary(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class OptionButton extends StatelessWidget {
  final int colorBackgorund;
  final String textButton;

  OptionButton({this.colorBackgorund, this.textButton});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150.0,
        margin: const EdgeInsets.only(top: 20.0),
        decoration: BoxDecoration(
            color: Color(colorBackgorund),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: FlatButton(
          onPressed: () {},
          child: Text(
            textButton,
            style: TextStyle(
              fontSize: 16.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ));
  }
}

class SmailOntionButton extends StatelessWidget {
  final int imageBackground;
  final String image_caption;
  final String link_scene;

  SmailOntionButton(
      {this.imageBackground, this.image_caption, this.link_scene});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 50.0,
            height: 50.0,
            margin: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
            decoration: BoxDecoration(
                color: Color(imageBackground),
                borderRadius: BorderRadius.all(Radius.circular(10.0)))),
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
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0x41D4E6),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: FlatButton(
                    child: Text("Từ Vựng",style: TextStyle(
                      fontSize: 16.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),

                  ),
                )),
            Container(
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                  color: Color(0xff668EA7),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Column(
                children: <Widget>[

                  OptionButton(
                    colorBackgorund: 0xffC822DA,
                    textButton: "Trường Học",
                  ),

                  OptionButton(
                    colorBackgorund: 0xffFC6E64,
                    textButton: "Nâng Cao",
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
                ),
                SmailOntionButton(
                  imageBackground: 0xffF1B73C,
                  image_caption: "Mẫu Câu",
                ),
                SmailOntionButton(
                  imageBackground: 0xffFF3D00,
                  image_caption: "Ngữ Pháp",
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}