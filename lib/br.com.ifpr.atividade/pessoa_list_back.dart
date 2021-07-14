import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/newPessoa.dart';
import 'package:mobx/mobx.dart';
import 'app/database/dataBaseConnection.dart';

part 'pessoa_list_back.g.dart';

class PessoaListBack = _PessoaListBack with _$PessoaListBack;

abstract class _PessoaListBack with Store{
  var _service = DatabaseApp.instance;

  @observable
  Future<List<NewPessoa>> lista;

  @action
  updateLista([dynamic value]){
    lista = _service.buscarTodasPessoas();
  }

  _PessoaListBack(){
    updateLista();
  }

  goToForm(BuildContext context, [NewPessoa pessoa]){
    Navigator.of(context).pushNamed('form',arguments: pessoa).then(updateLista);
  }

  remove(int id){
    _service.DeletarPessoaId(id);
    updateLista();
  }

}