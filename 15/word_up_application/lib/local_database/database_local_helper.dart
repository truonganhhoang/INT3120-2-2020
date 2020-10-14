import 'dart:io';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../word.dart';

class DatabaseHelper {
  static final _databaseName = 'WordUpDB2020.db';
  static final _databaseVersion = 1;
  static final table = 'word';
  static final columnId = 'id_word';
  static final columnWord = 'word';

  // Contructor
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<void> databaseInit() async {
    print('open');
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
    if (_database != null) return await _database.insert(table, row);
    return 0;
  }

  // Select all
  Future<void> getAllWords() async {
    Database db = await instance.database;
    print('hello');
    var result = await db.query(table);
    print('hello1');
    print(result.toList());
  }

  // RAM query
  Future<int> getCount() async {
    if (_database != null)
      return Sqflite.firstIntValue(
          await _database.rawQuery('SELECT COUNT(EMAIL) FROM $table'));
    return 0;
  }

  // Get a word
  Future<void> getAWordInfoWithId(int id) async {
    if (_database != null) {
      var result = await _database
          .rawQuery('SELECT * FROM $table where $columnId = ?', [id]);
      print(result.toList());
    }
  }

  // Get N Words
  Future<void> getNWords(int numbersWords) async {
    if (_database != null) {
      print('Start Get');
      var result = await _database
          .rawQuery('SELECT * FROM $table limit ?', [numbersWords]);
      print(result.toList());
    }
  }

  // Update
  Future<int> update(Map<String, dynamic> row) async {
    if (_database != null) {
      String id = row[columnId];
      return await _database
          .update(table, row, where: '$columnId = ?', whereArgs: [id]);
    }
    return 0;
  }

  // Delete
  Future<int> delete(String email) async {
    if (_database != null)
      return await _database
          .delete(table, where: '$columnId = ?', whereArgs: [email]);
    return 0;
  }
}
