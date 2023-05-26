import 'package:sqf_lite/data/model/mind_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase{

  Database? db;
  String tableName = "minds";
  String columnMind = "mind";
  String columnAuthor = "author";

  LocalDatabase();

  Future<Database> getDb()async{
    if(db == null){
      db = await createDatabase();
      return db!;
    }
    return db!;
  }

  createDatabase()async{
    print("Opening the database");
    String database = await getDatabasesPath();
    String path = "${database}contact.db";
    print("Database path: $path");
    var db = await openDatabase(path, version: 3, onCreate:  populateDb);
    print("Database has been opened");
    print("Database is open: ${db.isOpen}");
    return db;
  }

  void populateDb(Database database, int version)async{
    await database.execute("CREATE TABLE IF NOT EXISTS $tableName("
        "$columnMind TEXT,"
        "$columnAuthor TEXT"
        ")");
  }

  Future addMind(MindModel mindModel)async{
    Database db = await getDb();
    var id = await db.insert(tableName, mindModel.toJson());
    print("Mind id: $id");
  }

  Future<List>getMinds() async{
    Database db  = await getDb();
    var result = await db.query(tableName, columns: [columnMind, columnAuthor]);
    return result.toList();
  }

  Future updateMind(MindModel mindModel, String mind)async{
    Database db = await getDb();
    var id = await db.update(tableName, mindModel.toJson(), where: "$columnMind = ?", whereArgs: [mind]);
    print("Mind id: $id");
  }

  Future<int> deleteMind(String mind)async{
    Database db = await getDb();
    return await db.delete(tableName, where: "$columnMind = ?", whereArgs: [mind]);

  }
}