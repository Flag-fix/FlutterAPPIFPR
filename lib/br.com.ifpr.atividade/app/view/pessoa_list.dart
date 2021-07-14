import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/database/dataBaseConnection.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/newPessoa.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/pessoa.dart';
import 'package:flutter/material.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/pessoa_list_back.dart';

class PessoaList extends StatefulWidget {
  @override
  _PessoaListState createState() => _PessoaListState();
}

class _PessoaListState extends State<PessoaList> {

  final _back = PessoaListBack();

  CircleAvatar avatar(String url){
    return (Uri.tryParse(url).isAbsolute) ? CircleAvatar(backgroundImage: NetworkImage(url)) : CircleAvatar(child: Icon(Icons.person));
    }

  Widget editar(Function editar){
    return IconButton(onPressed: editar, icon: Icon(Icons.edit),color: Colors.deepOrange);
  }

  Widget remover(BuildContext context, Function remove){
    return IconButton(
      icon: Icon(Icons.delete),
        color: Colors.red,
        onPressed: (){
        showDialog(context: context,
            builder: (context)=>AlertDialog(
              title: Text("Excluir"),
              content: Text("Confirma Exclusão?"),
              actions: [
                FlatButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text("Não")),
                FlatButton(onPressed: remove, child: Text("Sim")),
              ],
            ));
        },

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contatos'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () async {
                  await Navigator.of(context).pushNamed('form');
                })
          ],
        ),
        body: Observer(
          builder: (context) {
            return FutureBuilder(
                future: _back.lista,
                builder: (context, index) {
                  if (!index.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    List<NewPessoa> _list = index.data;
                    return ListView.builder(
                      padding: const EdgeInsets.all(2.0),
                      itemCount: _list.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          leading: avatar(_list[i].foto),
                          title: Text(
                            _list[i].nome,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text('Ref-' + _list[i].referencia),
                          trailing: Container(
                            width: 100,
                            child: Row(
                              children: [
                                editar((){_back.goToForm(context,_list[i]);}),
                                remover(context,(){
                                  _back.remove(_list[i].id);
                                  Navigator.of(context).pop();
                                }),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                });
          },
        ));
  }
}
