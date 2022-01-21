import 'dart:io';
import 'package:foodrecipeapp/recipe_model.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async => _database ?? await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'favourite.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("""
    CREATE TABLE favourite(
      id INTEGER PRIMARY KEY,
      title TEXT,
      image TEXT,
      ingredients TEXT,
      directions TEXT,
      youtubeUrl TEXT
      
    )
    
    """);

    await db.execute("""
    CREATE TABLE cooked(
      id INTEGER PRIMARY KEY,
      title TEXT,
      image TEXT,
      ingredients TEXT,
      directions TEXT,
      youtubeUrl TEXT
      
    )
    
    """);
  }

  Future<int> addFavouriteRecipe(RecipeModel recipeModel) async {
    Database db = await instance.database;
    return await db.insert("favourite", recipeModel.toJson());
  }

  Future<int> addCookedRecipe(RecipeModel recipeModel) async {
    Database db = await instance.database;
    return await db.insert("cooked", recipeModel.toJson());
  }

  Future<List<RecipeModel>> getFavouriteRecipe() async {
    Database db = await instance.database;
    var favourite = await db.query("favourite", orderBy: "id");

    List<RecipeModel> recipelist = favourite.isNotEmpty
        ? favourite.map((data) => RecipeModel.fromJson(data)).toList()
        : [];
    return recipelist;
  }

  Future<List<RecipeModel>> getCookedRecipe() async {
    Database db = await instance.database;
    var cooked = await db.query("cooked", orderBy: "id");

    List<RecipeModel> recipelist = cooked.isNotEmpty
        ? cooked.map((data) => RecipeModel.fromJson(data)).toList()
        : [];
    return recipelist;
  }

  Future deleteFavoriteItem(int? id) async {
    Database db = await instance.database;
    db.delete("favourite", where: "id=?", whereArgs: [id]);
  }

  Future deleteCookedItem(int? id) async {
    Database db = await instance.database;
    db.delete("cooked", where: "id=?", whereArgs: [id]);
  }
}
