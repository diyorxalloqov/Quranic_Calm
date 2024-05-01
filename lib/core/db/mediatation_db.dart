import 'package:path/path.dart';
import 'package:quranic_calm/modules/global/imports/app_imports.dart';
import 'package:sqflite/sqflite.dart';

class MediatationDb {
  static final MediatationDb _mediatationDBService = MediatationDb._internal();

  factory MediatationDb() => _mediatationDBService;

  MediatationDb._internal();

  static int databaseVersion = 1;
  static String categoryTable = "categoryTable";

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
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $categoryTable (category_id INTEGER PRIMARY KEY, category_lang TEXT, category_name TEXT, category_create_at TEXT)',
    );
  }

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

  Future<List<CategoryModel>?> getCategories() async {
    final db = await _mediatationDBService.database;
    final List<Map<String, dynamic>> maps = await db.transaction((txn) async =>
        await txn.query(categoryTable, orderBy: 'category_id ASC'));
    debugPrint("${maps.length} data length from db");
    return List.generate(maps.length, (i) {
      return CategoryModel.fromJsonDb(maps[i]);
    });
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

  Future<void> clearDatabase() async {
    final db = await _mediatationDBService.database;
    await db.delete(categoryTable);
    debugPrint('db cleared successfully');
  }
}
