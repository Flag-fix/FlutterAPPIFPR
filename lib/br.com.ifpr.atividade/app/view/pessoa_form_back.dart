import 'package:flutter/cupertino.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/database/dataBaseConnection.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/newPessoa.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/services/pessoa_service.dart';
import 'package:mobx/mobx.dart';

part 'pessoa_form_back.g.dart';

class PessoaFormBack = _PessoaFormBack with _$PessoaFormBack;

abstract class _PessoaFormBack with Store{

  var _service = DatabaseApp.instance;
  var _validate = PessoaService();
  bool _nameIsValid;
  bool _phoneIsValid;
  bool _referenciaIsValid;

  @action
  bool get isValid =>_nameIsValid && _phoneIsValid && _referenciaIsValid;

  NewPessoa pessoa;

  _PessoaFormBack(BuildContext context){
    var param = ModalRoute.of(context).settings.arguments;
    pessoa = (param == null) ? NewPessoa() : param;
  }

  salvar() async{
    await _service.insereDadosPessoa(pessoa);
  }

  String validacaoNome(String nome){
    try{
      _validate.validarNome(nome);
      _nameIsValid = true;
    }catch(e){
      _nameIsValid = false;
      return e.toString();
    }
  }

  String validacaoReferencia(String referencia){
    try{
      _validate.validarReferencia(referencia);
      _referenciaIsValid = true;
    }catch(e){
      _referenciaIsValid = false;
      return e.toString();
    }
  }

  String validacaoTelefone(String telefone){
    try{
      _validate.validarTelefone(telefone);
      _phoneIsValid = true;
    }catch(e){
      _phoneIsValid = false;
      return e.toString();
    }
  }




}