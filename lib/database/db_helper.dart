import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "dispensa.db";
  static const _databaseVersion = 2;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute('DROP TABLE IF EXISTS alimentos');
    await db.execute('DROP TABLE IF EXISTS itens_compra');
    await db.execute('DROP TABLE IF EXISTS mercados');
    await db.execute('DROP TABLE IF EXISTS notificacoes');
    await _onCreate(db, newVersion);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE alimentos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            validade TEXT NOT NULL,
            status TEXT NOT NULL
          )
          ''');
    
    await db.execute('''
          CREATE TABLE itens_compra (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            quantidade INTEGER NOT NULL
          )
          ''');

    await db.execute('''
          CREATE TABLE mercados (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            endereco TEXT NOT NULL
          )
          ''');

    await db.execute('''
          CREATE TABLE notificacoes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titulo TEXT NOT NULL,
            data TEXT NOT NULL,
            mensagem TEXT NOT NULL
          )
          ''');

    await db.insert('alimentos', {
      'nome': 'Arroz 5kg',
      'validade': '2024-12-31',
      'status': 'bom',
    });
    await db.insert('alimentos', {
      'nome': 'Feijão 1kg',
      'validade': '2024-10-15',
      'status': 'vencendo',
    });
    await db.insert('alimentos', {
      'nome': 'Leite 1L',
      'validade': '2024-06-20',
      'status': 'vencido',
    });

    await db.insert('itens_compra', {
      'nome': 'Macarrão',
      'quantidade': 3,
    });
    await db.insert('itens_compra', {
      'nome': 'Óleo de Soja',
      'quantidade': 2,
    });

    await db.insert('mercados', {
      'nome': 'Supermercado Extra',
      'endereco': 'Av. Principal, 1000',
    });
    await db.insert('mercados', {
      'nome': 'Mercadinho da Esquina',
      'endereco': 'Rua das Flores, 123',
    });

    await db.insert('notificacoes', {
      'titulo': 'Produto Vencendo',
      'data': '2024-06-21',
      'mensagem': 'O Leite 1L está vencido!',
    });
  }
}
