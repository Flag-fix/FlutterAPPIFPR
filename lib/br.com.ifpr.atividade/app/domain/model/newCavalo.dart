final String tableCavalo = 'TB_CAVALO';

class NewCavalo {
  static final List<String> values = [
    ID,
    NOME,
    CONTATO,
    FOTO,
    REFERENCIA,
    DATA,
    DESCRICAO,
    CIDADE,
    LINHAGEM,
    HARAS,
    RACA,
    PELAGEM,
    GENERO,
    HABILIDADE,
    PRECO,
  ];

  static final String ID = 'id';
  static final String NOME = 'nome';
  static final String CONTATO = 'contato';
  static final String FOTO = 'foto';
  static final String REFERENCIA = 'referencia';
  static final String DATA = 'data';
  static final String DESCRICAO = 'descricao';
  static final String CIDADE = 'cidade';
  static final String LINHAGEM = 'linhagem';
  static final String HARAS = 'haras';
  static final String RACA = 'raca';
  static final String PELAGEM = 'pelagem';
  static final String GENERO = 'genero';
  static final String HABILIDADE = 'habilidade';
  static final String PRECO = 'preco';

  final dynamic id;
  String nome;
  String contato;
  String foto;
  String referencia;
  DateTime data;
  String descricao;
  String cidade;
  String linhagem;
  String haras;
  String raca;
  String pelagem;
  String genero;
  String habilidade;
  String preco;

  NewCavalo(
      {this.id,
      this.contato,
      this.foto,
      this.referencia,
      this.data,
      this.nome,
      this.descricao,
      this.cidade,
      this.linhagem,
      this.haras,
      this.raca,
      this.pelagem,
      this.genero,
      this.habilidade,
      this.preco});

  NewCavalo copy(
          {int id,
          String nome,
          String contato,
          String foto,
          String referencia,
          DateTime data,
          String descricao,
          String cidade,
          String linhagem,
          String haras,
          String raca,
          String pelagem,
          String genero,
          String habilidade,
          String preco}) =>
      NewCavalo(
          id: id ?? this.id,
          nome: nome ?? this.nome,
          contato: contato ?? this.contato,
          foto: foto ?? this.foto,
          referencia: referencia ?? this.referencia,
          data: data ?? this.data,
          descricao: descricao ?? this.descricao,
          cidade: cidade ?? this.cidade,
          linhagem: linhagem ?? this.linhagem,
          haras: haras ?? this.haras,
          raca: raca ?? this.raca,
          pelagem: pelagem ?? this.pelagem,
          genero: genero ?? this.genero,
          habilidade: habilidade ?? this.habilidade,
          preco: preco ?? this.preco);

  static NewCavalo fromJson(Map<String, Object> json) => NewCavalo(
      id: json[ID] as int,
      nome: json[NOME] as String,
      contato: json[CONTATO] as String,
      foto: json[FOTO] as String,
      referencia: json[REFERENCIA] as String,
      data: DateTime.parse(json[DATA] as String),
      descricao: json[DESCRICAO] as String,
      cidade: json[CIDADE] as String,
      linhagem: json[LINHAGEM] as String,
      haras: json[HARAS] as String,
      raca: json[RACA] as String,
      pelagem: json[PELAGEM] as String,
      genero: json[GENERO] as String,
      habilidade: json[HABILIDADE] as String,
      preco: json[PRECO] as String);

  Map<String, Object> toJson() => {
        ID: id,
        NOME: nome,
        CONTATO: contato,
        FOTO: foto,
        REFERENCIA: referencia,
        DATA: data.toIso8601String(),
        DESCRICAO: descricao,
        CIDADE: cidade,
        LINHAGEM: linhagem,
        RACA: raca,
        HARAS: haras,
        PELAGEM: pelagem,
        GENERO: genero,
        HABILIDADE: habilidade,
        PRECO: preco,
      };
}
