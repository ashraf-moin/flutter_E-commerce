import 'package:ecommerce/data/db/sqlite_manager.dart';
import 'package:ecommerce/data/db/sqlite_table.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class SQLiteManagerImpl extends SQliteManager {

  static  Database? _database;

  Future<Database> get database async=> _database ??= await  _open();
  Future close() async=> await _database ?.close();


  Future<Database> _open()async{
    final rootPath = await getDatabasesPath();
    final dbPath = path.join(rootPath,'eShopping.db');
    // database version
    return openDatabase(dbPath,version: 1,onCreate: _onCreate);
  }


  Future _onCreate(Database db,int version)async{
    await db.execute(productTable);
  }

  @override
  Future<int> deleteAllItem(String tableName)async {
    final db = await database;
    return db.delete(tableName);
  }

  @override
  Future<int> insertItem(String tableName, Map<String, dynamic> toMap) async{
    final db = await database;
    return db.insert(tableName, toMap);
  }

  @override
  Future<List<ProductModel>> getAllCartProduct()async {
   final db = await database;
   final mapList = await db.query(tableProduct);
   return List.generate(mapList.length, (index) => ProductModel.fromJson(mapList[index]));

  }

  @override
  Future<int> deleteProductById(int id) async{
    final db = await database;
    return db.delete(tableProduct,where: 'id=?', whereArgs: [id]);
  }
}