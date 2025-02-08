import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBhelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }

  initialDB() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'CARillly.db');
    Database mydb = await openDatabase(path, onCreate: _onCreate,version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }
Future<void> _onUpgrade(Database db, int oldVersion, int newVersion )async{

}
// Creating tables
  Future<void> _onCreate(Database db, int version) async {
    // Creating User table
    await db.execute('''
      CREATE TABLE User (
        user_id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        password TEXT NOT NULL,
        phone_number TEXT,
        user_url TEXT
      );
    ''');

    // Creating Agency table
    await db.execute('''
      CREATE TABLE Agency (
        agency_id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        owner_name TEXT,
        location TEXT,
        contact TEXT,
        password TEXT NOT NULL,
        commerce_reg_url TEXT,
        id_card_url TEXT
      );
    ''');

    // Creating Car table
    await db.execute('''
      CREATE TABLE Car (
        car_id INTEGER PRIMARY KEY AUTOINCREMENT,
        agency_id INTEGER,
        name TEXT NOT NULL,
        brand TEXT NOT NULL,
        model TEXT NOT NULL,
        year INTEGER NOT NULL,
        price_per_day REAL NOT NULL,
        status TEXT DEFAULT 'available',
        image_url TEXT,
        description TEXT,
        FOREIGN KEY (agency_id) REFERENCES Agency(agency_id) ON DELETE CASCADE
      );
    ''');

    // Creating Favorite table
    await db.execute('''
      CREATE TABLE Favorite (
        favorite_id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        car_id INTEGER,
        FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
        FOREIGN KEY (car_id) REFERENCES Car(car_id) ON DELETE CASCADE
      );
    ''');

    // Creating RentalRequest table
    await db.execute('''
      CREATE TABLE RentalRequest (
        request_id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        car_id INTEGER,
        start_date TEXT NOT NULL,
        end_date TEXT NOT NULL,
        status TEXT DEFAULT 'pending',
        FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
        FOREIGN KEY (car_id) REFERENCES Car(car_id) ON DELETE CASCADE
      );
    ''');

    // Creating CarImages table
    await db.execute('''
      CREATE TABLE CarImage (
        image_id INTEGER PRIMARY KEY AUTOINCREMENT,
        car_id INTEGER,
        image_url TEXT NOT NULL,
        description TEXT,
        FOREIGN KEY (car_id) REFERENCES Car(car_id) ON DELETE CASCADE
      );
    ''');
  }

  Future<List<Map>> ReadData(String sql) async {
    try {
      Database? mydb = await db;
      List<Map> response = await mydb!.rawQuery(sql);
      return response;
    } catch (e) {
      print('Error reading data: $e');
      return [];
    }
  }

  Future<int> Insert(String sql) async {
    try {
      Database? mydb = await db;
      int response = await mydb!.rawInsert(sql);
      return response;
    } catch (e) {
      print('Error inserting data: $e');
      return -1;
    }
  }

  Future<int> Delete(String sql) async {
    try {
      Database? mydb = await db;
      int response = await mydb!.rawDelete(sql);
      return response;
    } catch (e) {
      print('Error deleting data: $e');
      return -1;
    }
  }

  Future<int> Update(String sql) async {
    try {
      Database? mydb = await db;
      int response = await mydb!.rawUpdate(sql);
      return response;
    } catch (e) {
      print('Error updating data: $e');
      return -1;
    }
  }




}
