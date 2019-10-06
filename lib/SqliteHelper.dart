import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

class SqliteHelper {
  final sqlFileName = 'mydb.sql';
  final table = 'post';
  Database db;

  open() async {
    String path = "${await getDatabasesPath()}/$sqlFileName";
    if (db == null) {
      db = await openDatabase(path, version: 1, onCreate: (db, ver) async {
        await db.execute('''
        Create Table post(
          id integer primary key,
          userId integer,
          title text,
          body text
        );
      ''');
      });
    }
  }

  insert(Map<String, dynamic> m) async {
    return await db.insert(table, m);
  }

  queryAll() async {
    return await db.query(table, columns: null);
  }

  delete(int id) async {
    return await db.delete(table, where: 'id=$id');
  }
}
