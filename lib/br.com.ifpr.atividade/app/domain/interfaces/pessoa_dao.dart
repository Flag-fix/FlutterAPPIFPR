


import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/newPessoa.dart';

abstract class PessoaDao{

  save(NewPessoa pessoa);

  remove(dynamic id);

  Future<List<NewPessoa>> find();

}