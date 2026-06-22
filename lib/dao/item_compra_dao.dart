import 'package:sqflite/sqflite.dart';
import '../database/db_helper.dart';
import '../models/item_compra.dart';

class ItemCompraDao {
  Future<int> inserir(ItemCompra item) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.insert('itens_compra', item.toMap());
  }

  Future<List<ItemCompra>> listarTodos() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps = await db.query('itens_compra');
    return List.generate(maps.length, (i) {
      return ItemCompra.fromMap(maps[i]);
    });
  }
}
