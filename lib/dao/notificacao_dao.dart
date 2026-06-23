import 'package:sqflite/sqflite.dart';
import '../database/db_helper.dart';
import '../models/notificacao.dart';

class NotificacaoDao {
  Future<int> inserir(Notificacao notificacao) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.insert('notificacoes', notificacao.toMap());
  }

  Future<List<Notificacao>> listarTodas() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps = await db.query('notificacoes');
    return List.generate(maps.length, (i) {
      return Notificacao.fromMap(maps[i]);
    });
  }
}
