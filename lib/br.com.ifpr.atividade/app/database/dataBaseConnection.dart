
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/newCavalo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseApp{

  static final DatabaseApp instance = DatabaseApp._init();

  static Database _database;

  DatabaseApp._init();

  Future<Database> get database async{
    if(_database != null) return _database;
    _database = await _initDB('bancoLocsall.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db,int version) async{
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final intType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';
    final varType = 'VARCHAR(255) NOT NULL';
    final varFKType = 'INTEGER';

    //Tabela Cavalo
    await db.execute('''
    CREATE TABLE $tableCavalo(
    ${NewCavalo.ID} $idType, 
    ${NewCavalo.NOME} $textType, 
    ${NewCavalo.CONTATO} $textType, 
    ${NewCavalo.FOTO} $textType, 
    ${NewCavalo.REFERENCIA} $textType, 
    ${NewCavalo.DATA} $textType
    )''');
  }

  //Métodos Tabela Cavalo
  Future<NewCavalo> insereDadosCavalo(NewCavalo np) async {
    final db = await instance.database;
    final id = await db.insert(tableCavalo, np.toJson());
    if (id > 0) {
      print("Cadastrado na Tabela Cavalo com Sucesso! Id $id");
    } else {
      print("Erro ao cadastrar na Tabela Cavalo");
    }
    return np.copy(id: id);
  }

  Future<NewCavalo> buscarPorIdCavalo(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableCavalo,
      columns: NewCavalo.values,
      where: '${NewCavalo.ID} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return NewCavalo.fromJson(maps.first);
    } else {
      throw Exception('ID $id não encontrado');
    }
  }

  Future<List<NewCavalo>> buscarTodasCavalos() async {
    final db = await instance.database;
    final orderBy = '${NewCavalo.ID} ASC';
    final result = await db.query(tableCavalo, orderBy: orderBy);
    return result.map((json) => NewCavalo.fromJson(json)).toList();
  }

  Future<int> atualizarTodasCavalos(NewCavalo ac) async {
    final db = await instance.database;

    return db.update(
      tableCavalo,
      ac.toJson(),
      where: '${NewCavalo.ID} = ?',
      whereArgs: [ac.id],
    );
  }

  Future<int> DeletarCavaloId(int id) async {
    final db = await instance.database;
    return db.delete(
      tableCavalo,
      where: '${NewCavalo.ID} = ?',
      whereArgs: [id],
    );
  }

//Fim metodo Cavalo


}