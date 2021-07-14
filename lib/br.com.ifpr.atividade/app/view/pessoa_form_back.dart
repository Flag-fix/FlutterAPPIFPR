import 'package:flutter/cupertino.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/newPessoa.dart';
import 'package:mobx/mobx.dart';

part 'pessoa_form_back.g.dart';

class PessoaFormBack = _PessoaFormBack with _$PessoaFormBack;

abstract class _PessoaFormBack with Store{

  NewPessoa pessoa;

  _PessoaFormBack(BuildContext context){
    var param = ModalRoute.of(context).settings.arguments;
    pessoa = (param == null) ? NewPessoa() : param;
  }


}