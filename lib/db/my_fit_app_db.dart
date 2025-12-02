import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:myfitapp/model/treino.dart';

class MyFitAppDB {
  static final MyFitAppDB instance = MyFitAppDB._init();

  static Database? _database;

  MyFitAppDB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('myfitapp.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINREMENT';

    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';
    final dateTimeType = 'DATETIME NOT NULL';

    await db.execute('''
    CREATE TABLE $tableTreinos (
    ${TreinoField.id} $idType,
    ${TreinoField.titulo} $textType,
    ${TreinoField.validade} $dateTimeType,
    ${TreinoField.ultimoTreino} $textType,
    ${TreinoField.tempoMedio} $textType,
    ${TreinoField.createdAt} $dateTimeType,
    ${TreinoField.updatedAt} $dateTimeType
    )
  ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
