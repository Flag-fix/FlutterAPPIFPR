
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/newPessoa.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseApp{

  static final DatabaseApp instance = DatabaseApp._init();

  static Database _database;

  DatabaseApp._init();

  Future<Database> get database async{
    if(_database != null) return _database;
    _database = await _initDB('bancoLocal.db');
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

    //Tabela Pessoa
    await db.execute('''
    CREATE TABLE $tablePessoa(
    ${NewPessoa.ID} $idType, 
    ${NewPessoa.NOME} $textType, 
    ${NewPessoa.CONTATO} $textType, 
    ${NewPessoa.FOTO} $textType, 
    ${NewPessoa.REFERENCIA} $textType, 
    ${NewPessoa.DATA} $textType
    )''');
  }

  //Métodos Tabela Pessoa
  Future<NewPessoa> insereDadosPessoa(NewPessoa np) async {
    final db = await instance.database;
    final id = await db.insert(tablePessoa, np.toJson());
    if (id > 0) {
      print("Cadastrado na Tabela Pessoa com Sucesso! Id $id");
    } else {
      print("Erro ao cadastrar na Tabela Pessoa");
    }
    return np.copy(id: id);
  }

  Future<NewPessoa> buscarPorIdPessoa(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tablePessoa,
      columns: NewPessoa.values,
      where: '${NewPessoa.ID} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return NewPessoa.fromJson(maps.first);
    } else {
      throw Exception('ID $id não encontrado');
    }
  }

  Future<List<NewPessoa>> buscarTodasPessoas() async {
    final db = await instance.database;
    final orderBy = '${NewPessoa.ID} ASC';
    final result = await db.query(tablePessoa, orderBy: orderBy);
    return result.map((json) => NewPessoa.fromJson(json)).toList();
  }

  Future<int> atualizarTodasPessoas(NewPessoa ac) async {
    final db = await instance.database;

    return db.update(
      tablePessoa,
      ac.toJson(),
      where: '${NewPessoa.ID} = ?',
      whereArgs: [ac.id],
    );
  }

  Future<int> DeletarPessoaId(int id) async {
    final db = await instance.database;
    return db.delete(
      tablePessoa,
      where: '${NewPessoa.ID} = ?',
      whereArgs: [id],
    );
  }

//Fim metodo Pessoa


}