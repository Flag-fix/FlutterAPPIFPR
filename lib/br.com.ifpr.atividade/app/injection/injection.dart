import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/database/connectionApi/cavalo_dao_api.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/database/dataBaseConnection.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/database/firestore/cavalo_dao_firestore.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/interfaces/cavalo_dao.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/model/newCavalo.dart';
import 'package:ifpr_flutter/br.com.ifpr.atividade/app/domain/services/cavalo_service.dart';

setupInjection()async{
  GetIt getIt = GetIt.I;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  // getIt.registerSingleton<CavaloDao>(CavaloDaoFirestore());
  getIt.registerSingleton<CavaloDao>(CavaloDaoApi());
  getIt.registerSingleton<CavaloService>(CavaloService());
}