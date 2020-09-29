import 'package:flutter/material.dart';

void main() {
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
  final String link_image;
  final String textButton;

  OptionButton({this.link_image, this.textButton});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300.0,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(link_image))),
        child: FlatButton(
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
  final String image_location;
  final String image_caption;

  SmailOntionButton({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          margin: const EdgeInsets.only(
              top: 40.0, left:0.5, right:0.5),
          child: ListTile(
            title: Image.asset(image_location,
              width: 100.0,
              height: 80.0),
            subtitle:Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption,
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
            ),
          ),
        ),
      ),
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
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"), fit: BoxFit.fill)),
        child: new Column(
          children: <Widget>[
            new Padding(padding: const EdgeInsets.only(top: 200)),
            OptionButton(
              link_image: "assets/buttonRed.png",
              textButton: "Trường Học",
            ),
            new Padding(padding: const EdgeInsets.only(top: 25.0)),
            OptionButton(
              link_image: "assets/buttonBlue.png",
              textButton: "Nâng Cao",
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SmailOntionButton(
                  image_location: "assets/dictionaryButton.png",
                  image_caption: "Từ Điển",
                ),
                SmailOntionButton(
                  image_location: "assets/sampleSentencesButton.png",
                  image_caption: "Mẫu Câu",
                ),
                SmailOntionButton(
                  image_location: "assets/grammarButton.png",
                  image_caption: "Ngữ Pháp",
                )
              ],
            ),
            Container(
              width: 80,
              height: 140,
              margin: const EdgeInsets.only(top: 50.0,right: 100.0),
              child: Image.asset('assets/satan.png'),
            ),
          ],
        ),
      ),
    );
  }
}
