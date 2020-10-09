import 'package:flutter/cupertino.dart';

class Word {
  int id;
  String word;
  String type;
  String definition;
  String mean;
  String pronounUK;
  String pronounUS;
  String pathSoundUK;
  String pathSoundUS;
  String example1;
  String example2;
  String pathImage;
  String example;

  Word({
    @required this.id,
    @required this.word,
    this.type,
    this.definition,
    this.mean,
    this.pathSoundUK,
    this.pathSoundUS,
    this.example1,
    this.example2,
    this.pronounUK,
    this.pronounUS,
    this.pathImage,
    this.example,
  });

  Word.map(dynamic obj){
    this.id = obj['id'];
    this.word = obj['word'];
    this.pronounUK = obj['pronounUK'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = this.id;
    map['word'] = this.word;
    map['pronounUK'] = this.pronounUK;
  }

}

