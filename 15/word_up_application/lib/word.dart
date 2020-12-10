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
  String reviewDate;

  Word(
      {@required this.id,
      @required this.word,
      this.type,
      this.definition,
      this.meanCard,
      this.pathSoundUK,
      this.pathSoundUS,
      this.pronounceUK,
      this.pronounceUS,
      this.examples,
      this.imagePaths,
      this.quotes,
      this.isFavorite,
      this.reviewDate,
      this.reviewTimes});

  // Convert a Word object into Map object
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = this.id;
    map['word'] = this.word;
    map['pronun_uk'] = this.pronounceUK;
    map['pronun_us'] = this.pronounceUS;
    map['sound_us'] = this.pathSoundUS;
    map['sound_uk'] = this.pathSoundUK;
    map['type'] = this.type;
    map['definition'] = this.definition;
    map['mean_card'] = this.meanCard;
    if (this.isFavorite == true) map['is_favorite'] = 1;
    if (this.isFavorite == false) map['is_favorite'] = 0;
    map['review_date'] = this.reviewDate;
    map['review_time'] = this.reviewTimes;

    return map;
  }

  // Extract a Word object from a Map object
  Word.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id_word'];
    this.word = map['word'];
    this.pronounceUK = map['pronun_uk'];
    this.pronounceUS = map['pronun_us'];
    this.pathSoundUK = map['sound_uk'];
    this.pathSoundUS = map['sound_us'];
    this.type = map['type'];
    this.definition = map['definition'];
    this.meanCard = map['mean_card'];
    if (map['is_favorite'] == 1) this.isFavorite = true;
    if (map['is_favorite'] == 0) this.isFavorite = false;
    this.reviewDate = map['review_date'];
    this.reviewTimes = map['review_time'];
  }

  void printThisWord() {
    print(id.toString() + ' ' + word
        // ' ' +
        // meanCard +
        // ' ' +
        // definition +
        // ' ' +
        // type +
        // ' ' +
        // examples.toString() +
        // ' ' +
        // imagePaths.toString() +
        // ' ' +
        // quotes.toString()
        // ' '
        // +
        // isFavorite.toString() +
        // ' ' +
        // reviewDate +
        // ' ' +
        // reviewTimes.toString()
        );
  }

  String wordToString() {
    String res = id.toString() + ' ' + word;
    return res;
  }
}
