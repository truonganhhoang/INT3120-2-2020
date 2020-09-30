import 'package:flutter/material.dart';
import 'learn_box.dart';
import 'package:word_up_application/word.dart';

class LearnAWord extends StatelessWidget{
  Word word = Word(
    id: 1,
    word: 'Modern',
    type:'adj',
    definition: 'Designed and made using the most recent ideas and methods',
    mean: 'Hiện đại',
    example1: '- modern technology/education/art/transport.',
    example2: '- We\'re in the very modern-looking building opposite the station.',
    pathSoundUK: 'pathSoundUK',pathSoundUS: 'pathSoundUS',
    pronounUS: '/ˈmɒd.ən/',pronounUK: '/ˈmɒd.ən/',
    pathImage: 'assets/images/download.jpg',
    example: 'This house is more modern than that house',
  );
  /*
  final Word word
  LearnAWord({
    @required this.word,
  }):assert(word != null);
  */
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: new Text('Learning'),

          actions: <Widget>[
            MaterialButton(
              child: Icon(Icons.share, color: Colors.white,),
              onPressed: (){print('Share');},
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, -1.0),
                  end: Alignment(0.0, 0.9999999999999998),
                  stops: [0.0, 0.5104166865348816, 1.0],
                  colors: [
                    Color.fromARGB(255, 52, 206, 255),
                    Color.fromARGB(255, 138, 206, 255),
                    Color.fromARGB(255, 243, 254, 255)
                  ],
                ),
              ),
            ),
            new Container(
              height: 470,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  LearnBox(word: word,),
                  LearnBox(word: word,),
                  LearnBox(word: word,),
                ],),
            ),

            new Container(
                margin: EdgeInsets.only(top:485),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Text('Example',textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[500],
                          fontWeight: FontWeight.w500,
                          fontSize: 22,),
                        ),
                        Text('More', style: TextStyle(color: Colors.grey[500],
                          fontWeight: FontWeight.w500,decoration: TextDecoration.underline,
                          fontSize: 17,),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top:10),
                          width: 320,
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text('"' + word.example +'"',textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[500],
                            fontWeight: FontWeight.w500,
                            fontSize: 18,)
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.volume_up,
                      color: Colors.blue[600], size: 30,),
                  ],
                )
            ),
          ],)
    );
  }
}

