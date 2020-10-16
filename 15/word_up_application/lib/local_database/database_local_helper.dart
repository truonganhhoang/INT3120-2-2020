import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:developer';
import '../word.dart';

class DatabaseHelper {
  static final _databaseName = 'WordUpDB2020.db';
  static final _databaseVersion = 1;
  static final tableWord = 'word';
  static final tableWordType = 'word_type';
  static final tableExamples = 'examples';
  static final tableImages = 'images';
  static final tableUsers = 'users';
  static final tableQuoteExamples = 'quote_examples';
  static final tableWordKnew = 'word_knew';
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
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

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

  // Insert
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableWord, row);
  }

  // Select all
  Future<void> getAllWords() async {
    Database db = await instance.database;
    var result = await db.query(tableWord);
    log("$result");
  }

  // RAM query
  Future<int> getCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(EMAIL) FROM $tableWord'));
  }

  // Get N Words
  Future<List<Word>> getNWords() async {
    Database db = await instance.database;
    List<Map> result = await db.rawQuery(
        'SELECT DISTINCT w.$columnIdWord, $columnWord, $columnType, $columnPronunUK, $columnSoundUK, $columnPronunUS, $columnSoundUS, $columnDefinition, $columnMeanCard, $columnImage, $columnExample, $columnQuoteExample FROM $tableWord w JOIN $tableWordType wt ON w.$columnIdWord = wt.$columnIdWord JOIN $tableExamples ex ON ex.$columnIdExample = wt.$columnIdExample JOIN $tableImages im ON im.$columnIdImage = wt.$columnIdImage JOIN $tableQuoteExamples qe ON qe.$columnIdWord = w.$columnIdWord WHERE w.$columnIdWord NOT IN (SELECT $columnIdWord FROM $tableWordKnew)');
    log("$result");

    List<Word> words = new List();
    for (int i = 0; i < result.length; i++) {
      Word word = new Word.map(result[i]);
      words.add(word);
    }
    return words;
  }

  // Update
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    String id = row[columnIdWord];
    return await db
        .update(tableWord, row, where: '$columnIdWord = ?', whereArgs: [id]);
  }

  // Delete
  Future<int> delete(String email) async {
    Database db = await instance.database;
    return await db
        .delete(tableWord, where: '$columnIdWord = ?', whereArgs: [email]);
  }
}
