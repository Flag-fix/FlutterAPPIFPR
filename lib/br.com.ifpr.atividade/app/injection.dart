import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/database/dataBaseConnection.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/database/firestore/pessoa_dao_firestore.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/interfaces/pessoa_dao.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/newPessoa.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/services/pessoa_service.dart';

setupInjection()async{
  GetIt getIt = GetIt.I;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  getIt.registerSingleton<PessoaDao>(PessoaDaoFirestore());
  getIt.registerSingleton<PessoaService>(PessoaService());
}