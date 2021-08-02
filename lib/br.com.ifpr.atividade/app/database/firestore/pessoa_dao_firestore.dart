import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/interfaces/pessoa_dao.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/newPessoa.dart';

class PessoaDaoFirestore implements PessoaDao{
  CollectionReference pessoaCollection;

  PessoaDaoFirestore() {
    pessoaCollection = FirebaseFirestore.instance.collection('pessoas');
  }

  @override
  Future<List<NewPessoa>> find() async{
    var result = await pessoaCollection.get();
    return result.docs
        .map((e) => NewPessoa(
      id: e.reference.id.toString(),
      nome: e['nome'],
      referencia: e['referencia'],
      contato: e['contato'],
      data: DateTime.parse(e['data'] as String),
      foto: e['foto'],
    ))
        .toList();
  }

  @override
  remove(id) {
    pessoaCollection.doc(id).delete();
  }

  @override
  save(NewPessoa pessoa) {
    pessoaCollection.doc(pessoa.id).set({
      'nome': pessoa.nome,
      'referencia': pessoa.referencia,
      'contato': pessoa.contato,
      'data': pessoa.data.toIso8601String(),
      'foto': pessoa.foto,
    });
  }
}
