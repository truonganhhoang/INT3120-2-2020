import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GrammarPage(),
  ));
}

class GrammarPage extends StatefulWidget {
  @override
  _GrammarPageState createState() => _GrammarPageState();
}

class OptionButton extends StatelessWidget {
  final String link_image;
  final String textButton;

  OptionButton({this.link_image, this.textButton});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 320.0,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(link_image), fit: BoxFit.fill)),
        child: FlatButton(
          child: Text(
            textButton,
            style: TextStyle(
              fontSize: 16.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ));
  }
}

class SmailOntionButton extends StatelessWidget {
  final String image_location;
  final double width;
  final double height;

  SmailOntionButton({this.image_location, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: this.width,
          margin: const EdgeInsets.only(
              top: 40.0, left:0.5, right:0.5),
          child: ListTile(
            title: Image.asset(image_location,
                width: this.width,
                height: this.height),
          ),
        ),
      ),
    );
  }
}

class _GrammarPageState extends State<GrammarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.pinkAccent,
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
              child: Container(
                width: 330.0,
                height: 550.0,
                color: Colors.yellow[200],
                child: new Column(
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0)),
                    OptionButton(
                      link_image: "assets/GrammarTitle.png",
                      textButton: "NGỮ PHÁP",
                    ),
                    new Padding(padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0)),
                    OptionButton(
                      link_image: "assets/GrammarSelection.png",
                      textButton: "12 THÌ TRONG TIẾNG ANH",
                    ),
                    new Padding(padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0)),
                    OptionButton(
                      link_image: "assets/GrammarSelection2.png",
                      textButton: "CÂU BỊ ĐỘNG",
                    ),
                    new Padding(padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0)),
                    OptionButton(
                      link_image: "assets/GrammarSelection.png",
                      textButton: "CÂU ƯỚC",
                    ),
                    new Padding(padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0)),
                    OptionButton(
                      link_image: "assets/GrammarSelection2.png",
                      textButton: "CÂU HỎI ĐUÔI",
                    ),
                    new Padding(padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0)),
                    OptionButton(
                      link_image: "assets/GrammarSelection.png",
                      textButton: "CÂU ĐIỀU KIỆN",
                    ),
                    new Padding(padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0)),
                    OptionButton(
                      link_image: "assets/GrammarSelection2.png",
                      textButton: "CÂU SO SÁNH",
                    ),
                    new Padding(padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0)),
                    OptionButton(
                      link_image: "assets/GrammarSelection.png",
                      textButton: "CÁC LOẠI CÂU KHÁC",
                    ),
                    new Padding(padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0)),
                    OptionButton(
                      link_image: "assets/GrammarSelection2.png",
                      textButton: "MỆNH ĐỀ QUAN HỆ",
                    ),
                    new Padding(padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0)),
                    OptionButton(
                      link_image: "assets/GrammarSelection.png",
                      textButton: "CÁC THÀNH PHẦN CỦA CÂU",
                    ),
                  ]
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
