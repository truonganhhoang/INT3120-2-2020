import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:word_up_application/study_home_screen/show_examples.dart';
import '../word.dart';
import 'word_box.dart';

class StudyHomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _StudyHomeScreenState();
}

class _StudyHomeScreenState extends State<StudyHomeScreen>{
  int _current = 0;
  List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body:
      Padding(
        padding: EdgeInsets.only(bottom: 100),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CarouselSlider(
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                height: 350,
                initialPage: 0,
                onPageChanged: (index) {
                  setState(() {
                    _current = index;
                  });
                },
                items: <Widget>[
                  WordBox(word: new Word(
                      id: 1, word: 'Exile', pronounUK: '/ˈek.saɪl/')),
                  WordBox(word: new Word(
                      id: 2, word: 'Refectory', pronounUK: '/rɪˈfek.tər.i/')),
                  WordBox(word: new Word(
                      id: 3, word: 'Opinion', pronounUK: '/əˈpɪn.jən/')),
                  WordBox(word: new Word(
                      id: 4, word: 'Confidence', pronounUK: '/ˈkɒn.fɪ.dəns/')),
                ],
                /*
                items: <Widget>[
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('Signify'),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('Dog'),
                  ),
                ],*/
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: new ShowExamples(
                  listExamples: ['There is a dog outside the house.'],),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
