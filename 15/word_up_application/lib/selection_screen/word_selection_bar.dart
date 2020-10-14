import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_up_application/selection_screen/selection_screen.dart';

class WordSelectionBar extends StatelessWidget {
  final String word;
  final int kind; // 0 is selection, 1 is unsure, 2 is already known
  WordSelectionBar({@required this.word, @required this.kind});

  @override
  Widget build(BuildContext context) {
    return Draggable(
      // onDragStarted: ,
      feedback: Card(
        elevation: 10,
        color: Colors.pink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 50,
          width: 240,
        ),
      ),
      child: Card(
        elevation: 10,
        color: Colors.pink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 50,
          width: 240,
          child: Text(word),
        ),
      ),
      data: word,
      childWhenDragging: Container(),
      onDragStarted: () => {
        SelectionScreen.instance.deleteWordBar(kind),
      },
    );
  }
}
