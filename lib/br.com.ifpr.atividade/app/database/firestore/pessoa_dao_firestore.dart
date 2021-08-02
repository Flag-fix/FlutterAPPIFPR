import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/newPessoa.dart';

class PessoaDaoFirestore {
  CollectionReference pessoaCollection;

  PessoaDaoFirestore() {
    pessoaCollection = FirebaseFirestore.instance.collection('contactPessoa');
  }

  Future<List<NewPessoa>> buscar() async {
    var result = await pessoaCollection.get();
    return result.docs
        .map((e) => NewPessoa(
              id: e.reference.id.toString(),
              nome: e['nome'],
              referencia: e['referencia'],
              contato: e['contato'],
              data: e['data'],
              foto: e['foto'],
            ))
        .toList();
  }

  remover(id) {
    pessoaCollection.doc(id).delete();
  }

  salvar(NewPessoa pessoa) {
    pessoaCollection.doc(pessoa.id).set({
      'nome': pessoa.nome,
      'referencia': pessoa.referencia,
      'contato': pessoa.contato,
      'data': pessoa.data,
      'foto': pessoa.foto,
    });
  }
}
