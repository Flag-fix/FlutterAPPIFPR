import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/interfaces/cavalo_dao.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/newCavalo.dart';

class CavaloDaoFirestore implements CavaloDao{
  CollectionReference cavaloCollection;

  CavaloDaoFirestore() {
    cavaloCollection = FirebaseFirestore.instance.collection('cadastroCavalos');
  }

  @override
  Future<List<NewCavalo>> find() async{
    var result = await cavaloCollection.get();
    return result.docs
        .map((e) => NewCavalo(
      id: e.reference.id.toString(),
      nome: e['nome'],
      referencia: e['referencia'],
      contato: e['contato'],
      data: DateTime.parse(e['data'] as String),
      foto: e['foto'],
      preco: e['preco'],
      haras: e['haras'],
      descricao: e['descricao'],
    ))
        .toList();
  }

  @override
  remove(id) {
    cavaloCollection.doc(id).delete();
  }

  @override
  save(NewCavalo cavalo) {
    cavaloCollection.doc(cavalo.id).set({
      'nome': cavalo.nome,
      'referencia': cavalo.referencia,
      'contato': cavalo.contato,
      'data': cavalo.data.toIso8601String(),
      'foto': cavalo.foto,
      'preco': cavalo.preco,
      'haras': cavalo.haras,
      'descricao': cavalo.descricao,
    });
  }
}
