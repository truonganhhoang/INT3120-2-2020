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
  static final tableWordLearning = 'word_learning';
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
  static final columnReviewDate = 'review_date';
  static final columnReviewTime = 'review_time';
  static final columnIsFavorite = 'is_favorite';

  // Contructor
  DatabaseLocalHelper._privateConstructor();
  static final DatabaseLocalHelper instance =
      DatabaseLocalHelper._privateConstructor();

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
  Future<void> insertToLearnWord(int id) async {
    Database db = await instance.database;
    var checkExist = await db.rawQuery(
        'SELECT COUNT($columnIdWord) AS TOTAL FROM $tableWordToLearn WHERE $columnIdWord = ?',
        [id]);

    //print(checkExist[0]['TOTAL'].toString());
    var result;
    if (checkExist[0]['TOTAL'].toString() != '0') {
      print('Exist Word');
      return;
    } else {
      print('Insert OK');
      result = await db.rawQuery(
          'SELECT $columnIdWord FROM $tableWord WHERE $columnIdWord = ?', [id]);
      await db.insert(tableWordToLearn, result[0]);
    }
  }

  // Insert knew word
  Future<void> insertKnewWord(int id) async {
    Database db = await instance.database;
    var checkExist = await db.rawQuery(
        'SELECT COUNT($columnIdWord) AS TOTAL FROM $tableWordKnew WHERE $columnIdWord = ?',
        [id]);

    //print(checkExist[0]['TOTAL'].toString());
    var result;
    if (checkExist[0]['TOTAL'].toString() != '0') {
      print('Exist Word');
      return;
    } else {
      print('Insert OK');
      result = await db.rawQuery(
          'SELECT $columnIdWord FROM $tableWord WHERE $columnIdWord = ?', [id]);
      await db.insert(tableWordToLearn, result[0]);
    }
  }

  // Insert learning word
  Future<void> insertLearningWord(
      int id, String reviewDate, int reviewTime) async {
    Database db = await instance.database;
    var checkExist = await db.rawQuery(
        'SELECT COUNT($columnIdWord) AS TOTAL FROM $tableWordLearning WHERE $columnIdWord = ?',
        [id]);

    //print(checkExist[0]['TOTAL'].toString());
    //var result;
    if (checkExist[0]['TOTAL'].toString() != '0') {
      print('Exist Word');
      return;
    } else {
      print('Insert OK');
      await db.rawQuery(
          'INSERT INTO $tableWordLearning ($columnIdWord, $columnReviewDate, $columnReviewTime) VALUES (?, ?, ?)',
          [id, reviewDate, reviewTime]);
    }
  }

  // Update Insert favorite word
  Future<void> updateInsertFavoriteWord(int id) async {
    Database db = await instance.database;
    await db.rawQuery(
        'UPDATE $tableWordFarvorite SET $columnIsFavorite = 1 WHERE $columnIdWord = ?',
        [id]);
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
      wordList[i].examples = await getExamplesWithId(wordList[i].id);
      wordList[i].imagePaths = await getImagesWithId(wordList[i].id);
      wordList[i].quotes = await getQuotesWithId(wordList[i].id);
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

  // Get numbers of learning words in database
  Future<int> getCountLearningWord() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableWordLearning'));
  }

  // Get A Word with ID
  Future<List<Word>> getWord(int id) async {
    Database db = await instance.database;
    var resultMapList = await db.rawQuery(
        'SELECT * FROM $tableWord w JOIN $tableWordType wt ON wt.$columnIdWord = w.$columnIdWord WHERE $columnIdWord = ?',
        [id]);
    //Word word = new Word.map(result);
    List<Word> words = new List();
    for (int i = 0; i < resultMapList.length; i++) {
      words.add(Word.fromMapObject(resultMapList[i]));
      words[i].examples = await getExamplesWithId(words[i].id);
      words[i].imagePaths = await getImagesWithId(words[i].id);
      words[i].quotes = await getQuotesWithId(words[i].id);
    }
    for (int j = 0; j < words.length; j++) {
      words[j].printThisWord();
    }
    return words;
  }

  // Get N Words
  Future<List<Word>> getNWords(int numbersWords) async {
    Database db = await instance.database;
    var resultMapList = await db.rawQuery(
        'SELECT w.$columnIdWord, $columnWord, $columnType, $columnPronunUK, $columnSoundUK, $columnPronunUS, $columnSoundUS, $columnDefinition, $columnMeanCard FROM $tableWord w JOIN $tableWordType wt ON w.$columnIdWord = wt.$columnIdWord WHERE NOT EXISTS (SELECT * FROM $tableWordToLearn wtl WHERE wtl.$columnIdWord = w.$columnIdWord) AND NOT EXISTS (SELECT * FROM $tableWordKnew wk WHERE wk.$columnIdWord = w.$columnIdWord) AND NOT EXISTS (SELECT * FROM $tableWordLearning wf WHERE wf.$columnIdWord = w.$columnIdWord) LIMIT ?',
        [numbersWords]);
    List<Word> words = new List();
    for (int i = 0; i < resultMapList.length; i++) {
      words.add(Word.fromMapObject(resultMapList[i]));
      words[i].examples = await getExamplesWithId(words[i].id);
      words[i].imagePaths = await getImagesWithId(words[i].id);
      words[i].quotes = await getQuotesWithId(words[i].id);
    }
    // for (int j = 0; j < words.length; j++) {
    //   words[j].printThisWord();
    // }
    return words;
  }

  // Get List Favorite Words
  Future<List<Word>> getListFavoriteWords() async {
    Database db = await instance.database;
    var resultMapList = await db.rawQuery(
      'SELECT * FROM $tableWord w JOIN $tableWordType wt ON wt.$columnIdWord = w.$columnIdWord JOIN $tableWordFarvorite wf ON wf.$columnIdWord = w.$columnIdWord WHERE $columnIsFavorite = 1',
    );
    List<Word> words = new List();
    for (int i = 0; i < resultMapList.length; i++) {
      words.add(Word.fromMapObject(resultMapList[i]));
      words[i].examples = await getExamplesWithId(words[i].id);
      words[i].imagePaths = await getImagesWithId(words[i].id);
      words[i].quotes = await getQuotesWithId(words[i].id);
    }

    // for (int i = 0; i < words.length; i++) {
    //   words[i].printThisWord();
    // }

    return words;
  }

  // Get List Knew Words
  Future<List<Word>> getListKnewWords() async {
    Database db = await instance.database;
    var resultMapList = await db.rawQuery(
      'SELECT * FROM $tableWord w JOIN $tableWordType wt ON wt.$columnIdWord = w.$columnIdWord JOIN $tableWordKnew wk ON wk.$columnIdWord = w.$columnIdWord JOIN $tableWordFarvorite wf ON w.$columnIdWord = wf.$columnIdWord',
    );
    List<Word> words = new List();
    for (int i = 0; i < resultMapList.length; i++) {
      words.add(Word.fromMapObject(resultMapList[i]));
      words[i].examples = await getExamplesWithId(words[i].id);
      words[i].imagePaths = await getImagesWithId(words[i].id);
      words[i].quotes = await getQuotesWithId(words[i].id);
    }
    return words;
  }

  // Get List To Learn Words
  Future<List<Word>> getListToLearnWords() async {
    Database db = await instance.database;
    var resultMapList = await db.rawQuery(
      'SELECT * FROM $tableWord w JOIN $tableWordType wt ON wt.$columnIdWord = w.$columnIdWord JOIN $tableWordToLearn wtl ON wtl.$columnIdWord = w.$columnIdWord JOIN $tableWordFarvorite wf ON w.$columnIdWord = wf.$columnIdWord',
    );
    List<Word> words = new List();
    for (int i = 0; i < resultMapList.length; i++) {
      words.add(Word.fromMapObject(resultMapList[i]));
      words[i].examples = await getExamplesWithId(words[i].id);
      words[i].imagePaths = await getImagesWithId(words[i].id);
      words[i].quotes = await getQuotesWithId(words[i].id);
    }
    // for (int i = 0; i < words.length; i++) {
    //   words[i].printThisWord();
    // }
    // print('X' + words.length.toString());
    return words;
  }

  // Get List Learning Words
  Future<List<Word>> getListLearningWords() async {
    Database db = await instance.database;
    var resultMapList = await db.rawQuery(
      'SELECT * FROM $tableWord w JOIN $tableWordType wt ON wt.$columnIdWord = w.$columnIdWord JOIN $tableWordLearning wl ON wl.$columnIdWord = w.$columnIdWord JOIN $tableWordFarvorite wf ON w.$columnIdWord = wf.$columnIdWord',
    );
    List<Word> words = new List();
    for (int i = 0; i < resultMapList.length; i++) {
      words.add(Word.fromMapObject(resultMapList[i]));
      words[i].examples = await getExamplesWithId(words[i].id);
      words[i].imagePaths = await getImagesWithId(words[i].id);
      words[i].quotes = await getQuotesWithId(words[i].id);
    }
    // for (int i = 0; i < words.length; i++) {
    //   words[i].printThisWord();
    // }
    return words;
  }

  // Get list review words
  Future<List<Word>> getListReviewWords() async {
    Database db = await instance.database;
    var resultMapList = await db.rawQuery(
      'SELECT * FROM $tableWord w JOIN $tableWordType wt ON wt.$columnIdWord = w.$columnIdWord JOIN $tableWordLearning wl ON wl.$columnIdWord = w.$columnIdWord JOIN $tableWordFarvorite wf ON w.$columnIdWord = wf.$columnIdWord WHERE date(wl.$columnReviewDate) <= date()',
    );
    List<Word> words = new List();
    for (int i = 0; i < resultMapList.length; i++) {
      words.add(Word.fromMapObject(resultMapList[i]));
      words[i].examples = await getExamplesWithId(words[i].id);
      words[i].imagePaths = await getImagesWithId(words[i].id);
      words[i].quotes = await getQuotesWithId(words[i].id);
    }

    // for (int i = 0; i < words.length; i++) {
    //   words[i].printThisWord();
    // }

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
  Future<List<String>> getImagesWithId(int id) async {
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
  Future<List<String>> getQuotesWithId(int id) async {
    Database db = await instance.database;
    var result = await db.rawQuery(
        'SELECT $columnQuoteExample FROM $tableQuoteExamples WHERE $columnIdWord = ?',
        [id]);

    List<String> listQuotes = List<String>();
    for (int i = 0; i < result.length; i++) {
      listQuotes.add(result[i]['quote_example'].toString());
    }
    return listQuotes;
  }

  // Get definition word with id
  Future<String> getDefinitionWithId(int id) async {
    Database db = await instance.database;
    var res = await db.rawQuery(
        'SELECT $columnDefinition FROM $tableWordType WHERE $columnIdWord = ?',
        [id]);
    print(res[0]['definition'].toString());
    return res[0]['definition'].toString();
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

  // Delete learning word
  Future<int> deleteLearningWord(int id) async {
    Database db = await instance.database;
    return await db
        .delete(tableWordLearning, where: '$columnIdWord = ?', whereArgs: [id]);
  }

  // Update delete favorite word
  Future<void> updateDeleteFavoriteWord(int id) async {
    Database db = await instance.database;

    await db.rawQuery(
        'UPDATE $tableWordFarvorite SET $columnIsFavorite = 0 WHERE $columnIdWord = ?',
        [id]);
    print('update delete favorite word');
  }

  // Update review date and review time
  Future<void> updateReviewWord(
      int id, String newReviewDate, int newReviewTime) async {
    Database db = await instance.database;

    await db.rawQuery(
        'UPDATE $tableWordLearning SET $columnReviewDate = ?, $columnReviewTime = ? WHERE $columnIdWord = ?',
        [newReviewDate, newReviewTime, id]);
    print('update review word finish!');
  }

  // Reset local database
  Future<void> resetDatabase() async {
    Database db = await instance.database;
    await db.rawQuery('UPDATE $tableWordFarvorite SET $columnIsFavorite = 0');
    await db.rawQuery('DELETE FROM $tableWordKnew');
    await db.rawQuery('DELETE FROM $tableWordToLearn');
    await db.rawQuery('DELETE FROM $tableWordLearning');
  }
}
