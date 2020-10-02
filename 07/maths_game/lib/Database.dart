import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'maths_game_database.db'),
    onCreate: (db, version) {
      db.execute(
        "CREATE TABLE minus(id INTEGER PRIMARY KEY, number1 integer, number2 INTEGER,result INTEGER)",
      );
      db.execute(
        "CREATE TABLE duplicate(id INTEGER PRIMARY KEY, number1 integer, number2 INTEGER,result INTEGER)",
      );
      db.execute(
        "CREATE TABLE divide(id INTEGER PRIMARY KEY, number1 integer, number2 INTEGER,result INTEGER)",
      );
      return db.execute(
        "CREATE TABLE plus(id INTEGER PRIMARY KEY, number1 integer, number2 INTEGER,result INTEGER)",
      );
    },
    version: 1,
  );

  Future<void> insertPlus(Plus plus) async {
    final Database db = await database;

    await db.insert(
      'plus',
      plus.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertMinus(Minus minus) async {
    final Database db = await database;

    await db.insert(
      'minus',
      minus.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertDuplicate(Duplicate duplicate) async {
    final Database db = await database;

    await db.insert(
      'duplicate',
      duplicate.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertDivide(Divide divide) async {
    final Database db = await database;

    await db.insert(
      'divide',
      divide.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Plus>> plus() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('plus');

    return List.generate(maps.length, (i) {
      return Plus(
        id: maps[i]["id"],
        number1: maps[i]['number1'],
        number2: maps[i]['number2'],
        result: maps[i]['result'],
      );
    });
  }

  Future<void> updatePlus(Plus plus) async {
    final db = await database;

    await db.update(
      'plus',
      plus.toMap(),
      where: "id = ?",
      whereArgs: [plus.id],
    );
  }

  Future<void> deletePlus(int id) async {
    final db = await database;

    await db.delete(
      'plus',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  /* var m = Minus(id: 1,number1: 2,number2: 1,result: 1);
  var d = Duplicate(id: 1,number1: 1,number2: 2,result: 2);
  var dvd = Divide(id: 1,number1: 2,number2: 1,result: 1);
  var p = Plus(id: 0, number1: 1, number2: 1, result: 2);

  await insertMinus(m);
  await insertDuplicate(d);
  await insertDivide(dvd);
  await insertPlus(p);*/

  // Update Fido's age and save it to the database.
  /*fido = Plus(
      id: fido.id,
      number1: fido.number1,
      number2: fido.number2,
      result: fido.result
  );*/
  //await updatePlus(fido);

  // Delete Fido from the database.
  // await deletePlus(fido.id);
}

class Plus {
  final int id;
  final int number1;
  final int number2;
  final int result;

  Plus({this.id, this.number1, this.number2, this.result});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number1': number1,
      'number2': number2,
      'result': result,
    };
  }

  @override
  String toString() {
    return 'Plus{id: $id, number1: $number1, number2: $number2, result: $result}';
  }
}

class Minus {
  final int id;
  final int number1;
  final int number2;
  final int result;

  Minus({this.id, this.number1, this.number2, this.result});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number1': number1,
      'number2': number2,
      'result': result,
    };
  }

  @override
  String toString() {
    return 'Minus{id: $id, number1: $number1, number2: $number2, result: $result}';
  }
}

class Duplicate {
  final int id;
  final int number1;
  final int number2;
  final int result;

  Duplicate({this.id, this.number1, this.number2, this.result});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number1': number1,
      'number2': number2,
      'result': result,
    };
  }

  @override
  String toString() {
    return 'Duplicate{id: $id, number1: $number1, number2: $number2, result: $result}';
  }
}

class Divide {
  final int id;
  final int number1;
  final int number2;
  final int result;

  Divide({this.id, this.number1, this.number2, this.result});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number1': number1,
      'number2': number2,
      'result': result,
    };
  }

  @override
  String toString() {
    return 'Divide{id: $id, number1: $number1, number2: $number2, result: $result}';
  }
}
