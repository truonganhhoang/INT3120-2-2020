
import 'package:flutter/cupertino.dart';

class Word{
  Word({
    @required this.id,
    @required this.word,
    @required this.definition,
    @required this.pronounUK,
  }):assert(id != null && word != null && pronounUK != null);

  int id;
  String word;
  String definition;
  String pronounUK;
  String pronounUS;
  String pathSoundUK;
  String pathSoundUS;
  String pathImage;
}
class M{
  Word w = Word(id: 1,word: 'Exile',pronounUK: '/ˈek.saɪl/');
}