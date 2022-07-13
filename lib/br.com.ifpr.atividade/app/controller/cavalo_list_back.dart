import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/newCavalo.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/services/cavalo_service.dart';
import 'package:mobx/mobx.dart';

import '../my_app.dart';

part 'cavalo_list_back.g.dart';

class CavaloListBack = _CavaloListBack with _$CavaloListBack;

abstract class _CavaloListBack with Store{
/*  var _service = DatabaseApp.instance;*/
  var _service = GetIt.I.get<CavaloService>();

  @observable
  Future<List<NewCavalo>> lista;

  @action
  updateLista([dynamic value]){
    lista = _service.find();
  }

  _CavaloListBack(){
    updateLista();
  }

  goToForm(BuildContext context, [NewCavalo cavalo]){
    Navigator.of(context).pushNamed(MyApp.CAVALO_FORM,arguments: cavalo).then(updateLista);
  }

  goToDetails(BuildContext context, NewCavalo cavalo){
    Navigator.of(context).pushNamed(MyApp.CAVALO_DETAILS,arguments: cavalo);
  }

  remove(dynamic id){
    _service.remove(id);
    updateLista();
  }

}