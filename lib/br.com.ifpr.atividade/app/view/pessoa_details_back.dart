


import 'package:flutter/cupertino.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/newPessoa.dart';

class PessoaDetailsBack{
  BuildContext context;
  NewPessoa pessoa;

  PessoaDetailsBack(this.context){
    pessoa = ModalRoute.of(context).settings.arguments;
  }

  goToBack(){
    Navigator.of(context).pop();
  }
}