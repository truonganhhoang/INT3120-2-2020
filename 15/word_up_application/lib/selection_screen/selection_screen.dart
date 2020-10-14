import 'package:flutter/material.dart';
import 'package:word_up_application/selection_screen/word_selection_bar.dart';
import 'package:word_up_application/size_config.dart';
import 'package:word_up_application/word.dart';

class SelectionScreen extends StatefulWidget {
  static final SelectionScreen instance = SelectionScreen._internal();
  factory SelectionScreen() {
    return instance;
  }
  SelectionScreen._internal();

  final List<Word> listWordToSelect = [
    new Word(id: 1, word: 'dog'),
    new Word(id: 2, word: 'cat'),
    new Word(id: 3, word: 'bear')
  ];
  final List<WordSelectionBar> listBarSelectWord =
      new List<WordSelectionBar>(); // Word Bar to drag, select;
  final List<Word> listWordUnSure = new List<Word>();
  final List<WordSelectionBar> listWordBarAlreadyKnown =
      List<WordSelectionBar>();
  // final List<Word> listWord

  @override
  State<StatefulWidget> createState() => _SelectionScreenState();
  void deleteWordBar(int kind) {
    switch (kind) {
      case 0:
        listBarSelectWord.removeLast();
        break;
      case 1:
        break;
      case 2:
        listWordBarAlreadyKnown.removeLast();
        break;
    }
  }
}

class _SelectionScreenState extends State<SelectionScreen> {
  List<String> x = ['ddds', '112', 'mn', 'lk'];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.listWordToSelect.length; i++) {
      widget.listBarSelectWord.add(new WordSelectionBar(
        word: widget.listWordToSelect[i].word,
        kind: 0,
      ));
    }
    print('X' + widget.listBarSelectWord.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    print('V' + widget.listBarSelectWord.length.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Select Words'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: 100,
              decoration: BoxDecoration(color: Colors.yellow),
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: widget.listBarSelectWord,
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              height: 100,
              decoration: BoxDecoration(color: Colors.grey),
              child: DragTarget(builder: (context, List<String> data, rj) {
                return Container(
                  child: Stack(
                    alignment: Alignment.center,
                    children: widget.listWordBarAlreadyKnown,
                  ),
                );
              }, onAccept: (data) {
                print('OnAccept');
                setState(() {
                  widget.listWordBarAlreadyKnown.add(WordSelectionBar(
                    word: data,
                    kind: 2,
                  ));
                });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
