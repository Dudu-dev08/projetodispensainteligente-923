import 'package:sqflite/sqflite.dart';
import '../database/db_helper.dart';
import '../models/alimento.dart';

class AlimentoDao {
  Future<int> inserir(Alimento alimento) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.insert('alimentos', alimento.toMap());
  }

  Future<List<Alimento>> listarTodos() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps = await db.query('alimentos');
    return List.generate(maps.length, (i) {
      return Alimento.fromMap(maps[i]);
    });
  }
}
