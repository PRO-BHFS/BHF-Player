import 'dart:async';

import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/app_constants_exports.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Database? _db;

  Database get db {
    if (_db == null) throw Exception("لم يتم تهيئة البيانات بنجاح");
    return _db!;
  }

  Future<void> init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DbConstants.databaseName);

    _db = await openDatabase(
      path,
      version: DbConstants.dbVersion,
      onCreate: _onCreate,
    );
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute(Queries.createTableCourses);
  }

  Future<int> insertRow(
    Map<String, dynamic> data, {
    String table = DbConstants.tableName,
  }) async {
    return await db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getAllData({
    String table = DbConstants.tableName,
  }) async {
    return await db.query(table);
  }

  Future<int> updateRow(
    int? id,
    Map<String, dynamic> data, {
    String table = DbConstants.tableName,
  }) async {
    return await db.update(
      table,
      data,
      where: "${DbColumns.id} = ?",
      whereArgs: [id],
    );
  }

  Future<int> deleteRow(int? id, {String table = DbConstants.tableName}) async {
    return await db.delete(
      table,
      where: "${DbColumns.id} = ?",
      whereArgs: [id],
    );
  }

  Future<void> restTable({String table = DbConstants.tableName}) async {
    await db.delete(table);
    await db.execute(Queries.resetTable(table));
  }
}
