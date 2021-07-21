final String tablePessoa = 'TB_PESSOA';

class NewPessoa {
  static final List<String> values = [
    ID,
    NOME,
    CONTATO,
    FOTO,
    REFERENCIA,
    DATA
  ];

  static final String ID = '_id';
  static final String NOME = 'nome';
  static final String CONTATO = 'contato';
  static final String FOTO = 'foto';
  static final String REFERENCIA = 'referencia';
  static final String DATA = 'data';

  final int id;
  String nome;
  String contato;
  String foto;
  String referencia;
  DateTime data;

  NewPessoa(
      {this.id,
      this.contato,
      this.foto,
      this.referencia,
      this.data,
      this.nome});

  NewPessoa copy({
    int id,
    String nome,
    String contato,
    String foto,
    String referencia,
    DateTime data,
  }) =>
      NewPessoa(
          id: id ?? this.id,
          nome: nome ?? this.nome,
          contato: contato ?? this.contato,
          foto: foto ?? this.foto,
          referencia: referencia ?? this.referencia,
          data: data ?? this.data);

  static NewPessoa fromJson(Map<String, Object> json) => NewPessoa(
      id: json[ID] as int,
      nome: json[NOME] as String,
      contato: json[CONTATO] as String,
      foto: json[FOTO] as String,
      referencia: json[REFERENCIA] as String,
      data: DateTime.parse(json[DATA] as String));

  Map<String, Object> toJson() => {
        ID: id,
        NOME: nome,
        CONTATO: contato,
        FOTO: foto,
        REFERENCIA: referencia,
        DATA: data.toIso8601String()
      };
}
