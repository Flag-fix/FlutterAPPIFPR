import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/database/dataBaseConnection.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/newCavalo.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/services/cavalo_service.dart';
import 'package:mobx/mobx.dart';

class CavaloFormBack{
  var _service = GetIt.I.get<CavaloService>();
  var _validate = CavaloService();
  bool _nameIsValid;
  bool _phoneIsValid;
  bool _referenciaIsValid;
  bool _dataIsValid;

  bool get isValid =>_nameIsValid && _phoneIsValid && _referenciaIsValid && _dataIsValid;

  NewCavalo cavalo;

  CavaloFormBack(BuildContext context){
    var param = ModalRoute.of(context).settings.arguments;
    cavalo = (param == null) ? NewCavalo() : param;
  }

  salvar() async{
    await _service.save(cavalo);
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

  String validacaoData(String data){
    try{
      _validate.validarData(data);
      _dataIsValid = true;
    }catch(e){
      _dataIsValid = false;
      return e.toString();
    }
  }




}