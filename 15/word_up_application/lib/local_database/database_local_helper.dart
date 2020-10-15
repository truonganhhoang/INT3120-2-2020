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
  static final columnIdWord = 'id_word';
  static final columnWord = 'word';
  static final columnType = 'type';
  static final columnDefinition = 'definition';
  static final columnIdExample = 'id_example';
  static final columnExample = 'example';
  static final tableImages = 'images';
  static final columnImage = 'image';
  static final columnIdImage = 'id_image';
  static final columnMeanCard = 'mean_card';
  static final tableUsers = 'users';
  static final columnUserName = 'user_name';

  // Contructor
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // void databaseInit() async {
  //   _database = await instance.database;
  // }

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

  // Get a word
  Future<void> getAImage(int id_image) async {
    Database db = await instance.database;
    var result = await db.rawQuery(
        'SELECT * FROM $tableImages where $columnIdImage = ?', [id_image]);
    log("$result");
  }

  // Get a user
  Future<void> getAUserInfoWithName(String user_name) async {
    Database db = await instance.database;
    var result = await db.rawQuery(
        'SELECT * FROM $tableUsers where $columnUserName = ?', [user_name]);
    log("$result");
  }

  // Get N Words
  Future<void> getNWords(int numbers) async {
    Database db = await instance.database;
    var result =
        await db.rawQuery('SELECT * FROM $tableWord limit ?', [numbers]);
    log("$result");
  }

  //
  Future<void> getWordsOption() async {
    Database db = await instance.database;
    var result = await db.rawQuery(
        'SELECT $tableWord.$columnIdWord, $columnWord, $columnType, $columnDefinition, $columnMeanCard, $columnImage FROM $tableWord, $tableWordType, $tableImages WHERE $tableWord.$columnIdWord = $tableWordType.$columnIdWord AND $tableWordType.$columnIdImage = $tableImages.$columnIdImage');
    log("$result");
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
