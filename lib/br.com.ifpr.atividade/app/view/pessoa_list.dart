import 'package:ifpr_flutter/br.com.ifpr.atividade/app/database/dataBaseConnection.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/pessoa.dart';
import 'package:flutter/material.dart';

class PessoaList extends StatefulWidget {
  @override
  _PessoaListState createState() => _PessoaListState();
}

class _PessoaListState extends State<PessoaList> {
  var _list = [];

  Future pegarLista() async{
    var resultado = await DatabaseApp.instance.buscarTodasPessoas();
    setState(() {
      _list = resultado;
    });
  }

  @override
  void initState() {
    pegarLista();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
              appBar: AppBar(
                title: Text('Contatos'),
                actions: [
                  IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () async{
                        await Navigator.of(context).pushNamed('form');
                        await pegarLista();
                      })
                ],
              ),
              body: ListView.separated(
                separatorBuilder: (context, index)=> Divider(color: Colors.black,),
                padding: const EdgeInsets.all(2.0),
                itemCount: _list.length,
                itemBuilder: (context, i) {
                  final avatar = _list[i].foto.isEmpty  ? CircleAvatar(child: Icon(Icons.person)) : CircleAvatar(  backgroundImage: NetworkImage(_list[i].foto));
                  return ListTile(
                    leading: avatar,
                    title: Text(_list[i].nome, style: TextStyle(fontWeight: FontWeight.bold,),),
                    subtitle: Text('Ref-'+_list[i].referencia),
                  );
                },
              ));
  }
}
