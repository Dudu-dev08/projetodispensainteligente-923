import '../database/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class UserDao {
  Future<bool> login(String email, String senha) async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> result = await db.query(
      'usuarios',
      where: 'email = ? AND senha = ?',
      whereArgs: [email, senha],
    );

    return result.isNotEmpty;
  }

  Future<void> criarConta(String email, String senha) async {
    final db = await DatabaseHelper.instance.database;
    await db.insert('usuarios', {
      'email': email,
      'senha': senha,
    });
  }
}
