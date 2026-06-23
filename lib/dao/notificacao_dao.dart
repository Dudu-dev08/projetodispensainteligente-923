import 'package:sqflite/sqflite.dart';
import '../database/db_helper.dart';
import '../models/notificacao.dart'; //modelo

class NotificacaoDao {
  Future<int> inserir(Notificacao notificacao) async { //devolve número futuro; assincrono; grava notificacao
    Database db = await DatabaseHelper.instance.database; //conexao banco; espera
    return await db.insert('notificacoes', notificacao.toMap());
  }

  Future<List<Notificacao>> listarTodas() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps = await db.query('notificacoes'); //busca
    return List.generate(maps.length, (i) { //variavel
      return Notificacao.fromMap(maps[i]);
    });
  }
}
