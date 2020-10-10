import 'package:flutter/cupertino.dart';

class Word {
  int id;
  String word;
  String type;
  String definition;
  String meanCard;
  String pronounceUK;
  String pronounceUS;
  String pathSoundUK;
  String pathSoundUS;
  List<String> examples;
  List<String> imagePaths;
  List<String> quotes;
  
  bool isFavorite;
  int reviewTimes;

  Word({
    @required this.id,
    @required this.word,
    this.type,
    this.definition,
    this.meanCard,
    this.pathSoundUK,
    this.pathSoundUS,
    this.pronounceUK,
    this.pronounceUS,
  });

  Word.map(dynamic obj){
    this.id = obj['id'];
    this.word = obj['word'];
    this.pronounceUK = obj['pronounUK'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = this.id;
    map['word'] = this.word;
    map['pronounUK'] = this.pronounceUK;
  }

}

