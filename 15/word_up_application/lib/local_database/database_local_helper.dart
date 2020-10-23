import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:developer';
import '../word.dart';

class DatabaseLocalHelper {
  static final _databaseName = 'WordUpDB2020.db';
  static final _databaseVersion = 1;
  static final tableWord = 'word';
  static final tableWordType = 'word_type';
  static final tableExamples = 'examples';
  static final tableImages = 'images';
  static final tableUsers = 'users';
  static final tableQuoteExamples = 'quote_examples';
  static final tableWordKnew = 'word_knew';
  static final tableWordFarvorite = 'word_favorite';
  static final tableWordToLearn = 'word_toLearn';
  static final columnIdWord = 'id_word';
  static final columnWord = 'word';
  static final columnPronunUK = 'pronun_uk';
  static final columnSoundUK = 'sound_uk';
  static final columnPronunUS = 'pronun_us';
  static final columnSoundUS = 'sound_us';
  static final columnType = 'type';
  static final columnDefinition = 'definition';
  static final columnIdExample = 'id_example';
  static final columnExample = 'example';
  static final columnImage = 'image';
  static final columnIdImage = 'id_image';
  static final columnMeanCard = 'mean_card';
  static final columnUserName = 'user_name';
  static final columnQuoteExample = 'quote_example';
  static final columnReviewDay = 'review_day';

  // Contructor
  DatabaseLocalHelper._privateConstructor();
  static final DatabaseLocalHelper instance = DatabaseLocalHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  void databaseInit() async {
    _database = await instance.database;
  }

  _initDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, _databaseName);
    // Checking existing
    var exists = await databaseExists(path);
    if (!exists) {
      // if not exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // copy
      ByteData data = await rootBundle.load(join("assets", _databaseName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // write
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }

    // Important
    return await openDatabase(path, version: _databaseVersion);
  }

  // Insert to learn word
  Future<int> insertToLearnWord(Word word) async {
    Database db = await instance.database;
    return await db.insert(tableWordToLearn, word.toMap());
  }

  // Insert knew word
  Future<int> insertKnewWord(Word word) async {
    Database db = await instance.database;
    return await db.insert(tableWordKnew, word.toMap());
  }

  // Insert farvorite word
  Future<int> insertFarvoriteWord(Word word) async {
    Database db = await instance.database;
    return await db.insert(tableWordFarvorite, word.toMap());
  }

  // Get the Map List Object
  Future<List<Map<String, dynamic>>> getWordsMapList() async {
    Database db = await instance.database;
    var result = await db.query(tableWord);

    return result;
  }

  // Get the Map List and convert it to Word List
  Future<List<Word>> getAllWords() async {
    var wordMapList = await getWordsMapList(); // Get Map List from database
    int count = wordMapList.length;

    List<Word> wordList = List<Word>();
    for (int i = 0; i < count; i++) {
      wordList.add(Word.fromMapObject(wordMapList[i]));
    }

    return wordList;
  }

  // Get numbers of words in database
  Future<int> getCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableWord'));
  }

  // Get numbers of knew words in database
  Future<int> getCountKnewWords() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableWordKnew'));
  }

  // Get numbers of to learn words in database
  Future<int> getCountToLearnWord() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableWordToLearn'));
  }

  // Get A Word
  Future<List<Map<String, dynamic>>> getWord(int id) async {
    Database db = await instance.database;
    var result = await db
        .rawQuery('select * from $tableWord where $columnIdWord = ?', [id]);
    //Word word = new Word.map(result);
    return result;
  }

  // Get N Words
  Future<List<Word>> getNWords(int numbersWords) async {
    Database db = await instance.database;
    var resultMapList = await db.rawQuery(
        'SELECT w.$columnIdWord, $columnWord, $columnType, $columnPronunUK, $columnSoundUK, $columnPronunUS, $columnSoundUS, $columnDefinition, $columnMeanCard FROM $tableWord w JOIN $tableWordKnew wk ON wk.$columnIdWord != w.$columnIdWord JOIN $tableWordToLearn wtl ON wtl.$columnIdWord != w.$columnIdWord JOIN $tableWordFarvorite wf ON wf.$columnIdWord != w.$columnIdWord JOIN $tableWordType wt ON w.$columnIdWord = wt.$columnIdWord LIMIT ?',
        [numbersWords]);
    List<Word> words = new List();
    for (int i = 0; i < resultMapList.length; i++) {
      words.add(Word.fromMapObject(resultMapList[i]));
      words[i].examples = await getExamplesWithId(words[i].id);
    }
    return words;
  }

  // Get List Farvorite Words
  Future<List<Word>> getListFarvoriteWords() async {
    Database db = await instance.database;
    var resultMapList = await db.rawQuery(
      'SELECT * FROM $tableWord w JOIN $tableWordFarvorite wf ON wf.$columnIdWord = w.$columnIdWord',
    );
    List<Word> words = new List();
    for (int i = 0; i < resultMapList.length; i++) {
      words.add(Word.fromMapObject(resultMapList[i]));
    }
    return words;
  }

  // Get List Knew Words
  Future<List<Word>> getListKnewWords() async {
    Database db = await instance.database;
    var resultMapList = await db.rawQuery(
      'SELECT * FROM $tableWord w JOIN $tableWordKnew wf ON wf.$columnIdWord = w.$columnIdWord',
    );
    List<Word> words = new List();
    for (int i = 0; i < resultMapList.length; i++) {
      words.add(Word.fromMapObject(resultMapList[i]));
    }
    return words;
  }

  // Get List To Learn Words
  Future<List<Word>> getListToLearnWords() async {
    Database db = await instance.database;
    var resultMapList = await db.rawQuery(
      'SELECT * FROM $tableWord w JOIN $tableWordToLearn wf ON wf.$columnIdWord = w.$columnIdWord',
    );
    List<Word> words = new List();
    for (int i = 0; i < resultMapList.length; i++) {
      words.add(Word.fromMapObject(resultMapList[i]));
    }
    return words;
  }

  // Get list example with id word
  Future<List<String>> getExamplesWithId(int id) async {
    Database db = await instance.database;
    var result = await db.rawQuery(
        'SELECT $columnExample FROM $tableExamples WHERE $columnIdExample = ?',
        [id]);

    List<String> listExps = new List<String>();
    for (int i = 0; i < result.length; i++) {
      listExps.add(result[i]['example'].toString());
    }
    return listExps;
  }

  // Get list images with id word
  Future<List<String>> geImagesWithId(int id) async {
    Database db = await instance.database;
    var result = await db.rawQuery(
        'SELECT $columnImage FROM $tableImages WHERE $columnIdImage = ?', [id]);

    List<String> listImgs = List<String>();
    for (int i = 0; i < result.length; i++) {
      listImgs.add(result[i]['image'].toString());
    }
    return listImgs;
  }

  // Get list quotes with id word
  Future<void> getQuotesWithId(int id) async {
    Database db = await instance.database;
    var result = await db.rawQuery(
        'SELECT $columnQuoteExample FROM $tableQuoteExamples WHERE $columnIdWord = ?',
        [id]);

    List<String> listQuotes = List<String>();
    for (int i = 0; i < result.length; i++) {
      listQuotes.add(result[i]['quotes'].toString());
    }
    return listQuotes;
  }

  // Update
  Future<int> update(Word word) async {
    Database db = await instance.database;
    //String id = word.toMap()[columnIdWord];
    return await db.update(tableWord, word.toMap(),
        where: '$columnIdWord = ?', whereArgs: [word.id]);
  }

  // Delete to learn word
  Future<int> deleteToLearnWord(int id) async {
    Database db = await instance.database;
    return await db
        .delete(tableWordToLearn, where: '$columnIdWord = ?', whereArgs: [id]);
  }

  // Delete knew word
  Future<int> deleteKnewWord(int id) async {
    Database db = await instance.database;
    return await db
        .delete(tableWordKnew, where: '$columnIdWord = ?', whereArgs: [id]);
  }

  // Delete farvorite word
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(tableWordFarvorite,
        where: '$columnIdWord = ?', whereArgs: [id]);
  }
}
