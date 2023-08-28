import 'package:lista_contatos/app/database/sqflite/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao {
  static Database? _database;

  static Future<Database?> get() async {
    if (_database == null) {
      var path = join(await getDatabasesPath(), 'lista_contatos');
      _database = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          db.execute(createTable);
          db.execute(insert1);
          db.execute(insert2);
          db.execute(insert3);
        },
      );
    }

    return _database;
  }
}
