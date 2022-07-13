import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/newCavalo.dart';

abstract class CavaloDao{

  save(NewCavalo cavalo);

  remove(dynamic id);

  Future<List<NewCavalo>> find();

}