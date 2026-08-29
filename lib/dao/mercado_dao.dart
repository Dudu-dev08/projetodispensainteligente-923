import 'package:sqflite/sqflite.dart';
import '../database/db_helper.dart';
import '../models/mercado.dart';

class MercadoDao {
  Future<int> inserir(Mercado mercado) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.insert('mercados', mercado.toMap());
  }

  Future<List<Mercado>> listarTodos() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps = await db.query('mercados');
    await Future.delayed(const Duration(seconds: 5));
    return List.generate(maps.length, (i) {
      return Mercado.fromMap(maps[i]);
    });
  }
}
