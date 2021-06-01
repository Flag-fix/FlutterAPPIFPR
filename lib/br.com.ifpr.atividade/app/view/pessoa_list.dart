import 'package:ifpr_flutter/br.com.ifpr.atividade/app/data/data.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/pessoa.dart';
import 'package:flutter/material.dart';

class PessoaList extends StatelessWidget {
  var _list = lista;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
              appBar: AppBar(
                title: Text('Contatos'),
                actions: [
                  IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        Navigator.of(context).pushNamed('form');
                      })
                ],
              ),
              body: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (_, indice) {
                  Pessoa contact = _list[indice];
                  final avatar = contact.foto.isEmpty  ? CircleAvatar(child: Icon(Icons.person)) : CircleAvatar(  backgroundImage: NetworkImage(contact.foto));
                  return ListTile(
                    leading: avatar,
                    title: Text(contact.nome, style: TextStyle(fontWeight: FontWeight.bold,),),
                    subtitle: Text('Ref-'+contact.referencia),
                  );
                },
              ));
  }
}
