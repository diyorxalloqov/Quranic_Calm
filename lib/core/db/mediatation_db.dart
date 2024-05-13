import 'package:path/path.dart';
import 'package:quranic_calm/modules/global/imports/app_imports.dart';
import 'package:quranic_calm/modules/home/model/votes_model.dart';
import 'package:sqflite/sqflite.dart';

class MediatationDb {
  static final MediatationDb _mediatationDBService = MediatationDb._internal();

  factory MediatationDb() => _mediatationDBService;

  MediatationDb._internal();

  static int databaseVersion = 1;
  static String categoryTable = "categoryTable";
  static String itemTable = "itemTable";
  static String votesTable = "votesTable";

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'mediatation.db');
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: databaseVersion,
      onUpgrade: _onUpgrade,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute("DROP TABLE IF EXISTS $categoryTable");
    await db.execute(
      'CREATE TABLE $categoryTable (category_id INTEGER PRIMARY KEY, category_lang TEXT, category_name TEXT, category_create_at TEXT)',
    );
    await db.execute(
      'CREATE TABLE $itemTable (item_id INTEGER PRIMARY KEY, item_name TEXT, category_id INTEGER, item_audio_url TEXT,item_audio_name TEXT,item_create_at TEXT,item_description TEXT,item_time TEXT,is_saved INTEGER)',
    );
    await db.execute(
      'CREATE TABLE $votesTable (vote_id INTEGER PRIMARY KEY,vote_name TEXT,vote_lang TEXT,vote_audio_url TEXT, vote_audio_name TEXT,vote_create_at TEXT,vote_icon_url TEXT,vote_icon_name TEXT)',
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $categoryTable (category_id INTEGER PRIMARY KEY, category_lang TEXT, category_name TEXT, category_create_at TEXT)',
    );
    await db.execute(
      'CREATE TABLE $itemTable (item_id INTEGER PRIMARY KEY, item_name TEXT, category_id INTEGER, item_audio_url TEXT,item_audio_name TEXT,item_create_at TEXT,item_description TEXT,item_time TEXT,is_saved INTEGER)',
    );
    await db.execute(
      'CREATE TABLE $votesTable (vote_id INTEGER PRIMARY KEY,vote_name TEXT,vote_lang TEXT,vote_audio_url TEXT, vote_audio_name TEXT,vote_create_at TEXT,vote_icon_url TEXT,vote_icon_name TEXT)',
    );
  }

  /* CATEGORY */

  Future<void> insertCategory(CategoryModel categoryModel) async {
    final db = await _mediatationDBService.database;

    try {
      await db.transaction((txn) async {  
        await txn.insert(categoryTable, categoryModel.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace);
      });
    } on DatabaseException catch (e) {
      debugPrint("${e.toString()} database Exception");
    }
    debugPrint("$categoryTable names table length from insert");
  }

  Future<List<CategoryModel>> getCategories() async {
    final db = await _mediatationDBService.database;
    final List<Map<String, dynamic>> maps = await db.transaction((txn) async =>
        await txn.query(categoryTable, orderBy: 'category_id ASC'));
    debugPrint("${maps.length} data length from db");
    if (maps.isNotEmpty) {
      return List.generate(maps.length, (i) {
        return CategoryModel.fromJsonDb(maps[i]);
      });
    } else {
      return [];
    }
  }

  Future<void> updateCategories(CategoryModel categoryModel) async {
    final db = await _mediatationDBService.database;
    /* 
    serverdan kegan version bilan tekshirish kerak
     */

    await db.update(
      categoryTable,
      categoryModel.toJson(),
      where: 'category_id = ?',
      whereArgs: [categoryModel.categoryId],
    );
  }

  /* ITEMS */

  Future<void> insertItems(ItemsModel itemsModel) async {
    final db = await _mediatationDBService.database;

    try {
      await db.transaction((txn) async {
        await txn.insert(itemTable, itemsModel.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace);
      });
    } on DatabaseException catch (e) {
      debugPrint("${e.toString()} database Exception");
    }
    debugPrint("$itemTable names table length from insert");
  }

  Future<List<ItemsModel>> getItems(int categoryId) async {
    final db = await _mediatationDBService.database;
    try {
      debugPrint(categoryId.toString());
      final List<Map<String, dynamic>> maps = await db.transaction((txn) => txn
          .query(itemTable,
              where: 'category_id = ?',
              orderBy: 'item_id ASC',
              whereArgs: [categoryId]));
      debugPrint("$maps DATA FROM DB IS GET item BY ID");

      if (maps.isNotEmpty) {
        // debugPrint("$maps is not empty maps");

        // If data is found, convert the maps to a list of OyatModel objects
        return List.generate(maps.length, (i) {
          return ItemsModel.fromJsonDb(maps[i]);
        });
      } else {
        // If no data is found, return an empty list
        debugPrint("No item found in the database with sura_id $categoryId");
        return [];
      }
    } on DatabaseException catch (e) {
      // Handle any database exceptions
      debugPrint("${e.toString()} database Exception");
      return [];
    }
  }

  Future<List<ItemsModel>> getFavouritesItem() async {
    final db = await _mediatationDBService.database;
    try {
      return await db.transaction((txn) async {
        final List<Map<String, dynamic>> maps = await txn.query(
          itemTable,
          where: 'is_saved = ?',
          whereArgs: [1],
        );
        debugPrint("$maps DATA FROM DB IS GET IsSaved");

        if (maps.isNotEmpty) {
          debugPrint("$maps is not empty maps");

          return List.generate(maps.length, (i) {
            return ItemsModel.fromJsonDb(maps[i]);
          });
        } else {
          return [];
        }
      });
    } on DatabaseException catch (e) {
      // Handle any database exceptions
      debugPrint("${e.toString()} database Exception");
      return [];
    }
  }

  Future<void> updateFavourite(int itemId, bool isSaved) async {
    final db = await _mediatationDBService.database;
    try {
      await db.transaction((txn) async {
        // transation is used to for db is working well
        await txn.update(itemTable, {"is_saved": isSaved ? 1 : 0},
            where: 'item_id = ?',
            whereArgs: [itemId],
            conflictAlgorithm: ConflictAlgorithm.replace);
      });
      debugPrint('$itemId id data $isSaved update successfully');
    } on DatabaseException catch (e) {
      debugPrint("${e.toString()} database Exception");
    }
  }

  Future<void> updateItems(ItemsModel itemsModel) async {
    final db = await _mediatationDBService.database;
    /* 
    serverdan kegan version bilan tekshirish kerak
     */

    await db.update(
      itemTable,
      itemsModel.toJson(),
      where: 'category_id = ?',
      whereArgs: [itemsModel.categoryId],
    );
  }

  /* VOTES */
  Future<void> insertVotes(VotesModel votesModel) async {
    final db = await _mediatationDBService.database;

    try {
      await db.transaction((txn) async {
        await txn.insert(votesTable, votesModel.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace);
      });
    } on DatabaseException catch (e) {
      debugPrint("${e.toString()} database Exception");
    }
    debugPrint("$votesTable votes table length from insert");
  }

  Future<List<VotesModel>> getVotes() async {
    final db = await _mediatationDBService.database;
    try {
      final List<Map<String, dynamic>> maps = await db
          .transaction((txn) => txn.query(votesTable, orderBy: 'vote_id ASC'));
      debugPrint("$maps DATA FROM DB IS GET Votes");

      if (maps.isNotEmpty) {
        // If data is found, convert the maps to a list of OyatModel objects
        return List.generate(maps.length, (i) {
          return VotesModel.fromJsonDb(maps[i]);
        });
      } else {
        // If no data is found, return an empty list
        debugPrint("No item found");
        return [];
      }
    } on DatabaseException catch (e) {
      // Handle any database exceptions
      debugPrint("${e.toString()} database Exception");
      return [];
    }
  }

  Future<void> updateVotes(VotesModel votesModel) async {
    final db = await _mediatationDBService.database;
    /* 
    serverdan kegan version bilan tekshirish kerak
     */

    await db.update(
      votesTable,
      votesModel.toJson(),
      where: 'vote_id = ?',
      whereArgs: [votesModel.voteId],
    );
  }

  Future<void> clearDatabase() async {
    final db = await _mediatationDBService.database;
    await db.delete(categoryTable);
    await db.delete(itemTable);
    await db.delete(votesTable);
    debugPrint('db cleared successfully');
  }
}
