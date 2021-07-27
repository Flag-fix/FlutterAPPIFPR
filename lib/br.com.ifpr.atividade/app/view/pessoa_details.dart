import 'package:flutter/material.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/newPessoa.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/view/pessoa_details_back.dart';

class PessoaDetails extends StatelessWidget {
  const PessoaDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _back = PessoaDetailsBack(context);
    NewPessoa pessoa = _back.pessoa;
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
      var width = constraints.biggest.width;
      var radius = width/3;
      var heigth = constraints.biggest.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            (Uri.tryParse(pessoa.foto).isAbsolute) ?
                CircleAvatar(backgroundImage: NetworkImage(pessoa.foto),radius: radius,) : CircleAvatar(child: Icon(Icons.person, size: width/2,),radius: radius,),
            Center(child: Text('${pessoa.nome}',style: TextStyle(fontSize: 25),),),
            Card(child: ListTile(
              title: Text('Telefone:'),
              subtitle: Text('${pessoa.contato}'),
            ),),
            Card(child: ListTile(
              title: Text('Referência:'),
              subtitle: Text('${pessoa.referencia}'),
            ),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: (){
          _back.goToBack();
        },
      ),
    );
    });
  }
}
