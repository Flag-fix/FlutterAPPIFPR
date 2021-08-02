import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'br.com.ifpr.atividade/app/my_app.dart';

void main() async{
  runApp(MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

