import 'dart:async';
import 'package:gerenciador_vagas_rotativas/data/vacancies/vacancies_app.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database> get db async {
    return _db ?? await initDb();
  }

  DatabaseHelper.internal();

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'vagas.db');

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE Vagas(id INTEGER PRIMARY KEY, nome TEXT, ocupada INTEGER)');
  }

  Future<int> insertVaga(Vacancies vaga) async {
    var dbClient = await db;
    int res = await dbClient.insert("Vagas", vaga.toMap());
    return res;
  }

  Future<List<Vacancies>> getVagas() async {
    var dbClient = await db;
    List<Map<String, dynamic>> list =
        await dbClient.rawQuery('SELECT * FROM Vagas');
    List<Vacancies> vacancies = [];
    for (int i = 0; i < list.length; i++) {
      vacancies.add(Vacancies.fromMap(Map<String, dynamic>.from(list[i])));
    }
    return vacancies;
  }

  Future<int> updateVaga(Vacancies vaga) async {
    var dbClient = await db;
    return await dbClient
        .update("Vagas", vaga.toMap(), where: "id = ?", whereArgs: [vaga.id]);
  }

  Future<int> deleteVaga(int id) async {
    var dbClient = await db;
    return await dbClient.delete("Vagas", where: "id = ?", whereArgs: [id]);
  }
}
